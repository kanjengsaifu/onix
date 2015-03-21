<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Login</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

    <link rel="stylesheet" href="<?php echo base_url(CSS.'bootstrap.min.css'); ?>" media="screen">
    <link rel="stylesheet" href="<?php echo base_url(CSS.'login_v.css'); ?>" media="screen">
    <script src="<?php echo base_url(JS.'vendor/modernizr-2.6.2.min.js'); ?>"></script>
</head>
<body>
<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<!-- Add your site or application content here -->
<div class="container">
    <div class="row" id="pwd-container">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <section class="login-form">
                <form method="post" action="<?php echo base_url('login'); ?>" role="login">
                    <?php flashdata(); ?>
                    <img src="<?php echo base_url(IMAGES.'logo.png'); ?>" class="img-responsive" alt="" />
                    <input type="text" name="username" placeholder="Username" required class="form-control" />
                    <input type="password" class="form-control" id="password" placeholder="Password" name="password" required="" />
<!--                    <select name="type_user" class="form-control">-->
<!--                        <option value="bb">Batubara</option>-->
<!--                        <option value="lg">Logam</option>-->
<!--                        <option value="nl">Non Logam</option>-->
<!--                        <option value="pb">Panas Bumi</option>-->
<!--                        <option value="tu">Tata Usaha</option>-->
<!--                    </select>-->
                    <input type="hidden" name="type_user" value="2">
                    <button type="submit" name="go" class="btn btn-lg btn-primary btn-block">Sign in</button>

                </form>
            </section>
        </div>

        <div class="col-md-4"></div>
    </div>
</div>
<div class="h5"></div>
<footer><?php $this->load->view('include/footer'); ?></footer>

<!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>-->
<script>window.jQuery || document.write('<script src="<?php echo base_url(JS.'vendor/jquery-1.10.2.min.js'); ?>"><\/script>')</script>
<script src="<?php echo base_url(JS.'bootstrap.min.js'); ?>"></script>
<script src="<?php echo base_url(JS.'plugins.js'); ?>"></script>


<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
<!--<script>-->
<!--    (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=-->
<!--            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;-->
<!--        e=o.createElement(i);r=o.getElementsByTagName(i)[0];-->
<!--        e.src='//www.google-analytics.com/analytics.js';-->
<!--        r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));-->
<!--    ga('create','UA-XXXXX-X');ga('send','pageview');-->
<!--</script>-->
</body>
</html>
