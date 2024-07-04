<?php

include "connect.php";
http_response_code(203);
$id = $_REQUEST['id'];
$query = "DELETE FROM data WHERE id='$id'";
$run = mysqli_query($connect,$query);
if(!$run){
    print("Proble No");
}

?>