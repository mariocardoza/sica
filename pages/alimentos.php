<?php
//Codigo que muestra solo los errores exceptuando los notice.
error_reporting(E_ALL & ~E_NOTICE);
session_start();
if($_SESSION["logueado"] == TRUE && $_SESSION["tipo"]==1) {
  $nombre=$_SESSION["usuario"];
  $tipo  =$_SESSION["tipo"];
  $id  = $_REQUEST["id"];
}else {
  header("Location:inicio.php");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  
  <meta charset="utf-8">
  <meta name="description" content="Miminium Admin Template v.1">
  <meta name="author" content="Isna Nur Azis">
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Lista Alimentos|SICA</title>

  <!-- start: Css -->
  <link rel="stylesheet" type="text/css" href="../asset/css/bootstrap.min.css">

  <!-- plugins -->
  <link rel="stylesheet" type="text/css" href="../asset/css/plugins/font-awesome.min.css"/>
  <link rel="stylesheet" type="text/css" href="../asset/css/plugins/datatables.bootstrap.min.css"/>
  <link rel="stylesheet" type="text/css" href="../asset/css/plugins/animate.min.css"/>
  <link rel="stylesheet" type="text/css" href="../asset/css/plugins/select2.min.css"/>
   <link rel="stylesheet" type="text/css" href="../asset/css/sweetalert2.css"/>
  <link href="../asset/css/style.css" rel="stylesheet">
  <!-- end: Css -->

  <link rel="shortcut icon" href="../asset/img/logomi.png">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
      <script> 
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
      'La accion ha sido completada.',
      'success'
    );
    document.getElementById('bandera').value='desactivar';
            document.getElementById('baccion').value=id;

            document.turismo.submit();
    
  }
})
        }
         function sweetConfirm2(id,op){
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
        }
        function sweetError(str){
         swal({
  type: 'error',
  title: 'Error...',
  text: ''+str,
  footer: 'Revise que todos los campos esten completados.'
})
        }

      //SWEET ALERTS

       function modify(id)
        {
         
          document.location.href='editalimento.php?id='+id;///////FUNC MODIFICAR ALIMENTO
        }

        function addCantidad(id)
        {
          document.location.href='agregarcantidad.php?id='+id; //////AGRAGAR MAS CANTIDAD A UN ALIMENTO
        }
        function kardex(id)
        {
          document.location.href='kardex.php?id='+id; //////ver kardex
        }
      function confirmar(id,op)
        {
          if (op==1)
           {
            if (sweetConfirm(id,op)) 
            {
            
            }
          }else{
            if (sweetConfirm2(id,op)) {
           
          }else
            {
           
             }
          }


        }

        function filtrar(){
          ide=document.getElementById("op").value;
          $("#ide").val(ide);
          document.form.submit();
        }
      
      </script>
</head>

<body id="mimin" class="dashboard">
<form id="turismo" name="turismo" action="" method="post">
<input type="hidden" name="bandera" id="bandera">
<input type="hidden" name="baccion" id="baccion">


</form>
<form id="form" name="form" action="" method="GET">
<div class="input-group " style="padding-bottom:20px;">
  <input id="ide" type="hidden" class="form-control" name="ide" placeholder="En que año estudio el grado anterior" value="<?php echo $idnota;?>">
  </div>
  </form>
      <!-- comienzo: Header -->
        <?php
        include "header.php";
        ?>
      <!-- fin: Header -->
      <div class="container-fluid mimin-wrapper">
          <!-- inicio: Menu Lateral izquierdo -->
          <?php include "menu.php";?>
          <!-- final:  Menu Lateral izquierdo -->
            <!-- inicio: Contenido -->
            <div id="content">
                <!--inicio Header del contenido-->
               <div class="panel box-shadow-none content-header">
                  <div class="panel-body">
                    <div class="col-md-12">
                        <h3 class="animated fadeInLeft">Listado de Alimentos</h3>
                        <p class="animated fadeInDown">
                          Alimentos <span class="fa-angle-right fa"></span> Complejo Educativo "La Santa Familia"
                        </p>
                    </div>
                  </div>
              </div>
              <!--fin Header del contenido-->
              <div class="col-md-12 top-20 padding-0">
                <div class="col-md-12">
                  <div class="panel">
                    <div class="panel-heading col-md-12">
                    
                          
                               <div class="col-md-2">
                                  <a href="crearAlimentos.php" class="btn btn-success btn-round float-right" style="font-size:20px">Nuevo</a>
                               </div>    
                                                                                 
                    </div>
                    <div class="panel-body">
                      <hr class="col-md-12" style="visibility: hidden;">
                      <div class="responsive-table">
                      <table id="datatables-example" style="font-size:16px" class="table table-striped table-bordered" width="100%" cellspacing="0">
                      <thead>
                        <tr>
                          <th></th>
                          <th>Alimento</th>
                          <th>Unidad de Medida</th>
                          <th>Bodega</th>
                          <th>Estado</th>
                          <th style="text-align: center;">Acciones</th>                         
                        </tr>
                      </thead>
                      <tbody>
                     <?php
                      include "../config/conexion.php";
                      if(!isset($_GET['ide'])){

                        $result = $conexion->query("select a.id, a.nombre as alimento,a.estado as estado, u.nombre_unidad,b.nombre FROM alimentos as a inner join unidad_medidas as u on u.id=a.unidadmedida_id LEFT JOIN bodegas as b on b.id=a.bodega_id");
                      }

                     
                      if ($result) {
                          while ($fila = $result->fetch_object()) {
                            echo "<tr>";
                              echo "<td>
                              <div class='col-md-2' style='margin-top:1px'>
                                <button class='btn ripple-infinite btn-round btn-warning'  onclick='modify(" . $fila->id. ")';>
                               <div>
                                 <span>Editar</span>
                               </div>
                               </button>
                               </div>
                              </td>";
                             echo "<td>" . $fila->alimento . "</td>";
                             echo "<td>" . $fila->nombre_unidad  . "</td>";
                             echo "<td>" . $fila->nombre  . "</td>";
       
                               if ($fila->estado==1) {
                              echo "<td>Activo</td>";
                              }else{
                                echo "<td>Inactivo</td>";
                              }
                            echo "<td style='text-align:center;'>
                            <div class='btn-group'>";
                            if($fila->estado==1){
                             
                             echo "<button align='center' title='Desactivar' type='button' class='btn btn-default' onclick=confirmar(" . $fila->id . ",1);><i class='fa fa-remove'></i>
                                 </button>";
                            echo "<button align='center' title='Ver existencia' type='button' class='btn btn-default' onclick='kardex(" .$fila->id. ");'><i class='fa fa-eye'></i></button> ";

                            echo "<button align='center' title='Agregar Cantidad' type='button' class='btn btn-default' onclick='addCantidad(" .$fila->id. ");'><i class='fa fa-plus'></i></button>";  
                           }else
                           {
                              
                             
                              echo "<button align='center' title='Activar' type='button' class='btn btn-default' onclick=confirmar(" . $fila->id . ",2);><i class='fa fa-check'></i>
                                </button>";
                          }
                          echo "</div></td>";
                                                 
        
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
              </div>
            </div>
          <!-- final: Contenido -->


   

<!-- start: Javascript -->
<script src="../asset/js/jquery.min.js"></script>
<script src="../asset/js/jquery.ui.min.js"></script>
<script src="../asset/js/bootstrap.min.js"></script>
<script src="../asset/js/sweetalert2.js"></script>


<!-- plugins -->
<script src="../asset/js/plugins/moment.min.js"></script>
<script src="../asset/js/plugins/jquery.datatables.min.js"></script>
<script src="../asset/js/plugins/datatables.bootstrap.min.js"></script>
<script src="../asset/js/plugins/jquery.nicescroll.js"></script>
<script src="../asset/js/plugins/select2.full.min.js"></script>


<!-- custom -->
<script src="../asset/js/main.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('#datatables-example').DataTable();
  });

   $(".select2-A").select2({
      placeholder: "Seleccione bachillerato",
      allowClear: true
    });

</script>
<!-- end: Javascript -->
</body>
</html>
<?php

include "../config/conexion.php";

$bandera = $_REQUEST["bandera"];
$baccion = $_REQUEST["baccion"];

if ($bandera == "add") {
    $consulta  = "INSERT INTO cliente VALUES('null','" . $nombrecliente . "','" . $apellidocliente . "','" . $duicliente . "','" . $telefonocliente . "','" . $direccioncliente . "')";
    $resultado = $conexion->query($consulta);
    if ($resultado) {
        msg("Exito");
    } else {
        msg("No Exito");
    }
}
if ($bandera == "desactivar") {
  $consulta = "UPDATE alimentos SET estado = '0' WHERE id = '".$baccion."'";
    $resultado = $conexion->query($consulta);
    if ($resultado) {
        // msg("Exito");
    } else {
        // msg("No Exito");
    }
}
if ($bandera == "activar") {
  $consulta = "UPDATE alimentos SET estado = '1' WHERE id = '".$baccion."'";
    $resultado = $conexion->query($consulta);
    if ($resultado) {
        // msg("Exito");
    } else {
        // msg("No Exito");
    }
}

if ($bandera == "desaparecer") {
    $consulta  = "DELETE FROM alimentos where id='" . $baccion . "'";
    $resultado = $conexion->query($consulta);
    if ($resultado) {
        msg("Exito");
    } else {
        msg("No Exito");
    }
}
if ($bandera == 'enviar') {
    echo "<script type='text/javascript'>";
    echo "document.location.href='editpersonal.php?id=" . $baccion . "';";
    echo "</script>";
    # code...
}
function msg($texto)
{
    echo "<script type='text/javascript'>";
    echo "alert('$texto');";
    echo "document.location.href='cmaterias.php';";
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