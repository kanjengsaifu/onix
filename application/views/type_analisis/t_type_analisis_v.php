<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('type_analisis'); ?>">Tipe Analisis</a></li>
    <li class="active">Tambah Tipe Analisis</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-flask"></span> Tipe Analisis</h2>
</div>
<!-- END PAGE TITLE -->

<form class="form-horizontal" role="form" action="<?php echo base_url('type_analisis/create'); ?>" method="post">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="fa fa-plus"></span> Tambah Tipe Analisis
                    </h3>
                </div>
                <div class="panel-body">

                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="id">Laboratorium</label>
                        <div class="col-md-6 col-xs-12">
                            <select name="id_lab" class="form-control select">
                                <option value="">--Pilih Laboratorium--</option>
                                <?php foreach($laboratorium as $lab): ?>
                                    <option value="<?php echo $lab->id_lab; ?>" <?php echo set_select('id_lab', $lab->id_lab); ?>><?php echo $lab->nama; ?></option>
                                <?php endforeach; ?>
                            </select>
                            <?php echo form_error('id_lab', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="nama">ID Tipe Analisis</label>
                        <div class="col-md-6 col-xs-12">
                            <input type="text" class="form-control" id="id_type_analisis" placeholder="XXXXX" name="id_type_analisis" value="<?php echo set_value('id_type_analisis'); ?>">
                            <?php echo form_error('id_type_analisis', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="nama">Nama</label>
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


