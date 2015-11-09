
<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('lokasi'); ?>">Lokasi</a></li>
    <li class="active">Provinsi <?php echo $provinsi->nama; ?></li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-location-arrow"></span> Provinsi</h2>
</div>
<!-- END PAGE TITLE -->

<form class="form-horizontal" role="form" action="<?php echo base_url('lokasi/update_provinsi'); ?>" method="post">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="nama">Nama Provinsi</label>
                        <div class="col-md-6 col-xs-12">
                            <input type="text" class="form-control" id="nama" name="nama" value="<?php echo $provinsi->nama; ?>">
                            <?php echo form_error('nama', '<small class="text-danger">', '</small>'); ?>
                            <input type="hidden" name="id" value="<?php echo $provinsi->id_provinsi; ?>">
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <a class="btn btn-danger btn-xs" href="<?php echo base_url('lokasi/delete_provinsi/' . $provinsi->id_provinsi); ?>">hapus</a>
                    <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-save"></i> Simpan</button>
                </div>
            </div>
        </div>
    </div>
</form>
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <span class="fa fa-location-arrow"></span> Kabupaten
                </h3>
            </div>
            <div class="panel-body">
                <table class="table datatable_simple">
                    <thead>
                    <tr>
                        <th>No.</th>
                        <th>Nama</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no=1; foreach($kabupaten as $row): ?>
                        <tr>
                            <td><?php echo $no++; ?>.</td>
                            <td><?php echo $row->nama; ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>



