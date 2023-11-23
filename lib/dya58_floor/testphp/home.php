<?php
$folder='images/';
// echo json_encode($_FILES);
$connection = mysqli_connect();
$exe = pathinfo($folder.$_FILES["card_id"]["name"],PATHINFO_EXTENSION);
$allowed=array("png","jpg","jpeg","gif","webp"."pdf","pptx");

if(in_array($exe,$allowed)){
if($_FILES["card_id"]["size"]<=1048576)
move_uploaded_file($_FILES["card_id"]["tmp_name"],$folder.$_FILES["card_id"]["name"]);
else
echo "file size is bigger than allowed";
}else
echo "unsupported file type";

// foreach($_GET as $k=>$p)
// if(is_array($p)){
// foreach($p as $v)
// echo " $k = $v <br>";
// }
// else
// echo " $k = $p <br>";


?> 