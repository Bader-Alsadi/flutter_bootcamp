<?php
$name = $phone = $content = "";
include "valdition.php";

echo "
<form method='post'>
<input name='name' >" . p_fun($name) . "
<input name='phone' >" . p_fun($phone) . "
<select name='state'>
<option value='0'>suggestion</option>
<option value='1'>complains</option>
</select><br>
<textarea cols='20' rows='3' name='content'></textarea>" . p_fun($content) . "

<input type='submit' value='save'>

</form>";


include "inser.php";





echo " <table border= 1px solid black border-collapse= 'collapse'>
<tr>
<th>id</th>
<th>name</th>
<th>phone</th>
<th>type</th>
<th>content</th>
<th>updata</th>
<th>delete</th>
</tr>";
include "quary.php";


echo " </table>
";

unset($_POST);
?>