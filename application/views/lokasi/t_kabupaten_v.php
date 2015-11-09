
<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('lokasi'); ?>">Lokasi</a></li>
    <li class="active">Tambah Kabupaten</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-location-arrow"></span> Kabupaten</h2>
</div>
<!-- END PAGE TITLE -->

<form class="form-horizontal" role="form" action="<?php echo base_url('lokasi/insert_kabupaten'); ?>" method="post">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="fa fa-plus"></span> Tambah Kabupaten
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="nama">Provinsi</label>
                        <div class="col-md-6 col-xs-12">
                            <select name="id_provinsi" class="form-control">
                                <option value="">--Pilih Provinsi--</option>
                                <?php foreach($provinsi as $row): ?>
                                    <option value="<?php echo $row->id_provinsi; ?>"><?php echo $row->nama; ?></option>
                                <?php endforeach; ?>
                            </select>
                            <sup>*Jika luar negeri pilih Lainnya</sup>
                            <br>
                            <?php echo form_error('id_provinsi', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="nama">Nama Kabupaten</label>
                        <div class="col-md-6 col-xs-12">
                            <input type="text" class="form-control" id="nama" name="nama" value="<?php echo set_value('nama'); ?>">
                            <?php echo form_error('nama', '<small class="text-danger">', '</small>'); ?>
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


