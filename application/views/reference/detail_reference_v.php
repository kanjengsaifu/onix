
<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('reference'); ?>">Reference</a></li>
    <li class="active"><?php echo $reference->deskripsi; ?></li>
</ul>
<!-- END BREADCRUMB -->


<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-fire"></span><?php echo $table.' '.$reference->deskripsi; ?></h2>
</div>
<!-- END PAGE TITLE -->

<form class="form-horizontal" role="form" action="<?php echo base_url('reference/update'); ?>" method="post">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label" for="nama">Deskripsi</label>
                        <div class="col-md-6 col-xs-12">
                            <input type="text" class="form-control" id="deskripsi" name="deskripsi" value="<?php echo $reference->deskripsi; ?>">
                            <?php echo form_error('deskripsi', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
<!--                    <a class="btn btn-danger btn-xs" href="--><?php //echo base_url('metoda/delete/' . $reference->id); ?><!--">hapus</a>-->
                    <input type="hidden" name="id" value="<?php echo $reference->id; ?>">
                    <input type="hidden" name="table" value="<?php echo $table; ?>">
                    <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-save"></i> Simpan</button>
                </div>
            </div>
        </div>
    </div>
</form>


