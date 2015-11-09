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
    <div class="container">
        <div class="h3"></div>
        <div class="row">
            <div class="col-md-8">
                <?php if(!$permohonan): ?>
                    <h4>Nomor Analisis <?php echo $nomor_analisis; ?>, tidak ditemukan.</h4>
                    <form class="input-group" action="<?php echo base_url('home/search'); ?>">
                        <input type="text" name="search_analisis" class="form-control" placeholder="Masukan Nomor Analisis" value="<?php echo $nomor_analisis; ?>">
                        <span class="input-group-btn">
                            <button class="btn btn-success"><i class="fa fa-search"></i> Cari</button>
                        </span>
                    </form>
                <?php else: ?>
                <div class="form-horizontal">
                    <h3 class="alert alert-info">Pencarian</h3>
                    <div class="form-group">
                        <label class="col-md-4 col-xs-12 control-label" for="contoh">Nomor Analisis</label>
                        <div class="col-md-8 col-xs-12">
                            <div class="form-control-static">
                                <?php echo $permohonan->nomor_analisis; ?>
                            </div>
                        </div>
                        <label class="col-md-4 col-xs-12 control-label" for="contoh">Pemohon</label>
                        <div class="col-md-8 col-xs-12">
                            <div class="form-control-static">
                                <?php echo $permohonan->pemohon->nama; ?>
                            </div>
                        </div>
                        <label class="col-md-4 col-xs-12 control-label" for="contoh">Tanggal Daftar</label>
                        <div class="col-md-8 col-xs-12">
                            <div class="form-control-static">
                                <?php echo tanggal_format_indonesia($permohonan->tanggal_daftar); ?>
                            </div>
                        </div>
                        <label class="col-md-4 col-xs-12 control-label" for="contoh">Jenis Conto</label>
                        <div class="col-md-8 col-xs-12">
                            <div class="form-control-static">
                                <?php echo $permohonan->jenis_conto; ?>
                            </div>
                        </div>
                        <label class="col-md-4 col-xs-12 control-label" for="contoh">Laboratorium</label>
                        <div class="col-md-8 col-xs-12">
                            <div class="form-control-static">
                                <?php echo $permohonan->laboratorium; ?>
                            </div>
                        </div>
                        <label class="col-md-4 col-xs-12 control-label" for="contoh">Tracking</label>
                        <div class="col-md-8 col-xs-12">
                            <div class="form-control-static">
                                <?php echo $permohonan->kegiatan; ?>
                            </div>
                        </div>
                        <label class="col-md-4 col-xs-12 control-label" for="contoh">Estimasi Selesai</label>
                        <div class="col-md-8 col-xs-12">
                            <div class="form-control-static">
                                <?php echo $estimasi_selesai; ?> Hari
                            </div>
                        </div>
                        <label class="col-md-4 col-xs-12 control-label" for="contoh">Tanggal Estimasi Selesai</label>
                        <div class="col-md-8 col-xs-12">
                            <div class="form-control-static">
                                <?php echo tanggal_format_indonesia($tanggal_estimasi_selesai); ?>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endif; ?>
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
                        <div class="col-md-6">
                            <a class="btn btn-block btn-info" href="<?php echo base_url(); ?>">Kembali ke Beranda</a>
                        </div>
                    </div>
                </form>
            </div>
            <div id="page-home-footer">
                <?php $this->load->view('include/footer'); ?>
            </div>
        </div>
    </div>
</div>

<!-- END PAGE CONTAINER -->

</body>
</html>

