
<?php

include "db_config.php";

if (isset($_GET['id'])) {
    $feed_id = $_GET['id'];
    $sql = "DELETE FROM table_feedback WHERE id=$feed_id";

    $result = $conn->query($sql);

    if ($result == TRUE) {

        echo "Record deleted successfully.";
    } else {

        echo "Error:" . $sql . "<br>" . $conn->error;
    }
}

?>