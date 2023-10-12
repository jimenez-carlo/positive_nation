<?php


class Base
{
  private $conn;
  public function __construct($db)
  {
    $this->conn = $db;
  }


  public function get_list($sql)
  {
    $data = array();
    $result = mysqli_query($this->conn, $sql);
    while ($row = mysqli_fetch_assoc($result)) {
      $data[] = $row;
    }
    return $data;
  }

  public function get_one($sql)
  {
    if ($result = mysqli_query($this->conn, $sql)) {
      $obj = mysqli_fetch_object($result);
      return $obj;
    }
    return false;
  }

  public function query($sql)
  {
    mysqli_query($this->conn, $sql);
  }

  public function insert_get_id($sql)
  {
    mysqli_query($this->conn, $sql);
    return mysqli_insert_id($this->conn);
  }

  public function escape_data($data = array())
  {
    foreach ($data as $key => $value) {
      if (is_array($value) || is_object($value)) {
        continue;
      } else {
        $value = trim($value);
        $value = stripslashes($value);
        $value = htmlspecialchars($value);
        $data[$key] = mysqli_real_escape_string($this->conn, $value);
      }
      return $data;
    }
  }

  public function response_error($message = "Oops Something Went Wrong!", $title = "System Error!")
  {
    // <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
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

  public function response_success($message = "Action Successfull!", $title = "Action Successfull!")
  {
    //  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
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

  public function response_obj()
  {
    $result = new stdClass();
    $result->status = false;
    $result->result = $this->response_error();
    $result->items = '';
    return $result;
  }

  public function response_landing_error($message = "Oops Something Went Wrong!", $title = "System Error!")
  {
    return sprintf(
      '<div class="alert alert-danger alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong>%s</strong> %s
</div>',
      $title,
      $message
    );
  }

  public function response_landing_success($message = "Action Successfull!", $title = "Action Successfull!")
  {
    return sprintf(
      '<div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
 <strong>%s</strong> %s
</div>',
      $title,
      $message
    );
  }

  public function response_landing_obj()
  {
    $result = new stdClass();
    $result->status = false;
    $result->result = $this->response_landing_error();
    $result->items = '';
    return $result;
  }

  public function close_connection()
  {
    $this->conn->close();
  }

  public function start_transaction()
  {
    return mysqli_begin_transaction($this->conn);
  }

  public function commit_transaction()
  {
    return mysqli_commit($this->conn);
  }

  public function roll_back()
  {
    return mysqli_rollback($this->conn);
  }

  public function save_error($error = '')
  {
    $error = addslashes($error);
    // $this->query("insert into tbl_system_error (message) values('$error')");
  }


  public function get_dropdown()
  {
    extract($_POST);
    $data = $this->get_list("select $value as `value`, $display as `display` from $table where $where = $id ");
    foreach ($data as $res) {
      echo ($res['value'] == $selected) ? "<option value='" . $res['value'] . "' selected> " . $res['display'] . "</option>" : "<option value='" . $res['value'] . "'> " . strtoupper($res['display']) . "</option>";
    }
    die;
  }

  // public function get_user()
  // {
  //   extract($_POST);
  //   $user =  new stdClass();
  //   $user = $this->get_one("select * from tbl_users_info where id = $id limit 1");
  //   $user->city  = (isset($user->city_id) && !empty($user->city_id)) ? $this->get_one("select name from tbl_city where id = $user->city_id limit 1")->name : '';
  //   $user->barangay  = (isset($user->barangay_id) && !empty($user->barangay_id)) ? $this->get_one("select name from tbl_barangay where id = $user->barangay_id limit 1")->name : '';
  //   $user->gender  = (isset($user->gender_id) && !empty($user->gender_id)) ? $this->get_one("select gender from tbl_gender where id = $user->gender_id limit 1")->gender : '';
  //   $user->marital_status  = (isset($user->marital_status_id) && !empty($user->marital_status_id)) ? $this->get_one("select status from tbl_marital_status where id = $user->marital_status_id limit 1")->status : '';
  //   return $user;
  // }

  public function check_duplicate($array)
  {
    return count($array) !== count(array_unique($array));
  }
}