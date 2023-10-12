        <section id="page" class="container mTop-30 mBtm-50">
          <div class="row">
            <div class="col-sm-3">
            </div>
            <div class="col-sm-6">
              <div id="result"></div>
              <ul class="nav nav-tabs nav-justified" role="tablist">
                <li role="presentation" class="active">
                  <a href="#login" aria-controls="login" role="tab" data-toggle="tab">
                    I Have An Account
                  </a>
                </li>
                <li role="presentation">
                  <a href="#register" aria-controls="register" role="tab" data-toggle="tab">
                    Im A New Customer
                  </a>
                </li>
              </ul>
              <div class="panel-body frameLR bg-white shadow space-sm">
                <?= hash_password('admin123') ?>
                <div class="tab-content">
                  <div role="tabpanel" class="tab-pane active" id="login">
                    <div class="col-md-12">
                      <!-- <h3 class="dark-grey">Login</h3> -->
                      <form action="" method="post" name="login_customer" autocomplete="off">
                        <div class="form-group">
                          <label>
                            Email
                          </label>
                          <input type="text" name="login_email" class="form-control" id="login_email" value="">
                        </div>

                        <div class="form-group">
                          <label>
                            Password
                          </label>
                          <input type="password" name="login_password" class="form-control" id="login_password"
                            value="">
                        </div>

                        <div class="form-group">
                          <button type="submit" class="btn btn-danger btn-raised ripple-effect" id="submit">
                            Login
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>
                  <!-- /tab content -->
                  <div role="tabpanel" class="tab-pane" id="register">
                    <div class="col-md-12">
                      <!-- <h3 class="dark-grey">Register</h3> -->
                      <form action="" method="post" name="register_customer" autocomplete="off">
                        <div class="form-group">
                          <label>
                            Full Name
                          </label>
                          <input type="text" name="fullname" class="form-control" id="fullname" required>
                        </div>

                        <div class="form-group">
                          <label>
                            Email
                          </label>
                          <input type="email" name="email" class="form-control" id="email" required>
                        </div>

                        <div class="form-group">
                          <label>
                            Password
                          </label>
                          <input type="password" name="password" class="form-control" id="password" required>
                        </div>

                        <div class="form-group">
                          <input type="checkbox" name="" required>
                          Keep me signed in on this computer
                        </div>
                        <div class="form-group">
                          <input type="checkbox" name="" required>
                          Yes, I want to save money by receiving personalized Groupon emails with awesome deals.
                          By clicking below, I agree to the <a href="">Terms of Use and have read the Privacy
                            Statement</a>.
                        </div>

                        <div class="form-group">
                          <button type="submit" class="btn btn-danger btn-raised ripple-effect" id="submit">
                            Register
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>

                </div>


                <div class="mBtm-20 visible-xs">
                </div>




              </div>
              <!-- /inner wrap -->
            </div>
          </div>

        </section>