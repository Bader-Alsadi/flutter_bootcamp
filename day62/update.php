<?php

include "db_config.php";

if (isset($_POST['update'])&&!empty($_POST["name"] )&& !empty($_POST["phone"]) &&!empty($_POST["content"])) {

    $name_filed = $_POST['name'];

    $id_filed = $_POST['id'];

    $phone_filed = $_POST['phone'];

    $email_filed = $_POST['email'];

    $state_filed = $_POST['state'];

    $content_filed = $_POST['content'];

    $sql = "UPDATE `table_feedback` SET `name`='$name_filed',`phone`='$phone_filed',`type`=".intval($state_filed).",`content`='$content_filed' WHERE `id`='$id_filed'";

    $result = $conn->query($sql);

    if ($result == TRUE) {

        echo "Record updated successfully.";
    } else {

        echo "Error:" . $sql . "<br>" . $conn->error;
    }
}

if (isset($_GET['idu'])) {

    $id_filed = $_GET['idu'];

    $sql = "SELECT * FROM `table_feedback` WHERE `id`='$id_filed'";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {

        while ($row = $result->fetch_assoc()) {

            $name_filed = $row['name'];

            $phone_filed = $row['phone'];

            $email_filed = $row['email'];

            $state_filed  = $row['state'];

            $content_filed = $row['content'];

            $id_filed = $row['id'];
        }

?>
<?php

    } 
}

?>