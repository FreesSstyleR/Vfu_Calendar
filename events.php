<?php
$mysqli = new mysqli("localhost", "root", "", "vfu_app");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

	$specialty = $_GET['specialty'];
	$form = $_GET['form'];
	
	$result = $mysqli->query("SELECT `start`,`end`,`name` as title ,`hall`FROM `event` inner join `group_event` on group_event.event_ID=event.ID inner join `group` on group.ID=group_event.group_ID WHERE group.specialty='Informatics' and group.form='zadochno' ");
	$myArray = array();
	header('Content-Type: application/json');
    while($row = $result->fetch_array(MYSQL_ASSOC)) 
	{
            $myArray[] = $row;
    }
	echo json_encode($myArray);

?>

 