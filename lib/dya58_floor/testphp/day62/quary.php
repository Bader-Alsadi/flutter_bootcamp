<?php

require "db_config.php";

$sql = "select * from table_feedback";
$result = $con->query($sql);


include "delete.php";

if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr><td>$row[id]</td>
    <td>$row[name]</td>
    <td>$row[phone]</td>
    <td>";
        if ($row["type"] == 1) echo 'complains';
        else echo 'suggestion';
        echo "</td>
    <td>$row[content]</td>
    <td><a  href=\"update.php?id= $row[id]\">Edit</a></td>
    <td><a href=\"delete.php?id=$row[id]\">Delete</a></td></tr>";
    }
    // $con->close();
}
