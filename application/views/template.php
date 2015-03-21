<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title; ?></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

    <link rel="stylesheet" href="<?php echo base_url(CSS.'bootstrap.min.css'); ?>" media="screen">
    <link rel="stylesheet" href="<?php echo base_url(CSS.'jquery.dataTables.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url(CSS.'dataTables.bootstrap.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url(CSS.'font-awesome.min.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url(CSS.'datepicker.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url(CSS.'jquery.fancybox.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url(CSS.'jquery.gritter.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url(CSS.'normalize.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url(CSS.'main.css'); ?>">
    <script src="<?php echo base_url(JS.'vendor/modernizr-2.6.2.min.js'); ?>"></script>
</head>
<body>
<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<!-- Add your site or application content here -->
<header><?php $this->load->view('include/header'); ?></header>
<div id="main" class="container">
    <?php $this->load->view($main_content); ?>
</div>
<footer><?php $this->load->view('include/footer'); ?></footer>

<!--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>-->
<script>window.jQuery || document.write('<script src="<?php echo base_url(JS.'vendor/jquery-1.10.2.min.js'); ?>"><\/script>')</script>
<script src="<?php echo base_url(JS.'bootstrap.min.js'); ?>"></script>
<script src="<?php echo base_url(JS.'jquery.fancybox.js'); ?>"></script>
<script src="<?php echo base_url(JS.'jquery.form.min.js'); ?>"></script>
<script src="<?php echo base_url(JS.'bootstrap-datepicker.js'); ?>"></script>
<script src="<?php echo base_url(JS.'bootbox.min.js'); ?>"></script>
<script src="<?php echo base_url(JS.'jquery.gritter.min.js'); ?>"></script>
<script src="<?php echo base_url(JS.'jquery.dataTables.min.js'); ?>"></script>
<script src="<?php echo base_url(JS.'dataTables.bootstrap.js'); ?>"></script>
<script src="<?php echo base_url(JS.'plugins.js'); ?>"></script>
<script src="<?php echo base_url(JS.'main.js'); ?>"></script>
<script src="<?php echo base_url(JS.'labs.js'); ?>"></script>


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
