        <section id="page" class="container mTop-30 mBtm-50">
          <div class="row">
            <div class="col-sm-3">
            </div>
            <div class="col-sm-6">
              <div id="result"></div>

              <div class="panel-body frameLR bg-white shadow space-sm">


                <div class="col-md-12">
                  <!-- <img src="images/logo.png" alt="" class="img-responsive"> -->
                  <h3 class="dark-grey text-center">Sign up with Positive Nation Merchant</h3>
                  <form action="" method="post" name="create_merchant" autocomplete="off">
                    <div class="form-group">
                      <label>
                        Business Name
                      </label>
                      <input type="text" name="business_name" class="form-control" id="business_name" value="">
                    </div>

                    <div class="form-group">
                      <label>
                        Business Addreess
                      </label>
                      <input type="text" name="business_address" class="form-control" id="business_address" value="">
                    </div>
                    <div class="form-group">
                      <label>
                        Business Type
                      </label>
                      <select class="form-control" id="business_type_category_id" name="business_type_category_id">
                        <?php foreach ($business_type as $res) { ?>
                        <option value="<?= $res['id'] ?>"><?= $res['name'] ?></option>
                        <?php } ?>
                      </select>
                    </div>

                    <div class="form-group">
                      <label>
                        First name & Last name
                      </label>
                      <input type="text" name="fullname" class="form-control" id="fullname">
                    </div>

                    <div class="form-group">
                      <label>
                        Phone Number (555) 555-1234
                      </label>
                      <input type="text" name="phone_no" class="form-control" id="phone_no"
                        placeholder="Example: (555) 555-1234">
                    </div>

                    <div class="form-group">
                      <label>
                        Email
                      </label>
                      <input type="email" name="email" class="form-control" id="email">
                    </div>

                    <div class="form-group">
                      <label>
                        Password
                      </label>
                      <input type="password" name="password" class="form-control" id="password" value="">
                    </div>

                    <div class="form-group">
                      <input type="checkbox" name="" required>
                      Positive Nation will use your contact details to send you personalised email messages about the
                      latest
                      merchant news, events and products. If you do not wish to receive these messages, please check
                      this box.</a>.
                    </div>

                    <div class="form-group">
                      <input type="checkbox" name="" required>
                      By clicking 'Submit', I confirm that I agree to the Positive Nation Merchant <a href="#">Terms of
                        Use </a> , and have read the <a href="#">Privacy Statement .</a>.
                    </div>

                    <button type="submit" class="btn btn-danger btn-raised ripple-effect mBtm-20" id="submit"
                      style="width: 100%;">
                      Submit
                    </button>


                    Already have an account? <a href="#" data-href="merchant_login">Sign In</a>.
                  </form>
                </div>

                <!-- /tab content -->





                <div class="mBtm-20 visible-xs">
                </div>




              </div>
              <!-- /inner wrap -->
            </div>
          </div>

        </section>