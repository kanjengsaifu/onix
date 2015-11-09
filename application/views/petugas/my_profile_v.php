<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('petugas'); ?>">Petugas</a></li>
    <li class="active">Profil Saya</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-user"></span> <?php echo $petugas->nama; ?></h2>
</div>
<!-- END PAGE TITLE -->

<form class="form-horizontal" role="form" method="post">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="fa fa-edit"></span> Update Profil
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="id">NIP</label>
                        <div class="col-md-6 col-xs-12">
                            <div class="form-control-static"><?php echo $petugas->nip; ?></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="nama">Nama</label>
                        <div class="col-md-6 col-xs-12">
                            <div class="form-control-static"><?php echo $petugas->nama; ?></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="telepon">Telepon</label>
                        <div class="col-md-6 col-xs-12">
                            <input type="text" class="form-control" id="telepon" name="telepon" value="<?php echo $petugas->telepon; ?>">
                            <?php echo form_error('telepon', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="email">Email</label>
                        <div class="col-md-6 col-xs-12">
                            <input type="text" class="form-control" id="email" name="email" value="<?php echo $petugas->email; ?>">
                            <?php echo form_error('email', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="komoditi">Komoditi</label>
                        <div class="col-md-6 col-xs-12">
                            <div class="form-control-static"><?php echo $petugas->komoditi; ?></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="bagian">Bagian</label>
                        <div class="col-md-6 col-xs-12">
                            <div class="form-control-static"><?php echo $petugas->bagian; ?></div>
                        </div>
                    </div>
                    <div class="form-group hide" id="pass-awal-form">
                        <label class="col-md-3 col-xs-12 control-label" for="email">Password Sementara</label>
                        <div class="col-md-6 col-xs-12">
                            <small id="pass-awal"><?php echo $petugas->pass_awal; ?></small>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <button type="submit" class="btn btn-warning pull-right"><i class="fa fa-edit"></i> Update</button>
                </div>
            </div>
        </div>
    </div>
</form>

