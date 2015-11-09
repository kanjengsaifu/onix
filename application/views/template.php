<!DOCTYPE html>
    <!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
    <!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
    <!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
    <!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><?php echo $title; ?>  - Pusat Sumber Daya Geologi</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="icon" href="favicon.ico" type="image/x-icon" />

        <link rel="stylesheet" href="<?php echo base_url(CSS.'app.css'); ?>">
        <link rel="stylesheet" href="<?php echo base_url(CSS.'main.css'); ?>">
    </head>
    <body>
        <!--[if lt IE 7]>
        <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!-- Add your site or application content here -->
        <!-- START PAGE CONTAINER -->
        <div class="page-container">

            <?php $this->load->view('include/sidebar'); ?>

            <!-- PAGE CONTENT -->
            <div class="page-content">

                <?php $this->load->view('include/header'); ?>

                <!-- PAGE CONTENT WRAPPER -->
                <div class="page-content-wrap">
                    <?php $this->load->view($main_content); ?>

                    <?php $this->load->view('include/footer'); ?>
                </div>
                <!-- END PAGE CONTENT WRAPPER -->
            </div>
            <!-- END PAGE CONTENT -->
        </div>
        <!-- END PAGE CONTAINER -->

        <!-- MESSAGE BOX-->
        <div class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-sign-out"></span> Log <strong>Out</strong> ?</div>
                    <div class="mb-content">
                        <p>Are you sure you want to log out?</p>
                        <p>Press No if youwant to continue work. Press Yes to logout current user.</p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a href="<?php echo base_url('logout'); ?>" class="btn btn-success btn-lg">Yes</a>
                            <button class="btn btn-default btn-lg mb-control-close">No</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MESSAGE BOX-->


        <script type="text/javascript" src="<?php echo base_url(JS.'jquery/jquery.min.js'); ?>"></script>
        <script type="text/javascript" src="<?php echo base_url(JS.'jquery/jquery-ui.min.js'); ?>"></script>
        <script type="text/javascript" src="<?php echo base_url(JS.'bootstrap/bootstrap.min.js'); ?>"></script>
        <script type="text/javascript" src="<?php echo base_url(JS.'bootstrap/bootstrap-datepicker.js'); ?>"></script>
        <script type="text/javascript" src="<?php echo base_url(JS.'bootstrap/bootstrap-select.js'); ?>"></script>
        <script type="text/javascript" src="<?php echo base_url(JS.'icheck/icheck.min.js'); ?>"></script>
        <script type="text/javascript" src="<?php echo base_url(JS.'datatables/jquery.dataTables.min.js'); ?>"></script>
        <script type="text/javascript" src="<?php echo base_url(JS.'mcustomscrollbar/jquery.mCustomScrollbar.min.js'); ?>"></script>

        <?php if(isset($js)): ?>
            <?php foreach($js as $javascript): ?>
                <script type="text/javascript" src="<?php echo base_url(JS.$javascript.'.js'); ?>"></script>
            <?php endforeach; ?>
        <?php endif; ?>

        <script type="text/javascript" src="<?php echo base_url(JS.'plugins.js'); ?>"></script>
        <script type="text/javascript" src="<?php echo base_url(JS.'actions.js'); ?>"></script>
        <script type="text/javascript" src="<?php echo base_url(JS.'labs.js'); ?>"></script>
<!--        <script type="text/javascript" src="--><?php //echo base_url(JS.'main.js'); ?><!--"></script>-->
<!--        <script type="text/javascript" src="--><?php //echo base_url(JS.'labs.js'); ?><!--"></script>-->
    </body>
</html>
