<?php 
$receta_id=$_POST['id'];

include "../config/conexion.php";
  $sql= "SELECT * FROM ingredientes where receta_id = '".$receta_id."'";
  //echo json_encode($sql);
  $result = $conexion->query($sql);
$fecha=date("Y-m-d H:i:s");
  if($result)
  {
    while ($fila = $result->fetch_object()) {
        $consulta2  = "SELECT cantidad,total from inventarios WHERE alimento_id='".$fila->alimento_id."' ORDER by ID DESC LIMIT 1";
        $resultado2 = $conexion->query($consulta2);
        if($resultado2){
          while ($fila2 = $resultado2->fetch_object())
          {
            $eltotal = 0;

            if($fila->cantidad <= $fila2->cantidad){
              $eltotal=$fila2->total;
              $eltotal=$eltotal-$fila->cantidad;
              $consulta3  = "INSERT INTO inventarios (alimento_id, tipo, fecha, cantidad,total) VALUES('" .$fila->alimento_id. "', '2', '".$fecha."', '".$fila->cantidad."','".$eltotal."')";
              $resultado3 = $conexion->query($consulta3);
              if($resultado3){
                echo json_encode(array(1,"exito","Receta utilizada con éxito"));
              }else{
                echo json_encode(array(-1,"eror","Receta utilizada con error"));
              }
              
            }else{
              echo json_encode(array(2,"eror","Inventarios insuficientes"));
            }
          }
        }
    }
    
  }
  else{
  	echo json_encode(array(-1,"error","Recetan no encontrada"));
  }

?>