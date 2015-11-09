
<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('parameter'); ?>">Parameter</a></li>
    <li class="active">Tambah Parameter</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-flask"></span> Parameter</h2>
</div>
<!-- END PAGE TITLE -->

<form class="form-horizontal" role="form" action="<?php echo base_url('parameter/create'); ?>" method="post">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="fa fa-plus"></span> Tambah Parameter
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="nama">Nama Parameter</label>
                        <div class="col-md-6 col-xs-12">
                            <input type="text" class="form-control" id="nama" name="nama" value="<?php echo set_value('nama'); ?>">
                            <?php echo form_error('nama', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="nama">Harga</label>
                        <div class="col-md-6 col-xs-12">
                            <input type="text" class="form-control" id="harga" name="harga" value="<?php echo set_value('harga'); ?>">
                            <?php echo form_error('harga', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="nama">Satuan</label>
                        <div class="col-md-6 col-xs-12">
                            <input type="text" class="form-control" id="satuan" name="satuan" value="<?php echo set_value('satuan'); ?>">
                            <?php echo form_error('satuan', '<small class="text-danger">', '</small>'); ?>
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


