<?php
  require_once('config/conn.php');
  require_once('config/functions.php');
  require_once('class/base.php');
  $base = new Base($conn);
  $data = [];
  extract(array_merge($_GET,$_POST));
  switch ($page) {
    case 'product_view':
      $data['images'] = $base->get_list("select * from tbl_product_images where deleted_flag = 0 and product_id = $id"); 
      break;
    case 'merchant_signup':
      $data['business_type'] = $base->get_list("select * from tbl_business_type_category where deleted_flag = 0"); 
      break;

  }
  echo get_contents(page_url('pages/'.$_SESSION['base_uri'].'/content/'.$page.'.php'), $data);
 ?>