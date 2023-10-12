<?php
class Customer extends Base
{
  private $conn;
  public function __construct($db)
  {
    parent::__construct($db);
    $this->conn = $db;
  }

  public function create()
  {
    extract($this->escape_data($_POST));

    $result = $this->response_obj();
    $blank = 0;
    $errors = array();
    $msg = '';

    $required_fields = array('username', 'email', 'birth_date', 'password', 're_password', 'contact', 'first_name', 'middle_name', 'last_name', 'birth_date');

    foreach ($required_fields as $res) {
      if (empty(${$res})) {
        $errors[] = $res;
        $blank++;
      }
    }

    if (!empty($errors)) {
      $msg .= "Please Fill Blank Fields!";
      $result->result = $this->response_error($msg);
      $result->items = implode(',', $errors);
      return $result;
    }

    if ($password != $re_password) {
      $msg .= "Password Did Not Match!";
      $result->result = $this->response_error($msg);
      $result->items = implode(',', array('password', 're_password'));
      return $result;
    }

    $check_username_name = $this->get_one("SELECT if(max(u.id) is null, 0, max(u.id) + 1) as `res` from tbl_users u where u.name ='$username' and u.deleted_flag = 0 limit 1");

    if (!empty($check_username_name->res)) {
      $msg .= "Username Name Already In-use!";
      $result->result = $this->response_error($msg);
      $result->items = implode(',', array('username'));
      return $result;
    }

    $check_email_name = $this->get_one("SELECT if(max(u.id) is null, 0, max(u.id) + 1) as `res` from tbl_users u where u.email ='$email' and u.deleted_flag = 0 limit 1");

    if (!empty($check_email_name->res)) {
      $msg .= "Email Address Already In-use!";
      $result->result = $this->response_error($msg);
      $result->items = implode(',', array('email'));
      return $result;
    }

    $this->start_transaction();
    try {
      $clinic_id = isset($clinic) ? $clinic : $_SESSION['user']->clinic_id;
      $id = $this->insert_get_id("INSERT INTO tbl_users (`access_id`,`username`,`password`,`email`,`status_id`,`clinic_id`) VALUES('$access', '$username','$password','$email',1,'$clinic_id')");
      $this->query("INSERT INTO tbl_users_info (id,first_name,middle_name,last_name,gender_id,contact_no,birth_date) VALUES('$id','$first_name','$middle_name','$last_name','$gender','$contact','$birth_date')");
      $this->commit_transaction();
      $result->status = true;
      $result->result = $this->response_success("User Created Successfully!", 'Successfull!');
      return $result;
    } catch (mysqli_sql_exception $exception) {
      $this->roll_back();
      $result->result = $this->response_error();
      return $result;
    }
  }

  public function update()
  {
    extract($this->escape_data($_POST));

    if (isset($delete) && !empty($delete)) {
      return $this->delete($delete);
    }

    $result = $this->response_obj();
    $blank = 0;
    $errors = array();
    $msg = '';

    $required_fields = array('username', 'email', 'birth_date', 'contact', 'first_name', 'middle_name', 'last_name');

    foreach ($required_fields as $res) {
      if (empty(${$res})) {
        $errors[] = $res;
        $blank++;
      }
    }

    if (!empty($errors)) {
      $msg .= "Please Fill Blank Fields!";
      $result->result = $this->response_error($msg);
      $result->items = implode(',', $errors);
      return $result;
    }

    $check_username_name = $this->get_one("SELECT if(max(u.id) is null, 0, max(u.id) + 1) as `res` from tbl_users u where u.name ='$username' and u.id <> $id and u.deleted_flag = 0 limit 1");

    if (!empty($check_username_name->res)) {
      $msg .= "Username Name Already In-use!";
      $result->result = $this->response_error($msg);
      $result->items = implode(',', array('username'));
      return $result;
    }

    $check_email_name = $this->get_one("SELECT if(max(u.id) is null, 0, max(u.id) + 1) as `res` from tbl_users u where u.email ='$email' and u.id <> $id and u.deleted_flag = 0 limit 1");

    if (!empty($check_email_name->res)) {
      $msg .= "Email Address Already In-use!";
      $result->result = $this->response_error($msg);
      $result->items = implode(',', array('email'));
      return $result;
    }

    if (!empty($password) && !empty($re_password)) {
      if (empty($password) || empty($password)) {
        $msg .= "Please Fill Blank Fields!";
        $result->result = $this->response_error($msg);
        $result->items = implode(',', array('password', 're_password'));
        return $result;
      }

      $old_password = $this->get_one("Select `password` from tbl_users where id = $id")->password;
      if ($password != $old_password) {
        $msg .= "Wrong Old Password!";
        $result->result = $this->response_error($msg);
        $result->items = implode(',', array('password'));
        return $result;
      }
      $password = $re_password;
    }
    $this->start_transaction();
    try {
      $clinic_id = isset($clinic) ? $clinic : $_SESSION['user']->clinic_id;
      $this->query("UPDATE tbl_users set `access_id` = '$access', `username` = '$username',`password` = '$password', `email` = '$email', `clinic_id`= '$clinic_id' where id = $id");
      $this->query("UPDATE tbl_users_info set `first_name` = '$first_name', `middle_name` = '$middle_name',`last_name` = '$last_name',`contact_no` = '$contact', `birth_date` = '$birth_date' where id = $id");
      $this->commit_transaction();
      $result->status = true;
      $result->result = $this->response_success("User Updated Successfully!", 'Successfull!');
      return $result;
    } catch (mysqli_sql_exception $exception) {
      $this->roll_back();
      $result->result = $this->response_error();
      return $result;
    }
  }

  public function delete($id)
  {
    $result = $this->response_obj();
    $blank = 0;
    $errors = array();
    $msg = '';

    $this->start_transaction();
    try {
      $this->query("UPDATE tbl_users set `deleted_flag` = 1 where id = $id");
      $this->commit_transaction();
      $result->status = true;
      $result->result = $this->response_success("User Deleted Successfully!", 'Successfull!');
      return $result;
    } catch (mysqli_sql_exception $exception) {
      $this->roll_back();
      $result->result = $this->response_error();
      return $result;
    }
  }

  public function login_customer()
  {
    extract($this->escape_data($_POST));

    $result = $this->response_obj();
    $blank = 0;
    $errors = array();
    $msg = '';

    $required_fields = array('login_email', 'login_password');

    foreach ($required_fields as $res) {
      if (empty(${$res})) {
        $errors[] = $res;
        $blank++;
      }
    }

    if (!empty($errors)) {
      $msg .= "Please Fill Blank Fields!";
      $result->result = $this->response_error($msg);
      $result->items = implode(',', $errors);
      return $result;
    }

    if ($password != $re_password) {
      $msg .= "Password Did Not Match!";
      $result->result = $this->response_error($msg);
      $result->items = implode(',', array('password', 're_password'));
      return $result;
    }

    $check_username_name = $this->get_one("SELECT if(max(u.id) is null, 0, max(u.id) + 1) as `res` from tbl_users u where u.name ='$username' and u.deleted_flag = 0 limit 1");

    if (!empty($check_username_name->res)) {
      $msg .= "Username Name Already In-use!";
      $result->result = $this->response_error($msg);
      $result->items = implode(',', array('username'));
      return $result;
    }

    $check_email_name = $this->get_one("SELECT if(max(u.id) is null, 0, max(u.id) + 1) as `res` from tbl_users u where u.email ='$email' and u.deleted_flag = 0 limit 1");

    if (!empty($check_email_name->res)) {
      $msg .= "Email Address Already In-use!";
      $result->result = $this->response_error($msg);
      $result->items = implode(',', array('email'));
      return $result;
    }

    $this->start_transaction();
    try {
      $clinic_id = isset($clinic) ? $clinic : $_SESSION['user']->clinic_id;
      $id = $this->insert_get_id("INSERT INTO tbl_users (`access_id`,`username`,`password`,`email`,`status_id`,`clinic_id`) VALUES('$access', '$username','$password','$email',1,'$clinic_id')");
      $this->query("INSERT INTO tbl_users_info (id,first_name,middle_name,last_name,gender_id,contact_no,birth_date) VALUES('$id','$first_name','$middle_name','$last_name','$gender','$contact','$birth_date')");
      $this->commit_transaction();
      $result->status = true;
      $result->result = $this->response_success("User Created Successfully!", 'Successfull!');
      return $result;
    } catch (mysqli_sql_exception $exception) {
      $this->roll_back();
      $result->result = $this->response_error();
      return $result;
    }
  }
}