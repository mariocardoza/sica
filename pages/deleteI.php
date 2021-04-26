<?php
$id = $_REQUEST["id"];
//echo json_encode($response);

include "../config/conexion.php";

  $sql= "DELETE FROM ingredientes where id = '".$id."'";
  //echo json_encode($sql);
  $result = $conexion->query($sql);
  if($result)
  {
    echo json_encode(1);
  }
  else{
  	echo json_encode(0);
  }
?>