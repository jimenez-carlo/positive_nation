      <div class="search-form bg-white">
        <div class="container">
          <div class="row">
            <div class="col-sm-4">
              <div class="row">
                <div class="col-md-12">
                  <input class="form-control" placeholder="Search Deals & Coupons" type="text">
                </div>
              </div>
            </div>
            <!-- /.col 4 -->
            <div class="col-sm-6">
              <div class="form-group">
                <select class="form-control" id="departments" name="departments">
                  <option value="0">All</option>
                  <?php foreach ($base->get_list("select * from tbl_category where deleted_flag = 0") as $res) { ?>
                  <option value="<?= $res['id'] ?>"><?= $res['name'] ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>

            <!-- /.col 3 -->
            <div class="col-sm-2">
              <a class="btn btn-raised ripple-effect btn-danger btn-block" href="results.html">
                Search Deals
              </a>
            </div>
            <!-- /.col 1 -->
          </div>
        </div>
      </div>
      <!-- /.search form -->