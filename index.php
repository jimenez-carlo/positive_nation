<?php
require_once('config/functions.php');
require_once('config/conn.php');
require_once('class/base.php');
$base = new Base($conn);
if (!isset($_SESSION['base_url'])) {
  $_SESSION['base_url'] = "http://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
}

if (isset($_SESSION['is_logged_in'])) {
  // $userObj = new User($conn);
  // $user = $userObj->get_user($_SESSION['user']->id);
  // Logged In
  switch ($_SESSION['user']->access_id) {
      // Admin
    case 1:
      $_SESSION['base_uri'] = 'admin';
      include('pages/admin/header.php');
      include('pages/admin/content/index.php');
      include('pages/admin/footer.php');
      break;
      // Merchant
    case 2:
      $_SESSION['base_uri'] = 'merchant';
      include('pages/merchant/header.php');
      include('pages/merchant/content/index.php');
      include('pages/merchant/footer.php');
      break;
      // Customer
    default:
      $_SESSION['base_uri'] = 'customer';
      include('pages/customer/header.php');
      include('pages/customer/content/index.php');
      include('pages/customer/footer.php');
      break;
  }
} else {
  // Landing page here
  $_SESSION['base_uri'] = 'landing';
  include('pages/landing/header.php');
  include('pages/landing/content/index.php');
  include('pages/landing/footer.php');
}