
<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('metoda'); ?>">Metoda</a></li>
    <li class="active"><?php echo $metoda->nama; ?></li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-fire"></span> Metoda <?php echo $metoda->nama; ?></h2>
</div>
<!-- END PAGE TITLE -->

<form class="form-horizontal" role="form" action="<?php echo base_url('metoda/update'); ?>" method="post">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="nama">Nama Metoda</label>
                        <div class="col-md-6 col-xs-12">
                            <input type="text" class="form-control" id="nama" name="nama" value="<?php echo $metoda->nama; ?>">
                            <?php echo form_error('nama', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="nama">Laboratorium</label>
                        <div class="col-md-6 col-xs-12">
                            <select name="id_lab" class="form-control">
                                <?php foreach($lab as $row): ?>
                                    <option value="<?php echo $row->id_lab; ?>" <?php set_select_value($row->id_lab, $metoda->id_laboratorium); ?>><?php echo $row->nama; ?></option>
                                <?php endforeach; ?>
                            </select>
                            <?php echo form_error('id_lab', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <a class="btn btn-danger btn-xs" href="<?php echo base_url('metoda/delete/' . $metoda->id_metoda); ?>">hapus</a>
                    <input type="hidden" name="id" value="<?php echo $metoda->id_metoda; ?>">
                    <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-save"></i> Simpan</button>
                </div>
            </div>
        </div>
    </div>
</form>


