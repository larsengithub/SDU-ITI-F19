<?php 
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}
	
	$_SESSION['logged_in'] = false;

	header("Location:Index.php");

?>