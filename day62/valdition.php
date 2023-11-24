<?php
$name = $phone = $content = " ";
function p_fun ($val){
    echo "<p style='color: red'>$val</p>";
}

if(empty($_POST["name"])&&isset($_POST["name"])) $name="name filed empty";else $name="";
if(empty($_POST["phone"])&&isset($_POST["phone"]))$phone="phone filed empty";else $phone="";
if(empty($_POST["content"])&&isset($_POST["phone"]))$content="content filed empty";else $content="";
?>