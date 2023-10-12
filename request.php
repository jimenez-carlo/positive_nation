<?php
  require_once('config/conn.php');
  require_once('config/functions.php');
  require_once('class/base.php');
  require_once('class/customer.php');
  require_once('class/login.php');

  $result = def_response();
  $login = new Login($conn);
  $customer = new Customer($conn);
if (!$_POST || !isset($_POST['form'])) {
  echo json_encode($result);
  die;
}

$form = $_POST['form'];
$result = match ((string)$form) {
    // Landing Page 
   'login_customer ' => $login->login_customer(),
   'login_merchant' => $login->login_merchant(),
   'register_customer' => $login->create_customer(),
   'create_merchant' => $login->create_merchant(),
    default =>  def_response()
};
echo json_encode($result);
die;

 ?>