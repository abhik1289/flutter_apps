<?php


$host = 'localhost';
$dbuser = 'root';
$dbPwd = '';
$dbname='students';

$connect = mysqli_connect($host,$dbuser,$dbPwd,$dbname);
if(!$connect){
print("There is some problem");
}
