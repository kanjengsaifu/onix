<!DOCTYPE html>
<html lang="en" class="body-full-height">
    <head>
        <!-- META SECTION -->
        <title>Pusat Sumber Daya Geologi</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <!-- END META SECTION -->

        <!-- CSS INCLUDE -->
        <link rel="stylesheet" type="text/css" id="theme" href="<?php echo base_url(CSS.'app.css'); ?>"/>
        <link rel="stylesheet" type="text/css" id="theme" href="<?php echo base_url(CSS.'main.css'); ?>"/>
        <!-- EOF CSS INCLUDE -->
    </head>
    <body>

    <div class="login-container">

        <div class="login-box animated fadeInDown">



            <div class="login-logo">

            </div>

            <?php flashdata(); ?>

            <div class="login-title"><strong>Selamat Datang</strong>, Silahkan login</div>
            <form action="<?php echo base_url('login'); ?>" class="form-horizontal" method="post">
                <div class="form-group">
                    <div class="col-md-12">
                        <input type="text" name="username" class="form-control" placeholder="Username"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <input type="password" name="password" class="form-control" placeholder="Password"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-6"></div>
                    <div class="col-md-6">
                        <button class="btn btn-default btn-block">Log In</button>
                    </div>
                </div>
            </form>
            <div class="login-footer">
                <div class="pull-left">
                    &copy; 2015 Pusat Sumber Daya Geologi.
                    <br>
                    <a href="<?php echo base_url(); ?>" class="btn-link">Home</a> |
                    <a href="<?php echo base_url(); ?>" class="btn-link">About</a>
                </div>
            </div>
        </div>

    </div>

    </body>
</html>






