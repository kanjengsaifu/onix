<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('petugas'); ?>">Petugas</a></li>
    <li class="active">Tambah petugas</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-user"></span> Petugas</h2>
</div>
<!-- END PAGE TITLE -->

<form class="form-horizontal" role="form" method="post">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="fa fa-edit"></span> Update Petugas
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="id">NIP</label>
                        <div class="col-md-6 col-xs-12">
                            <input type="text" class="form-control" id="id" placeholder="Nomor Induk Pegawai" name="nip" value="<?php echo $petugas->nip; ?>">
                            <?php echo form_error('nip', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="nama">Nama</label>
                        <div class="col-md-6 col-xs-12">
                            <input type="text" class="form-control" id="nama" name="nama" value="<?php echo $petugas->nama; ?>">
                            <?php echo form_error('nama', '<small class="text-danger">', '</small>'); ?>
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
                            <select name="id_komoditi" id="komoditi" class="form-control select">
                                <option value="">--Pilih Komoditi--</option>
                                <?php foreach($komoditi as $row): ?>
                                    <option value="<?php echo $row->id_komoditi; ?>" <?php set_select_value($row->id_komoditi, $petugas->id_komoditi); ?>><?php echo strtoupper($row->nama); ?></option>
                                <?php endforeach; ?>
                            </select>
                            <?php echo form_error('id_komoditi', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="bagian">Bagian</label>
                        <div class="col-md-6 col-xs-12">
                            <input type="text" class="form-control" id="bagian" name="bagian" value="<?php echo $petugas->bagian; ?>">
                            <?php echo form_error('bagian', '<small class="text-danger">', '</small>'); ?>
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
                    <div class="btn-group btn-group-xs">
                        <button class="btn btn-info" type="button" id="btn-show-pass-admin"><i class="fa fa-eye"></i> lihat password sementara</button>
                        <button class="btn btn-danger" type="button" id="btn-reset-pass-admin"  data-id="<?php echo $petugas->id_petugas; ?>"><i class="fa fa-refresh"></i> reset password</button>
                    </div>
                    <input type="hidden" name="id_petugas" value="<?php echo $petugas->id_petugas; ?>">
                    <button type="submit" class="btn btn-warning pull-right"><i class="fa fa-edit"></i> Update</button>
                </div>
            </div>
        </div>
    </div>
</form>

