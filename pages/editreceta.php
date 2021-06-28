<?php
$id = $_REQUEST["id"];
include "../config/conexion.php";
$result = $conexion->query("select r.id, r.nombre from recetas as r WHERE r.estado = 1 and r.id=".$id);
if ($result) {
    while ($fila = $result->fetch_object()) {
        $idreceta       = $fila->id;
        $nombreR   = $fila->nombre;
    }
}
?>
<!DOCTYPE html>
<?php
//Codigo que muestra solo los errores exceptuando los notice.
error_reporting(E_ALL & ~E_NOTICE);
include '../config/conexion.php';
?>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Recetas</title>
  <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="../asset/css/bootstrap.min.css">


  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="../asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="../asset/css/plugins/animate.min.css"/>
  <link rel="stylesheet" type="text/css" href="../asset/css/plugins/nouislider.min.css"/>
  <link rel="stylesheet" type="text/css" href="../asset/css/plugins/select2.min.css"/>
  <link rel="stylesheet" type="text/css" href="../asset/css/plugins/ionrangeslider/ion.rangeSlider.css"/>
  <link rel="stylesheet" type="text/css" href="../asset/css/plugins/ionrangeslider/ion.rangeSlider.skinFlat.css"/>
  <link rel="stylesheet" type="text/css" href="../asset/css/plugins/bootstrap-material-datetimepicker.css"/>
  <link rel="stylesheet" type="text/css" href="../asset/css/sweetalert2.css"/>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
  <link href="../asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->

  <link rel="shortcut icon" href="../asset/img/logomi.png">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
      <script type="text/javascript">
      //SWEET ALERTS
      function sweetConfirm(id,op){
        swal({
          title: '¿Está seguro que desea continuar?',
          text: "¡No sera posible revertir esta acción!",
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Continuar',
          cancelButtonText:'Cancelar',
        }).then((result) => {
          if (result.value) {
            swal(
              '¡Exito!',
              'La acción ha sido completada.',
              'success'
              );
            document.getElementById('bandera').value='desactivar';
            document.getElementById('baccion').value=id;
            document.turismo.submit();
          }
        })
      }

      function sweetDelete(id){
        swal({
          title: '¿Está seguro de eliminar el ingrediente?',
          text: "¡No sera posible revertir esta acción!",
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Continuar',
          cancelButtonText:'Cancelar',
        }).then((result) => {
          if (result.value) {
            swal(
              '¡Exito!',
              'La acción ha sido completada.',
              'success'
              );
            /*document.getElementById('bandera2').value='eliminar';
            document.getElementById('baccion2').value=id;
            document.ideliminar.submit();*/
            $.ajax({
              url: "deleteI.php",
              type: "POST",
              dataType: "json",
              data: {id:id},
              success: function(response){
                if(response){
                  location.reload();
                }else{
                  alert(error);
                }
              }, error:function(error){

              }
            });
          }
        })
      }
      function sweetConfirm2(id,op){
        swal({
          title: '¿Está seguro que desea continuar?',
          text: "¡No será posible revertir esta acción!",
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Continuar',
          cancelButtonText:'Cancelar',
        }).then((result) =>{
          if(result.value){
            swal(
              '¡Exito!',
              'La accion ha sido completada.',
              'success'
            );
            document.getElementById('bandera').value='activar';
            document.getElementById('baccion').value=id;
            document.turismo.submit();
          }
        })
      }

      function sweetGuardo(str){
        swal(
          'Exito!',
          ''+str,
          'success'
          )
        setTimeout(function() {
          document.location.href='recetas.php';
        }, 2000);
      }
      function sweetError(str){
        swal({
          type: 'error',
          title: 'Error...',
          text: ''+str,
          footer: 'Ha ocurrido un error al registrar la información'
        })
      }
      //SWEET ALERTS
      //Validacion Solo letras js
      function sololetras(e) {
        key=e.keyCode || e.which;
        teclado=String.fromCharCode(key).toLowerCase();
 
        letras="qwertyuiopasdfghjklñzxcvbnm ";
 
        especiales="8-37-38-46-164";
 
        teclado_especial=false;
 
        for(var i in especiales){
          if(key==especiales[i]){
            teclado_especial=true;
            break;
          }
        }

        if(letras.indexOf(teclado)==-1 && !teclado_especial){
          return false;
        }
      }
      //Validacion Solo letras

      function verificar(){
        if(document.getElementById('nombrer').value==""){
          sweetError("Por favor complete los campos.");
        }else{
        //alert(document.getElementById("lastindex"));
        document.getElementById("bandera").value="add";
        document.e_receta.submit();
      }
    }
    //boton cancelar
    function cancel(){
      document.location.href='recetas.php';
    }

    function confirmar(id,op){
      alert(id);
      if(op==1)
      {
        if(sweetConfirm(id,op))
        {

        }
      }else{
        if(sweetConfirm2(id,op))
        {

        }else{

        }
      }
    }

    function eliminar(id){
      sweetDelete(id);
    }

    function usarReceta(id){
      swal({
          title: '¿Está seguro de utilizar esta receta?',
          text: "¡Esta acción hara cambios en la bodega!",
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Continuar',
          cancelButtonText:'Cancelar',
        }).then((result) => {
          if (result.value) {
            swal(
              '¡Exito!',
              'La acción ha sido completada.',
              'success'
              );
            /*document.getElementById('bandera2').value='eliminar';
            document.getElementById('baccion2').value=id;
            document.ideliminar.submit();*/
            $.ajax({
              url: "usarReceta.php",
              type: "POST",
              dataType: "json",
              data: {id:id},
              success: function(response){
                if(response[0]==1){
                  location.reload();
                }else{
                  alert(error);
                }
              }, error:function(error){

              }
            });
          }
        });
    }

</script>
</head>

<body id="mimin" class="dashboard">
  <form id="turismo" name="turismo" action="" method="post"></form>
  <?php include "header.php"; ?>

  <div class="container-fluid mimin-wrapper">
    <?php include "menu.php";?>

    <!-- start: Content -->
    <div id="content">
      <div class="panel box-shadow-none content-header">
        <div class="panel-body">
          <div class="col-md-12" >
            <h3 class="animated fadeInLeft">Receta</h3>
            <p class="animated fadeInDown">
              Receta <span class="fa-angle-right fa"></span>Datos Receta
            </p>
          </div>
        </div>
      </div>

      <form id="ideliminar" method="POST" action="">
        <input type="hidden" name="bandera2" id="bandera2">
        <input type="hidden" name="baccion2" id="baccion2">
      </form>

      <div class="form-element">
        <form id="e_receta" name="e_receta" action="" method="post">
          <input type="hidden" name="bandera" id="bandera" value="edit">
          <input type="hidden" name="baccion" id="baccion" value="<?php echo $idreceta; ?>">
          <input type="hidden" name="lastindex" id="lastindex" value="<?php echo ".$last." ?>">
          <div class="col-md-12">
            <div class="col-md-12 panel panel-info">
              <div class="col-md-12 panel-heading">
                <h4>Informaci&oacute;n Receta</h4>
              </div>
              <div class="col-md-12 panel-body" style="padding-bottom:30px;">
                <div class="col-md-12">
                  <form class="cmxform" id="formcliente" method="post" action="">
                    <div class="col-md-10 text-center">
                      <br><br><br><br>
                      <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
                        <input id="nombrer" type="text" class="form-control" name="nombrer"  placeholder="Nombre" onkeypress="return sololetras(event)" value="<?php echo $nombreR; ?>">
                      </div>
                      <br><br>
                    </div>
                    <div class="col-md-12">
                      <div class="col-md-3">
                        
                      </div>
                      <div class="col-md-3">
                        <input type="button" name="next" class="next action-button btn btn-info btn-sm btn-round" style="font-size:20px;" value="Guardar" onclick="verificar();"/>
                      </div>
                      <div class="col-md-3">
                        <input type="button" name="next" class="next action-button btn btn-danger btn-sm btn-round" style="font-size:20px;" value="Cancelar" onclick="cancel();" />
                      </div>
                    </div>
                  </form>
                </div>

                <div class="col-md-12" style="margin-top:2em;">
                  <a href="nIngredientes.php?idreceta=<?php echo $id;?>" class="float-right next action-button btn btn-success btn-sm btn-round" style="font-size:16px;">Agregar Ingrediente</a>

                  <a onclick="usarReceta(<?php echo $id; ?>)" href="javascript:void(0);" class="float-left next action-button btn btn-success btn-sm btn-round" style="font-size: 16px;">Usar Receta</a>

                  <br><br>
                  <table class="table">
                    <thead>
                      <tr>
                        <th>Ingrediente</th>
                        <th>Cantidad</th>
                        <th>Unidad de medida</th>
                        <th>Acciones</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      include "../config/conexion.php";
                      if(!isset($_GET['ide'])){

                        $result = $conexion->query("select u.nombre_unidad, i.cantidad, a.nombre, i.id FROM ingredientes as i inner join alimentos as a on a.id = i.alimento_id INNER JOIN unidad_medidas as u on u.id = a.unidadmedida_id where i.receta_id=".$id);
                      }

                     
                      if ($result) {
                          while ($fila = $result->fetch_object()) {
                            echo "<tr>";
                             echo "<td>" . $fila->nombre . "</td>";
                             echo "<td>" . $fila->cantidad . "</td>";
                             echo "<td>" . $fila->nombre_unidad . "</td>";

                             echo "<td style='text-align:center;'><button align='center' title='Activar' type='button' class='btn btn-default' onclick=eliminar(" . $fila->id . ");><i class='fa fa-remove'></i>
                                </button></td>";
                            echo "</tr>";
                          }
                       }
                      ?>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
<!-- end: content -->
<!-- start: Mobile -->
<?php 
include "menuMovil.php";
?>
<!-- end: Mobile -->

<!-- start: Javascript -->
<script src="../asset/js/jquery.min.js"></script>
<script src="../asset/js/jquery.ui.min.js"></script>
<script src="../asset/js/bootstrap.min.js"></script>
<script src="../asset/js/sweetalert2.js"></script>

<!-- plugins -->
<script src="../asset/js/plugins/moment.min.js"></script>
<script src="../asset/js/plugins/jquery.knob.js"></script>
<script src="../asset/js/plugins/ion.rangeSlider.min.js"></script>
<script src="../asset/js/plugins/bootstrap-material-datetimepicker.js"></script>
<script src="../asset/js/plugins/jquery.nicescroll.js"></script>
<script src="../asset/js/plugins/jquery.mask.min.js"></script>
<script src="../asset/js/plugins/select2.full.min.js"></script>
<script src="../asset/js/plugins/nouislider.min.js"></script>
<script src="../asset/js/plugins/jquery.validate.min.js"></script>



<!-- custom -->
<script src="../asset/js/main.js"></script>
<script>$(document).ready(function() {
  $('.js-example-basic-single').select2();
});
</script>
<script type="text/javascript">
  $(document).ready(function(){
    $("#formcliente").validate({
      errorElement: "em",
      errorPlacement: function(error, element) {
        $(element.parent("div").addClass("form-animate-error"));
        error.appendTo(element.parent("div"));
      },
      success: function(label) {
        $(label.parent("div").removeClass("form-animate-error"));
      },
      rules: {
        nombrecliente: "required",
        apellidocliente: "required",
        duicliente: "required",
        telefonocliente: "required",
        direccioncliente: "required"
      },
      messages: {
        nombrecliente: "Digita tu nombre",
        apellidocliente: "Digita tu apellido",
        duicliente: "Digita tu DUI",
        telefonocliente: "Digita tu numero telefonico",
        direccioncliente: "Digita tu direcci&oacuten"
      }
    });
    // propose username by combining first- and lastname
    $("#username").focus(function() {
      var firstname = $("#firstname").val();
      var lastname = $("#lastname").val();
      if (firstname && lastname && !this.value) {
        this.value = firstname + "." + lastname;
      }
    });

    $('.mask-dui').mask('00000000-0');
    $('.mask-codigo').mask('AA000');
    $('.mask-time').mask('00:00:00');
    $('.mask-date_time').mask('00/00/0000 00:00:00');
    $('.mask-cep').mask('00000-000');
    $('.mask-telefono').mask('0000-0000');
    $('.mask-nit').mask('0000-000000-000-0');
    $('.mask-phone_with_ddd').mask('(00) 0000-0000');
    $('.mask-phone_us').mask('(000) 000-0000');
    $('.mask-mixed').mask('AAA 000-S0S');
    $('.mask-cpf').mask('000.000.000-00', {reverse: true});
    $('.mask-money').mask('000.000.000.000.000,00', {reverse: true});
    $('.mask-money2').mask("#.##0,00", {reverse: true});
    $('.mask-ip_address').mask('0ZZ.0ZZ.0ZZ.0ZZ', {
      translation: {
        'Z': {
          pattern: /[0-9]/, optional: true
        }
      }
    });
    $('.mask-ip_address').mask('099.099.099.099');
    $('.mask-percent').mask('##0,00%', {reverse: true});
    $('.mask-clear-if-not-match').mask("00/00/0000", {clearIfNotMatch: true});
    $('.mask-placeholder').mask("00/00/0000", {placeholder: "__/__/____"});
    $('.mask-fallback').mask("00r00r0000", {
      translation: {
        'r': {
          pattern: /[\/]/,
          fallback: '/'
        },
        placeholder: "__/__/____"
      }
    });
    $('.mask-selectonfocus').mask("00/00/0000", {selectOnFocus: true});

    var options =  {onKeyPress: function(cep, e, field, options){
      var masks = ['00000-000', '0-00-00-00'];
      mask = (cep.length>7) ? masks[1] : masks[0];
      $('.mask-crazy_cep').mask(mask, options);
    }};

    $('.mask-crazy_cep').mask('00000-000', options);


    var options2 =  {
      onComplete: function(cep) {
        alert('CEP Completed!:' + cep);
      },
      onKeyPress: function(cep, event, currentField, options){
        console.log('An key was pressed!:', cep, ' event: ', event,
          'currentField: ', currentField, ' options: ', options);
      },
      onChange: function(cep){
        console.log('cep changed! ', cep);
      },
      onInvalid: function(val, e, f, invalid, options){
        var error = invalid[0];
        console.log ("Digit: ", error.v, " is invalid for the position: ", error.p, ". We expect something like: ", error.e);
      }
    };

    $('.mask-cep_with_callback').mask('00000-000', options2);

    var SPMaskBehavior = function (val) {
      return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
    },
    spOptions = {
      onKeyPress: function(val, e, field, options) {
        field.mask(SPMaskBehavior.apply({}, arguments), options);
      }
    };

    $('.mask-sp_celphones').mask(SPMaskBehavior, spOptions);



    var slider = document.getElementById('noui-slider');
    noUiSlider.create(slider, {
      start: [20, 80],
      connect: true,
      range: {
        'min': 0,
        'max': 100
      }
    });

    var slider = document.getElementById('noui-range');
    noUiSlider.create(slider, {
    start: [ 20, 80 ], // Handle start position
    step: 10, // Slider moves in increments of '10'
    margin: 20, // Handles must be more than '20' apart
    connect: true, // Display a colored bar between the handles
    direction: 'rtl', // Put '0' at the bottom of the slider
    orientation: 'vertical', // Orient the slider vertically
    behaviour: 'tap-drag', // Move handle on tap, bar is draggable
    range: { // Slider can select '0' to '100'
    'min': 0,
    'max': 100
  },
  pips: { // Show a scale with the slider
    mode: 'steps',
    density: 2
  }
});

    $(".select2-A").select2({
      placeholder: "Select a state",
      allowClear: true
    });

    $(".select2-B").select2({
      tags: true
    });

    $("#range1").ionRangeSlider({
      type: "double",
      grid: true,
      min: -1000,
      max: 1000,
      from: -500,
      to: 500
    });

    $('.dateAnimate').bootstrapMaterialDatePicker({ weekStart : 0, time: false,animation:true});
    $('.date').bootstrapMaterialDatePicker({ weekStart : 0, time: false});
    $('.time').bootstrapMaterialDatePicker({ date: false,format:'HH:mm',animation:true});
    $('.datetime').bootstrapMaterialDatePicker({ format : 'dddd DD MMMM YYYY - HH:mm',animation:true});
    $('.date-fr').bootstrapMaterialDatePicker({ format : 'DD/MM/YYYY HH:mm', lang : 'fr', weekStart : 1, cancelText : 'ANNULER'});
    $('.min-date').bootstrapMaterialDatePicker({ format : 'DD/MM/YYYY HH:mm', minDate : new Date() });


    $(".dial").knob({
      height:80
    });

    $('.dial1').trigger(
     'configure',
     {
       "min":10,
       "width":80,
       "max":80,
       "fgColor":"#FF6656",
       "skin":"tron"
     }
     );

    $('.dial2').trigger(
     'configure',
     {

       "width":80,
       "fgColor":"#FF6656",
       "skin":"tron",
       "cursor":true
     }
     );

    $('.dial3').trigger(
     'configure',
     {

       "width":80,
       "fgColor":"#27C24C",
     }
     );
  });
</script>
<!-- end: Javascript -->
</body>
</html>
<?php

include "../config/conexion.php";

$bandera  = $_REQUEST["bandera"];
$bandera2  = $_REQUEST["bandera2"];
$baccion  = $_REQUEST["baccion"];
$receta  = $_REQUEST["nombrer"];
$unidadmedida_id       = $_REQUEST["unidadmedida_id"];

if ($bandera == "add") {
    //  Validamos que no exista ese mismo bloque para otra materia.
  $query = "select id FROM recetas WHERE id".$baccion."%';";
  $result = $conexion->query($query);
  if($result->num_rows == 0){
    $consulta  = "UPDATE recetas set nombre='" . $receta . "'where id='" . $baccion . "'";
    $resultado = $conexion->query($consulta);
  //echo "".$consulta
    if ($resultado) {
  //Bloque para agarrar el ID de la ultima materia ingresada.
      $result = $conexion->query("select MAX(id) as max from recetas");
      if ($result) {
        while ($fila = $result->fetch_object()) {
          $last=$fila->max;
        }
        //Finde bloque.
        msgAdd("Se actualizó la receta.");
      }
    //Query para agregar a la tabla de muchos a muchos.
    } else {
  //echo("Error materia:".mysqli_error($conexion));
    }
  }
}

if($bandera2 == "eliminar"){
  $baccion2 = $_REQUEST["baccion2"];
  $sql= "DELETE FROM ingredientes where id = '".$baccion2."'";
  $result = $conexion->query($sql);
  if($result)
  {
    msg("Se elimino el ingrediente");
  }
}

function msg($texto)
{
    echo "<script type='text/javascript'>";
    echo "alert('$texto');";
    //echo "document.location.href='materias.php';";
    echo "</script>";
}
function msgAdd($texto)
{
    echo "<script type='text/javascript'>";
    echo "sweetGuardo('$texto');";
    //echo "document.location.href='materias.php';";
    echo "</script>";
}
function msgError($texto)
{
    echo "<script type='text/javascript'>";
    echo "sweetError('$texto');";
    //echo "document.location.href='materias.php';";
    echo "</script>";
}
?>