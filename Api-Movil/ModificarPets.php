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

if (isset($_POST['id']) && isset($_POST['foto']) && isset($_POST['nombre']) && isset($_POST['raza'])) {
   
    $id = $_POST['id'];
    $foto = $_POST['foto'];
    $nombre = $_POST['nombre'];
    $raza = $_POST['raza'];

    $sql = "UPDATE pets SET foto = '$foto', nombre = '$nombre', raza = '$raza' WHERE id = $id";

    if (mysqli_query($con, $sql)) {
        $users[] = array('mensaje'=> "Mascota Modificada");
    } else {
        $users[] = array('mensaje'=> "Mascota no Modificada");
    }
} else {
    $users[] = array('mensaje'=> "Mascota no Modificada");
}

$json_string = json_encode($users);
echo $json_string;

