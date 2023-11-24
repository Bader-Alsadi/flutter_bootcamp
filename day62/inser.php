<?php
echo !empty($value);
if (isset($_POST["save"])) {
    if (!empty($_POST["name"] )&& !empty($_POST["phone"]) &&!empty($_POST["content"]) ) {
        include "db_config.php";
        $sqlQ = "insert into table_feedback values(null,'$_POST[name]','$_POST[phone]'," . intval($_POST["state"]) . ",'$_POST[content]')";;
        if (mysqli_query($conn, $sqlQ)) {
            echo "<br>New record created successfully";
           
        } else {
            echo "Error: " . $sqlQ . "<br>" . mysqli_error($conn);
        }
    }
}
