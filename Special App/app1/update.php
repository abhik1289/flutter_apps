<?php

include "connect.php";
http_response_code(205);
$id = $_REQUEST["id"];
$name = $_REQUEST["name"];
$email = $_REQUEST["email"];
$mobile = $_REQUEST["mobile"];
$age = $_REQUEST["age"];
$city = $_REQUEST["city"];

$query = "UPDATE data set name='$name',email='$email',mobile='$mobile',age='$age',city='$city'";
$run = mysqli_query($connect,$query);
if($query){
    print("ok");
}



?>