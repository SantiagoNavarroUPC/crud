<?php

session_start();
$host = "localhost"; /* equipo */
$user = "id20606556_admin"; /* usuario */
$password = "Santiago_3214225221"; /* clave */
$dbname = "id20606556_mobil03"; /* base de datos */

$con = mysqli_connect($host, $user, $password,$dbname);

if (!$con) {
  die("Connection failed: " . mysqli_connect_error());
}
//echo "Conexion Exitosa";

?>

