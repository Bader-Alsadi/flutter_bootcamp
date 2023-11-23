<?php

include "db_config.php";

if (isset($_POST['update'])) {

    $name = $_POST['name'];

    $id = $_POST['id'];

    $phone = $_POST['phone'];

    $email = $_POST['email'];

    $state = $_POST['state'];

    $content = $_POST['content'];

    $sql = "UPDATE `table_feedback` SET `name`='$name',`phone`='$phone',`type`=".intval($state).",`content`='$content' WHERE `id`='$id'";

    $result = $conn->query($sql);

    if ($result == TRUE) {

        echo "Record updated successfully.";
    } else {

        echo "Error:" . $sql . "<br>" . $conn->error;
    }
}

if (isset($_GET['id'])) {

    $id = $_GET['id'];

    $sql = "SELECT * FROM `table_feedback` WHERE `id`='$id'";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {

        while ($row = $result->fetch_assoc()) {

            $name = $row['name'];

            $phone = $row['phone'];

            $email = $row['email'];

            $state  = $row['state'];

            $content = $row['content'];

            $id = $row['id'];
        }

?>

        <h2>feedback Update Form</h2>


        <form action="" method="post">
            <br>

            name:<br>
            <input type="text" name="name" value="<?php echo $name; ?>">

            <input type="hidden" name="id" value="<?php echo $id; ?>">

            <br>

            phone:<br>

            <input type="text" name="phone" value="<?php echo $phone; ?>">

            <br>

            type:<br>
            <select name='state'>
                <option value='0'>suggestion</option>
                <option value='1'>complains</option>
            </select><br>

            messege:<br>

            <textarea cols='20' rows='3' name='content'></textarea>"

            

            <input type="submit" value="Update" name="update">

        </form>

        </body>

        </html>

<?php

    } else {

        header('Location: view.php');
    }
}

?>