<?php
$majors = array("IT","CS","MIS","CID");
$countries = array("YE"=>"Yemen","EG"=>"Egypt","KSA"=>"Saudia Arabia");
$payment = array("kuraimi"=>"Al-Kuraimi-bank","Omagy"=>"Al-Omagy-bank","kutaibi"=>"Al-kutaibi-bank","wasl"=>"Al-wasl-bank");
echo "
<form action='home.php'  method='post' enctype='multipart/form-data' > 
<input name='Sender_name' ><br>
<input name='Sender_email' ><br>
<input name='Sender_phone' ><br>
<textarea cols='40' row='4' name='Sender_message'></textarea><br>
";
foreach($majors as $value)
{
    echo "<input type = 'radio' name='Sender_major' value='$value'>$value";
    echo "<br>";
}
echo "<select name='country'> ";
foreach($countries as $key=>$value)
echo " <option value='$key'>$value</option> ";

echo "</select><br>";
foreach ($payment as $key=>$value)

echo  "<input type='checkbox' name='payment[]' value='$key'>$value";


echo " 
<input type='file'name='card_id' >
<input type='submit' value='send_message'>


</form>";





