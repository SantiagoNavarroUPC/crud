<?php
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: HEAD, GET, POST, PUT, PATCH, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method,Access-Control-Request-Headers, Authorization");
header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];
if ($method == "OPTIONS") {
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method,Access-Control-Request-Headers, Authorization");
header("HTTP/1.1 200 OK");
die();
}


    require "config.php";

    
     if( isset($_POST['foto']) and isset($_POST['nombre']) and isset($_POST['raza']) and isset($_POST['iduser'])) {
         
         $foto=$_POST['foto'];
         $nombre=$_POST['nombre'];
         $raza=$_POST['raza'];
         $iduser=$_POST['iduser'];
         
       $sql = "INSERT INTO pets (id,foto,nombre,raza,iduser) VALUES (default,'$foto', '$nombre', '$raza','$iduser')";
    

    if (mysqli_query($con, $sql)) {
         $users[] = array('mensaje'=> "Mascota Almacenado");
  } else {
       $users = array('mensaje'=> "Mascota no Almacenado");
  }
     }else{
          $users[] = array('mensaje'=> "Mascota no Almacenado");
     }
     

    
   
$json_string = json_encode($users);
echo $json_string;
?>
