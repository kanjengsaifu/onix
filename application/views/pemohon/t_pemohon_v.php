<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('pemohon'); ?>">Pemohon</a></li>
    <li class="active">Tambah Pemohon</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-users"></span> Pemohon</h2>
</div>
<!-- END PAGE TITLE -->

<form class="form-horizontal" role="form" action="<?php echo base_url('pemohon/create'); ?>" method="post">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="fa fa-user-plus"></span> Tambah Pemohon
                    </h3>
                </div>
                <div class="panel-body">

                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="id">Tipe Pemohon</label>
                        <div class="col-md-6 col-xs-12">
                            <select name="type_pemohon" class="form-control select">
                                <?php foreach($type_pemohon as $type): ?>
                                    <option value="<?php echo $type->id; ?>"><?php echo $type->nama; ?></option>
                                <?php endforeach; ?>
                            </select>
                            <?php echo form_error('type_pemohon', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="nama">Nama Pemohon</label>
                        <div class="col-md-6 col-xs-12">
                            <input type="text" class="form-control" id="nama" name="nama" value="<?php echo set_value('nama'); ?>">
                            <?php echo form_error('nama', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="nama">Nama di Sertifikat</label>
                        <div class="col-md-6 col-xs-12">
                            <input type="text" class="form-control" id="nama_sertifikat" name="nama_sertifikat" value="<?php echo set_value('nama_sertifikat'); ?>">
                            <?php echo form_error('nama_sertifikat', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="nama">Alamat</label>
                        <div class="col-md-6 col-xs-12">
                            <input type="text" class="form-control" id="alamat" name="alamat" value="<?php echo set_value('alamat'); ?>">
                            <?php echo form_error('alamat', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="deskripsi">Deskripsi</label>
                        <div class="col-md-6 col-xs-12">
                            <textarea class="form-control" id="deskripsi" name="deskripsi"><?php echo set_value('deskripsi'); ?></textarea>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-save"></i> Simpan</button>
                </div>
            </div>

        </div>
    </div>
</form>


