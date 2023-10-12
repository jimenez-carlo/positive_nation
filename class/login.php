<?php
class Login extends Base
{
  private $conn;
  public $drop_down_data;
  public function __construct($db)
  {
    parent::__construct($db);
    $this->conn = $db;
  }

  public function create_customer()
  {
    extract($this->escape_data($_POST));

    $result = $this->response_landing_obj();
    $blank = 0;
    $errors = array();
    $msg = '';

    // Require Fields

    $required_fields = array('fullname', 'email', 'password');

    foreach ($required_fields as $res) {
      if (empty(${$res})) {
        $errors[] = $res;
        $blank++;
      }
    }

    if (!empty($errors)) {
      $msg .= "Please Fill Blank Fields!";
      $result->result = $this->response_landing_error($msg);
      $result->items = implode(',', $errors);
      return $result;
    }

    $check_email = $this->get_one("SELECT if(max(u.id) is null, 0, max(u.id) + 1) as `res` from tbl_users u where u.email ='$email' limit 1");


    if (!empty($check_email->res)) {
      $msg .= "Email Already In-use!";
      $result->result = $this->response_landing_error($msg);
      $result->items = implode(',', array('email'));
      return $result;
    }


    $this->start_transaction();
    try {
      $password = hash_password($password);
      $user_id = $this->insert_get_id("INSERT INTO tbl_users (fullname,email,`password`,access_id) VALUES('$fullname', '$email', '$password', 3)");
      // $this->query("INSERT INTO tbl_users_info (id,first_name,last_name,gender_id,contact_no,`address`,birth_date) VALUES('$user_id','$first_name','$last_name','$gender','$contact_no','$address','$birth_date')");

      $this->commit_transaction();
      $result->status = true;
      $result->result = $this->response_success("SignUp Successfully!", 'Successfull!');
      return $result;
    } catch (mysqli_sql_exception $exception) {
      $this->roll_back();
      $new = new self($this->conn);
      $new->save_error($exception->getMessage());
      $result->result = $this->response_error();
      return $result;
    }
  }

  public function login_customer()
  {
    extract($this->escape_data($_POST));

    $result = $this->response_landing_obj();
    $blank = 0;
    $errors = array();
    $msg = '';

    // Require Fields
    $required_fields = array('login_email', 'login_password');
    foreach ($required_fields as $res) {
      if (empty(${$res})) {
        $errors[] = $res;
        $blank++;
      }
    }

    if (!empty($errors)) {
      $msg .= "Please Fill Blank Fields!";
      $result->result = $this->response_landing_error($msg);
      $result->items = implode(',', $errors);
      return $result;
    }

    $user = $this->get_one("SELECT * from tbl_users u where u.email ='$login_email' and u.deleted_flag = 0 and u.access_id = 3 limit 1");
    $check_user = $this->get_one("SELECT if(max(u.id) is null, 0, max(u.id) + 1) as `res` from tbl_users u where u.email ='$login_email' and u.deleted_flag = 0 limit 1");

    if (empty($check_user->res) || !verify_password($login_password, $user->password)) {
      $msg .= "Invalid Username/Password!";
      $result->result = $this->response_landing_error($msg);
      $result->items = implode(',', array('login_email', 'login_password'));
      return $result;
    }

    $_SESSION['is_logged_in'] = true;
    $_SESSION['user'] = $user;
    $result->status = true;
    $result->result = $this->response_landing_success("Please wait...", 'Logging In.,');
    return $result;
  }

  public function create_merchant()
  {
    extract($this->escape_data($_POST));

    $result = $this->response_landing_obj();
    $blank = 0;
    $errors = array();
    $msg = '';

    // Require Fields

    $required_fields = array('business_name', 'business_address', 'fullname', 'phone_no','email','password');

    foreach ($required_fields as $res) {
      if (empty(${$res})) {
        $errors[] = $res;
        $blank++;
      }
    }

    if (!empty($errors)) {
      $msg .= "Please Fill Blank Fields!";
      $result->result = $this->response_landing_error($msg);
      $result->items = implode(',', $errors);
      return $result;
    }

    $check_email = $this->get_one("SELECT if(max(u.id) is null, 0, max(u.id) + 1) as `res` from tbl_users u where u.email ='$email' limit 1");


    if (!empty($check_email->res)) {
      $msg .= "Email Already In-use!";
      $result->result = $this->response_landing_error($msg);
      $result->items = implode(',', array('email'));
      return $result;
    }


    $this->start_transaction();
    try {
      $password = hash_password($password);
      $user_id = $this->insert_get_id("INSERT INTO tbl_users (fullname,email,`password`,access_id) VALUES('$fullname', '$email', '$password', 2)");
      $this->query("INSERT INTO tbl_merchant_info (id,business_name,business_address,phone_no,business_type_category_id) VALUES('$user_id','$business_name','$business_address','$phone_no','$business_type_category_id')");

      $this->commit_transaction();
      $result->status = true;
      $result->result = $this->response_success("SignUp Successfully!", 'Successfull!');
      return $result;
    } catch (mysqli_sql_exception $exception) {
      $this->roll_back();
      $new = new self($this->conn);
      $new->save_error($exception->getMessage());
      $result->result = $this->response_error();
      return $result;
    }
  }

  public function login_merchant()
  {
    extract($this->escape_data($_POST));

    $result = $this->response_landing_obj();
    $blank = 0;
    $errors = array();
    $msg = '';

    // Require Fields
    $required_fields = array('login_email', 'login_password');
    foreach ($required_fields as $res) {
      if (empty(${$res})) {
        $errors[] = $res;
        $blank++;
      }
    }

    if (!empty($errors)) {
      $msg .= "Please Fill Blank Fields!";
      $result->result = $this->response_landing_error($msg);
      $result->items = implode(',', $errors);
      return $result;
    }

    $user = $this->get_one("SELECT * from tbl_users u where u.email ='$login_email' and u.deleted_flag = 0 and u.access_id = 2 limit 1");
    $check_user = $this->get_one("SELECT if(max(u.id) is null, 0, max(u.id) + 1) as `res` from tbl_users u where u.email ='$login_email' and u.deleted_flag = 0 limit 1");

    if (empty($check_user->res) || !verify_password($login_password, $user->password)) {
      $msg .= "Invalid Username/Password!";
      $result->result = $this->response_landing_error($msg);
      $result->items = implode(',', array('login_email', 'login_password'));
      return $result;
    }

    $_SESSION['is_logged_in'] = true;
    $_SESSION['user'] = $user;
    $result->status = true;
    $result->result = $this->response_landing_success("Please wait...", 'Logging In.,');
    return $result;
  }
}