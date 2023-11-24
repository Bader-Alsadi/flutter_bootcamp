<?php

require "db_config.php";

$sql = "select * from table_feedback";
$result = $conn->query($sql);




if (mysqli_num_rows($result) > 0) {
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
    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr><td>$row[id]</td>
    <td>$row[name]</td>
    <td>$row[phone]</td>
    <td>";
        if ($row["type"] == 1) echo 'complains';
        else echo 'suggestion';
        echo "</td>
    <td>$row[content]</td>
    <td><a  href=\"Q3.php?idu=$row[id]\">Edit</a></td>
    <td><a  href=\"Q3.php?id=$row[id]\">Delete</a></td></tr>";
    }

    // $con->close();
} else
    echo "<br>no feedback";
