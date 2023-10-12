<?php
if (!function_exists('clean_data')) {
  function clean_data($value)
  {
    $value = trim($value);
    $value = stripslashes($value);
    $value = htmlspecialchars($value);
    return $value;
  }
}

if (!function_exists('get_contents')) {
  function get_contents($url, $data = array())
  {
    extract($data);
    ob_start();
    include($url);
    return ob_get_clean();
  }
}

if (!function_exists('page_url')) {
  function page_url($page)
  {
    return $page;
  }
}

if (!function_exists('format_date_time')) {
  function format_date_time($date)
  {
    if (empty($date)) {
      return null;
    }
    try {
      return date_format(date_create($date), "Y-m-d h:i:s");
    } catch (\Throwable $th) {
      return $date;
    }
  }
}

if (!function_exists('format_date_time_am_pm')) {
  function format_date_time_am_pm($date)
  {
    if (empty($date)) {
      return null;
    }
    try {
      return date('Y-m-d h:i a', strtotime($date));
    } catch (\Throwable $th) {
      return $date;
    }
  }
}

if (!function_exists('format_date')) {
  function format_date($date)
  {
    if (empty($date)) {
      return null;
    }
    try {
      return date_format(date_create($date), "Y-m-d");
    } catch (\Throwable $th) {
      return $date;
    }
  }
}

if (!function_exists('hash_password')) {
  function hash_password($password)
  {
    $options =  ['cost' => 12];
    return password_hash($password, PASSWORD_BCRYPT, $options);
  }
}

if (!function_exists('verify_password')) {
  function verify_password($password, $hash_password)
  {
    return password_verify($password, $hash_password) ? true : false;
  }
}

if (!function_exists('calculate_price')) {
  function calculate_price($price, $type = 1, $dicount_price = 0, $discount_percentage = 0)
  {
    switch ($type) {
      case 1:
        return number_format($price,2);
        break;
      case 2:
        return number_format(($discount_percentage / 100) * $price,2);
        break;
      case 3:
        return number_format($dicount_price,2);
        break;
      
    }
  }
}

if (!function_exists('error_msg')) {
  function error_msg($message = "Oops Something Went Wrong!", $title = "Error! ")
  {
    $result = '<div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true">
                        ×
                      </span>
                    </button>
                 <i class="fa fa-exclamation-triangle"></i>
                    <strong>
                      ' . $title . '
                    </strong>
                   ' . $message . '
                  </div>';
    return $result;
  }
}

if (!function_exists('success_msg')) {
  function success_msg($message = "Action Successfull!", $title = "Successfull! ")
  {
    $result = '<div class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true">
                        ×
                      </span>
                    </button>
                  <i class="fa fa-check"> </i>
                    <strong>
                      ' . $title . '
                    </strong>
                   ' . $message . '
                  </div>';
    return $result;
  }
}


if (!function_exists('def_response')) {
  function def_response()
  {
    $result = new stdClass();
    $result->status = false;
    $result->result = error_msg();
    $result->items = '';
    return $result;
  }
}