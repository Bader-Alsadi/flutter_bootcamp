<?php
if(empty($_POST["name"]))$name="name filed empty";else $name="";
if(empty($_POST["phone"]))$phone="phone filed empty";else $phone="";
if(empty($_POST["content"]))$content="content filed empty";else $content="";



function p_fun ($val){
    return "<p style='color: red'>$val</p>";
}



?>