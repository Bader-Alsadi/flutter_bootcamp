<?php
$names = ['mohamde','ali','bader'];
echo "<form   method='post'>
<input  name='searesh' > <input type='submit' value='serash'>
</form>";
// print_r($_POST);
if(isset($_POST['searesh']))
{
    foreach($names as $value)
    {
        if (str_contains($value,$_POST['searesh']))
        echo "$value <br>";
    }
    
}else{
    echo "<br>";
    foreach($names as $value)
    echo "$value <br>";

}

?>