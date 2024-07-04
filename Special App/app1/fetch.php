
<?php

include "connect.php";
http_response_code(202);
$sql = "SELECT * FROM data";
$run = mysqli_query($connect, $sql);
$reults = array();

if (!$run) {
    print("proble Something");
} else {
    while ($getData = mysqli_fetch_array($run)) {
        $reults[] = $getData;
    }
}

echo json_encode($reults);







?>