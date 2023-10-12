<div id="content">
  <?php include_once('pages/'.$_SESSION['base_uri'].'/search.php') ?>
  <section id="page" class="container">
    <div class="shadow bg-white mTop-30 frameLR">
      <div class="row">
        <div class="col-md-3 col-sm-4 col-xs-6">
          <div class="l-element">
            <div class="box-icon">
              <div class="icon-wrap">
                <i class="ti-target">
                </i>
              </div>
              <div class="text">
                <h4>
                  Find Your Deal
                </h4>
                <p>
                  Find perfect offer
                </p>
              </div>
            </div>
            <!--/.icon box -->
          </div>
        </div>
        <div class="col-md-3 col-sm-4 col-xs-6">
          <div class="l-element">
            <div class="box-icon">
              <div class="icon-wrap">
                <i class="ti-shopping-cart">
                </i>
              </div>
              <div class="text">
                <h4>
                  Buy Deal
                </h4>
                <p>
                  Buy or save your deal
                </p>
              </div>
            </div>
            <!--/.icon box -->
          </div>
        </div>
        <div class="col-md-3 col-sm-4 col-xs-6">
          <div class="l-element">
            <div class="box-icon">
              <div class="icon-wrap">
                <i class="fa fa-smile-o">
                </i>
              </div>
              <div class="text">
                <h4>
                  Up to 80% Discount
                </h4>
                <p>
                  Save hundreds of dollars
                </p>
              </div>
            </div>
            <!--/.icon box -->
          </div>
        </div>
        <div class="col-md-3 col-sm-4 col-xs-6">
          <div class="l-element">
            <div class="box-icon">
              <div class="icon-wrap">
                <i class="ti-star">
                </i>
              </div>
              <div class="text">
                <h4>
                  Five star Support
                </h4>
                <p>
                  +1 234-567-890
                </p>
              </div>
            </div>
            <!--/.icon box -->
          </div>
        </div>
      </div>
      <!--/.row -->
    </div>
    <!--/.frame -->
    <div class="row">
      <div class="col-sm-8">
        <div class="row">
          <div class="col-sm-12 clearfix">
            <div class="hr-link">
              <hr class="mBtm-50 mTop-30" data-symbol="FEATURED DEALS">
              <div class="view-all">
                <a href="index.html">
                  VIEW ALL
                </a>
              </div>
            </div>
          </div>
        </div>
        <h3 class="margin-0">Best Deals</h3>
        <div class="row">
          <?php foreach ($base->get_list("select p.*,i.image, ifnull(count(l.product_id),0) as likes from tbl_product p inner join tbl_product_images i on i.product_id = p.id left join tbl_product_likes l on l.product_id = p.id where p.deleted_flag = 0 group by p.id order by p.discount_percent, p.discount_percent is not null,p.discount_price is not null,p.discount_price asc limit 4") as $res) { ?>
          <div class="col-sm-6">
            <div class="deal-entry green">

              <?php if(in_array($res['discount_type_id'],[2])){ ?>
              <div class="offer-discount">
                -<?= $res['discount_percent'] ?>%
              </div>
              <?php } ?>
              <div class="image ripple-effect">
                <a href="#" title="#">
                  <img src="files/product_images/<?= $res['image'] ?>" alt="#" class="img-responsive"
                    style="max-width:426px;max-height:243px;width:100%">
                </a>

                <?php if(!empty($res['likes'])){ ?><span class="bought"><i
                    class="ti-tag"></i><?= $res['likes'] ?></span><?php }?>
              </div>
              <!-- /.image -->
              <div class="title">
                <a href="#" target="_blank" title="<?= $res['name'] ?>">
                  <?= $res['name'] ?>
                </a>
              </div>
              <div class="entry-content">
                <div class="prices clearfix">
                  <?php if(in_array($res['discount_type_id'],[2,3])){ ?>
                  <div class="procent">
                    -<?= ($res['discount_type_id'] == 2) ? $res['discount_percent'] : (1-($res['discount_price']/$res['price']))*100 ?>%
                  </div>
                  <?php } ?>
                  <div class="price"><i
                      class="ti-money"></i><b><?= calculate_price($res['price'], $res['discount_type_id'], $res['discount_price']??0, $res['discount_percent']??0) ?></b>
                  </div>
                  <?php if(in_array($res['discount_type_id'],[2,3])){ ?>
                  <div class="old-price"><span><i class="ti-money"></i><?= number_format($res['price'],2) ?></span>
                  </div>
                  <?php } ?>
                </div>
                <p><?= $res['description'] ?></p>
              </div>
              <!--/.entry content -->
              <footer class="info_bar clearfix">
                <ul class="unstyled list-inline row">
                  <!-- <li class="time col-sm-7 col-xs-6 col-lg-8">
                    <i class="ti-timer"></i>
                    <b>8</b>d.
                    <b>20</b>st.
                    <b>58</b>min.</li> -->
                  <li class="info_link col-sm-5 col-xs-6 col-lg-4">
                    <a href="#" class="btn btn-block btn-default btn-raised btn-sm" data-href="product_view"
                      data-params="<?= $res['id'] ?>">
                      View Deal
                    </a>
                  </li>
                </ul>
              </footer>
            </div>
          </div>
          <?php }?>



        </div>

        <!--/row -->
        <div class="row">
          <div class="col-sm-12 clearfix">
            <hr class="hr-grid-space" data-symbol="POPULAR DEALS">
          </div>
        </div>
        <h3 class="margin-0">Trending</h3>
        <div class="row">
          <?php foreach ($base->get_list("select p.*,i.image, ifnull(count(l.product_id),0) as likes from tbl_product p inner join tbl_product_images i on i.product_id = p.id left join tbl_product_likes l on l.product_id = p.id where p.deleted_flag = 0 group by p.id order by p.discount_percent, p.discount_percent is not null,p.discount_price is not null,p.discount_price asc limit 4") as $res) { ?>
          <div class="col-sm-6">
            <div class="deal-entry orange">

              <?php if(in_array($res['discount_type_id'],[2])){ ?>
              <div class="offer-discount">
                -<?= $res['discount_percent'] ?>%
              </div>
              <?php } ?>
              <div class="image ripple-effect">
                <a href="#" title="#">
                  <img src="files/product_images/<?= $res['image'] ?>" alt="#" class="img-responsive"
                    style="max-width:426px;max-height:243px;width:100%">
                </a>

                <?php if(!empty($res['likes'])){ ?><span class="bought"><i
                    class="ti-tag"></i><?= $res['likes'] ?></span><?php }?>
              </div>
              <!-- /.image -->
              <div class="title">
                <a href="#" target="_blank" title="<?= $res['name'] ?>">
                  <?= $res['name'] ?>
                </a>
              </div>
              <div class="entry-content">
                <div class="prices clearfix">
                  <?php if(in_array($res['discount_type_id'],[2,3])){ ?>
                  <div class="procent">
                    -<?= ($res['discount_type_id'] == 2) ? $res['discount_percent'] : (1-($res['discount_price']/$res['price']))*100 ?>%
                  </div>
                  <?php } ?>
                  <div class="price"><i
                      class="ti-money"></i><b><?= calculate_price($res['price'], $res['discount_type_id'], $res['discount_price']??0, $res['discount_percent']??0) ?></b>
                  </div>
                  <?php if(in_array($res['discount_type_id'],[2,3])){ ?>
                  <div class="old-price"><span><i class="ti-money"></i><?= number_format($res['price'],2) ?></span>
                  </div>
                  <?php } ?>
                </div>
                <p><?= $res['description'] ?></p>
              </div>
              <!--/.entry content -->
              <footer class="info_bar clearfix">
                <ul class="unstyled list-inline row">
                  <!-- <li class="time col-sm-7 col-xs-6 col-lg-8">
                    <i class="ti-timer"></i>
                    <b>8</b>d.
                    <b>20</b>st.
                    <b>58</b>min.</li> -->
                  <li class="info_link col-sm-5 col-xs-6 col-lg-4">
                    <a href="#" class="btn btn-block btn-default btn-raised btn-sm" data-href="product_view"
                      data-params="<?= $res['id'] ?>">
                      View Deal
                    </a>
                  </li>
                </ul>
              </footer>
            </div>
          </div>
          <?php }?>
        </div>

        <!--/row -->
        <div class="row">
          <div class="col-sm-12 clearfix">
            <hr class="hr-grid-space" data-symbol="POPULAR DEALS">
          </div>
        </div>
        <h3 class="margin-0">Recommended</h3>
        <div class="row">
          <?php foreach ($base->get_list("select p.*,i.image, ifnull(count(l.product_id),0) as likes from tbl_product p inner join tbl_product_images i on i.product_id = p.id left join tbl_product_likes l on l.product_id = p.id where p.deleted_flag = 0 group by p.id order by p.discount_percent, p.discount_percent is not null,p.discount_price is not null,p.discount_price asc limit 2") as $res) { ?>
          <div class="col-sm-6">
            <div class="deal-entry blue">

              <?php if(in_array($res['discount_type_id'],[2])){ ?>
              <div class="offer-discount">
                -<?= $res['discount_percent'] ?>%
              </div>
              <?php } ?>
              <div class="image ripple-effect">
                <a href="#" title="#">
                  <img src="files/product_images/<?= $res['image'] ?>" alt="#" class="img-responsive"
                    style="max-width:426px;max-height:243px;width:100%">
                </a>

                <?php if(!empty($res['likes'])){ ?><span class="bought"><i
                    class="ti-tag"></i><?= $res['likes'] ?></span><?php }?>
              </div>
              <!-- /.image -->
              <div class="title">
                <a href="#" target="_blank" title="<?= $res['name'] ?>">
                  <?= $res['name'] ?>
                </a>
              </div>
              <div class="entry-content">
                <div class="prices clearfix">
                  <?php if(in_array($res['discount_type_id'],[2,3])){ ?>
                  <div class="procent">
                    -<?= ($res['discount_type_id'] == 2) ? $res['discount_percent'] : (1-($res['discount_price']/$res['price']))*100 ?>%
                  </div>
                  <?php } ?>
                  <div class="price"><i
                      class="ti-money"></i><b><?= calculate_price($res['price'], $res['discount_type_id'], $res['discount_price']??0, $res['discount_percent']??0) ?></b>
                  </div>
                  <?php if(in_array($res['discount_type_id'],[2,3])){ ?>
                  <div class="old-price"><span><i class="ti-money"></i><?= number_format($res['price'],2) ?></span>
                  </div>
                  <?php } ?>
                </div>
                <p><?= $res['description'] ?></p>
              </div>
              <!--/.entry content -->
              <footer class="info_bar clearfix">
                <ul class="unstyled list-inline row">
                  <!-- <li class="time col-sm-7 col-xs-6 col-lg-8">
                    <i class="ti-timer"></i>
                    <b>8</b>d.
                    <b>20</b>st.
                    <b>58</b>min.</li> -->
                  <li class="info_link col-sm-5 col-xs-6 col-lg-4">
                    <a href="#" class="btn btn-block btn-default btn-raised btn-sm" data-href="product_view"
                      data-params="<?= $res['id'] ?>">
                      View Deal
                    </a>
                  </li>
                </ul>
              </footer>
            </div>
          </div>
          <?php }?>
        </div>
        <!--/row -->

      </div>
      <!-- /col 8 -->
      <div class="col-sm-4 sidebar">
        <div class="inner-side shadow">
          <div class="widget widget-add">
            <hr data-symbol="ADVERTISE">
            <img src="http://placehold.it/380x380" alt="add" class="img-responsive">
          </div>
          <div class="widget widget-subscribe">
            <hr data-symbol="SUBSCRIBE">
            <div class="newsletter">
              <h4>
                Get Updates
                <span class="color-orange">
                  (it’s free)
                </span>
              </h4>
              <p>
                Subscribe to our newsletter for good deals, sent out every month.
              </p>
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Email">
                <span class="input-group-btn">
                  <button class="btn btn-danger btn-raised ripple-effect" type="button">
                    Subscribe
                  </button>
                </span>
              </div>
            </div>
          </div>
          <!-- /.widget -->
          <div class="widget widget-menu">
            <hr data-symbol="CATEGORIES">
            <!-- Sidebar navigation -->
            <ul class="nav sidebar-nav">
              <li class="dropdown open">
                <a class="ripple-effect dropdown-toggle" href="#" data-toggle="dropdown">
                  <i class="ti-shine">
                  </i>
                  Travel
                  <span class="sidebar-badge">
                    12
                  </span>
                  <b class="caret">
                  </b>
                </a>
                <ul class="dropdown-menu">
                  <li>
                    <a href="#" tabindex="-1">
                      Europe
                      <span class="sidebar-badge">
                        12
                      </span>
                    </a>
                  </li>
                  <li>
                    <a href="#" tabindex="-1">
                      Promo
                      <span class="sidebar-badge">
                        0
                      </span>
                    </a>
                  </li>
                </ul>
              </li>
              <li>
                <a href="#">
                  <i class="ti-gift">
                  </i>
                  Gifts
                  <span class="sidebar-badge">
                    3
                  </span>
                </a>
              </li>
              <li>
                <a href="#">
                  <i class="ti-shopping-cart">
                  </i>
                  Products
                  <span class="sidebar-badge">
                    456
                  </span>
                </a>
              </li>
              <li>
                <a href="#">
                  <i class="ti-ticket">
                  </i>
                  Tickets
                  <span class="sidebar-badge badge-circle">
                    12
                  </span>
                </a>
              </li>
              <li>
                <a href="#">
                  <i class="ti-pulse">
                  </i>
                  Health
                  <span class="sidebar-badge badge-circle">
                    45
                  </span>
                </a>
              </li>
              <li>
                <a href="#">
                  <i class="ti-direction-alt">
                  </i>
                  Things To Do
                  <span class="sidebar-badge badge-circle">
                    117
                  </span>
                </a>
              </li>
              <li>
                <a href="#">
                  <i class="ti-cut">
                  </i>
                  Fashion
                  <span class="sidebar-badge badge-circle">
                    117
                  </span>
                </a>
              </li>
            </ul>
            <!-- Sidebar divider -->
          </div>
          <!-- /.widget -->
          <div class="widget widget-tags">
            <hr class="mBtm-50 mTop-30" data-symbol="POPULAR TAGS">
            <ul class="tags">
              <li>
                <a href="#" class="tag">
                  Vacation
                </a>
              </li>
              <li>
                <a href="#" class="tag">
                  Travel
                </a>
              </li>
              <li>
                <a href="#" class="tag">
                  Discount
                </a>
              </li>
              <li>
                <a href="#" class="tag">
                  Croatia
                </a>
              </li>
              <li>
                <a href="#" class="tag">
                  Adriatic
                </a>
              </li>
              <li>
                <a href="#" class="tag">
                  Europe
                </a>
              </li>
              <li>
                <a href="#" class="tag">
                  Monte Negro
                </a>
              </li>
              <li>
                <a href="#" class="tag">
                  New York
                </a>
              </li>
              <li>
                <a href="#" class="tag">
                  Paris
                </a>
              </li>
            </ul>
          </div>
          <!-- /widget -->
          <div class="widget widget-featured">
            <hr data-symbol="BEST RATED">
            <div class="media media-sm entry-rating">
              <div class="media-left">
                <img class="media-object" src="http://placehold.it/200x150" alt="blog-thumb">
              </div>
              <div class="media-body">
                <h5 class="media-heading">
                  <a href="#">
                    Sirenis Punta Cana Resort Casino
                  </a>
                </h5>
                <p class="stars">
                  <i class="ti-star">
                  </i>
                  <i class="ti-star">
                  </i>
                  <i class="ti-star">
                  </i>
                  <i class="ti-start">
                  </i>
                  <i class="ti-star disabled">
                  </i>
                </p>
                <ul class="list-inline">
                  <li>
                    <p class="price line-trough">
                      $399.00
                    </p>
                  </li>
                  <li>
                    <p class="price">
                      $99.00
                    </p>
                  </li>
                </ul>
              </div>
            </div>
            <!-- /entry rating -->
            <div class="media media-sm entry-rating">
              <div class="media-left">
                <img class="media-object" src="http://placehold.it/200x150" alt="blog-thumb">
              </div>
              <div class="media-body">
                <h5 class="media-heading">
                  <a href="#">
                    Plaza Resort Hotel & SPA
                  </a>
                </h5>
                <p class="stars">
                  <i class="ti-star">
                  </i>
                  <i class="ti-star">
                  </i>
                  <i class="ti-star">
                  </i>
                  <i class="ti-start">
                  </i>
                  <i class="ti-star">
                  </i>
                </p>
                <ul class="list-inline">
                  <li>
                    <p class="price line-trough">
                      $423.00
                    </p>
                  </li>
                  <li>
                    <p class="price">
                      $86.00
                    </p>
                  </li>
                </ul>
              </div>
            </div>
            <!-- /entry rating -->
            <div class="media media-sm entry-rating">
              <div class="media-left">
                <img class="media-object" src="http://placehold.it/200x150" alt="blog-thumb">
              </div>
              <div class="media-body">
                <h5 class="media-heading">
                  <a href="#">
                    Wyndham Garden at Palmas del Mar
                  </a>
                </h5>
                <p class="stars">
                  <i class="ti-star">
                  </i>
                  <i class="ti-star">
                  </i>
                  <i class="ti-star">
                  </i>
                  <i class="ti-start">
                  </i>
                  <i class="ti-star">
                  </i>
                </p>
                <ul class="list-inline">
                  <li>
                    <p class="price line-trough">
                      $789.00
                    </p>
                  </li>
                  <li>
                    <p class="price">
                      $243.00
                    </p>
                  </li>
                </ul>
              </div>
            </div>
            <!-- /entry rating -->
          </div>
          <!-- /widget -->
          <div class="widget widget-tabs">
            <div class="row">
              <div class="col-sm-12">
                <div role="tabpanel" id="tabs" class="tabbable responsive">
                  <!-- Nav tabs -->
                  <ul class="nav nav-tabs" role="tablist">

                    <li role="presentation" class="active">
                      <a href="#home" aria-controls="home" role="tab" data-toggle="tab">
                        Latest
                      </a>
                    </li>
                    <li role="presentation">
                      <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">
                        Comments
                      </a>
                    </li>
                  </ul>
                  <!-- Tab panes -->
                  <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="home">
                      <div class="deal-entry green deal-entry-sm">
                        <div class="offer-discount">
                          $347
                        </div>
                        <div class="image ripple-effect">
                          <a href="#" target="_blank" title="#">
                            <img src="http://placehold.it/700x400" alt="#" class="img-responsive">
                          </a>
                          <span class="bought">
                            <i class="ti-tag">
                            </i>
                            21
                          </span>
                          <div class="caption">
                            <h5 class="media-heading">
                              <a href="#">
                                Plaza Resort Hotel &amp; SPA
                              </a>
                            </h5>
                            <p class="stars">
                              <i class="ti-star">
                              </i>
                              <i class="ti-star">
                              </i>
                              <i class="ti-star">
                              </i>
                              <i class="ti-start">
                              </i>
                              <i class="ti-star">
                              </i>
                            </p>
                          </div>
                        </div>
                        <footer class="clearfix">
                          <div class="valueInfo shadow">
                            <div class="value">
                              <p class="value">
                                $422
                              </p>
                              <p class="text">
                                Value
                              </p>
                            </div>
                            <div class="discount">
                              <p class="value">
                                64%
                              </p>
                              <p class="text">
                                Discount
                              </p>
                            </div>
                            <div class="save">
                              <p class="value">
                                $76
                              </p>
                              <p class="text">
                                SAVINGS
                              </p>
                            </div>
                          </div>
                        </footer>
                      </div>
                      <!--/.deal entry -->
                      <div class="deal-entry green deal-entry-sm">
                        <div class="offer-discount">
                          $245
                        </div>
                        <div class="image ripple-effect">
                          <a href="#" target="_blank" title="#">
                            <img src="http://placehold.it/700x400" alt="#" class="img-responsive">
                          </a>
                          <span class="bought">
                            <i class="ti-tag">
                            </i>
                            21
                          </span>
                          <div class="caption">
                            <h5 class="media-heading">
                              <a href="#">
                                Plaza Resort Hotel &amp; SPA
                              </a>
                            </h5>
                            <p class="stars">
                              <i class="ti-star">
                              </i>
                              <i class="ti-star">
                              </i>
                              <i class="ti-star">
                              </i>
                              <i class="ti-start">
                              </i>
                              <i class="ti-star">
                              </i>
                            </p>
                          </div>
                        </div>
                        <footer class="clearfix">
                          <div class="valueInfo shadow">
                            <div class="value">
                              <p class="value">
                                $1,422
                              </p>
                              <p class="text">
                                Value
                              </p>
                            </div>
                            <div class="discount">
                              <p class="value">
                                59%
                              </p>
                              <p class="text">
                                Discount
                              </p>
                            </div>
                            <div class="save">
                              <p class="value">
                                $976
                              </p>
                              <p class="text">
                                SAVINGS
                              </p>
                            </div>
                          </div>
                        </footer>
                      </div>
                      <!--/.deal entry -->
                    </div>
                    <!-- /tab content -->
                    <div role="tabpanel" class="tab-pane" id="profile">
                      <div class="wrap mTop-20">
                        <div class="comment clearfix">
                          <div class="comment-avatar">
                            <img src="http://placehold.it/80x80" alt="avatar">
                          </div>
                          <header>
                            <h5>
                              Really Nice Vacation!
                            </h5>
                            <div class="comment-meta stars">
                              <i class="ti-star">
                              </i>
                              <i class="ti-star">
                              </i>
                              <i class="ti-star">
                              </i>
                              <i class="ti-start">
                              </i>
                              <i class="ti-star">
                              </i>
                              | Today, 10:31
                            </div>
                            <!--/.stars -->
                          </header>

                        </div>
                        <!--/.comments -->
                        <div class="mTop-20">
                        </div>
                        <div class="comment clearfix">
                          <div class="comment-avatar">
                            <img src="http://placehold.it/80x80" alt="avatar">
                          </div>
                          <header>
                            <h5>
                              Great deal guys
                            </h5>
                            <div class="comment-meta stars">
                              <i class="ti-star">
                              </i>
                              <i class="ti-star">
                              </i>
                              <i class="ti-star">
                              </i>
                              <i class="ti-start">
                              </i>
                              <i class="ti-star">
                              </i>
                              | Today, 20:47
                            </div>
                            <!--/.stars -->
                          </header>

                        </div>
                        <!--/.comments -->
                        <div class="mTop-20">
                        </div>
                        <div class="comment clearfix">
                          <div class="comment-avatar">
                            <img src="http://placehold.it/80x80" alt="avatar">
                          </div>
                          <header>
                            <h5>
                              This is Your ratings comment!
                            </h5>
                            <div class="comment-meta stars">
                              <i class="ti-star">
                              </i>
                              <i class="ti-star">
                              </i>
                              <i class="ti-star">
                              </i>
                              <i class="ti-start">
                              </i>
                              <i class="ti-star">
                              </i>
                              | Today, 20:47
                            </div>
                            <!--/.stars -->
                          </header>

                        </div>
                        <!--/.comments -->

                      </div>
                      <!--/wrap -->
                    </div>

                  </div>
                </div>
              </div>
            </div>
            <!-- /.row -->
          </div>
          <!--/.widget -->
          <div class="widget">
            <div class="box-icon">
              <div class="icon-wrap">
                <i class="ti-star">
                </i>
              </div>
              <div class="text">
                <h4>
                  share & get $5 in Deals
                </h4>

                <p>
                  earn $5 in Bosnus Deal when a friend buys this Deal from your personalised link full terms apply
                </p>
              </div>
            </div>
          </div>
          <!--/.widget -->
        </div>
        <!-- /col 4 - sidebar -->
      </div>
      <!-- /main row -->
    </div>
  </section>
</div>