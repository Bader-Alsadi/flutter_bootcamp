<?php

if (isset($_POST)) {
    if (!empty($_POST["name"]) && !empty($_POST["phone"]) && !empty($_POST["content"])) {
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "feedback";
        $con = mysqli_connect($servername, $username, $password, $dbname);
        $sqlQ = "insert into table_feedback values(null,'$_POST[name]','$_POST[phone]'," . intval($_POST["state"]) . ",'$_POST[content]')";;
        if (mysqli_query($con, $sqlQ)) {
            echo "<br>New record created successfully";
           
        } else {
            echo "Error: " . $sqlQ . "<br>" . mysqli_error($conn);
        }
    }
}
