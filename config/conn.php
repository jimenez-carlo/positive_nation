<?php
include_once('constants.php');
session_start();

  // Create connection
  $conn = new mysqli(APP_HOST, APP_USERNAME, APP_PASSWORD, APP_DATABASE);
  // Check connection
  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }

?>