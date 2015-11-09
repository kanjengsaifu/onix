<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo $title; ?> - Pusat Sumber Daya Geologi</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="icon" href="favicon.ico" type="image/x-icon" />

    <link rel="stylesheet" href="<?php echo base_url(CSS.'bootstrap/bootstrap.min.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url(CSS.'main.css'); ?>">
</head>
<body>
<!--[if lt IE 7]>
<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<!-- Add your site or application content here -->
<!-- START PAGE CONTAINER -->
<div id="page-home">
    <div class="container" >
        <div id="page-home-title" class="text-center">
            <div class="row">
                <div class="col-md-8">
                    <h1>Pusat Sumber Daya Geologi</h1>
                    <h4> “Menjadi Institusi Yang Handal Dalam Pengungkapan Potensi Sumber Daya Geologi Untuk Peningkatan Investasi Sektor ESDM Guna Menunjang Percepatan Pembangunan Nasional”</h4>
                    <form class="input-group" action="<?php echo base_url('home/search'); ?>">
                        <input type="text" name="search_analisis" class="form-control" placeholder="Masukan Nomor Analisis">
                        <span class="input-group-btn">
                            <button class="btn btn-success"><i class="fa fa-search"></i> Cari</button>
                        </span>
                    </form>
                </div>
                <div class="col-md-4">
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
                            <div class="col-md-6">
                                <button class="btn btn-block">Log In</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

    <div id="page-home-footer">
        <?php $this->load->view('include/footer'); ?>
    </div>

</div>

<!-- END PAGE CONTAINER -->

</body>
</html>

