<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>

<body style=" margin-left:35%; margin-right:35%">
<?php include "valdition.php"; ?>
    <?php include "update.php" ?>
    


    <form action="Q3.php" method="post">
        <br>

        name:<br>
        <input type="text" name="name" value="<?php echo $name_filed; ?>"><?php p_fun($name); ?>

        <input type="hidden" name="id" value="<?php echo $id_filed; ?>">

        <br>

        phone:<br>

        <input type="text" name="phone" value="<?php echo $phone_filed; ?>"><?php p_fun($phone); ?>

        <br>

        type:<br>
        <select name='state'>
            <option value='0'>suggestion</option>
            <option value='1'>complains</option>
        </select><br>

        messege:<br>

        <textarea cols='20' rows='3'value="<?php echo $content_filed; ?>" name='content'></textarea><br><?php p_fun($content); ?>
        <?php
        if (isset($_GET['idu'])) {
            echo "<input type='submit' value='Update' name='update'> ";
        } else
            echo "<input type='submit' value='save'  name='save'>";

        ?>
    </form>
    <?php






    // echo "
    // <form method='post' action='Q3.php'>
    // <input name='name' >" . p_fun($name) . "
    // <input name='phone' >" . p_fun($phone) . "
    // <select name='state'>
    // <option value='0'>suggestion</option>
    // <option value='1'>complains</option>
    // </select><br>
    // <textarea cols='20' rows='3' name='content'></textarea>" . p_fun($content) . "

    // <input type='submit' value='save'>

    // </form>";


    include "inser.php";
    include "delete.php";
    include "quary.php";


    echo " </table>
";

    unset($_POST);
    ?>

</body>

</html>