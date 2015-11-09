<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/7/13
 * Time: 11:51 AM
 */

?>
<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('analisis'); ?>">Analisis</a></li>
    <li><a href="<?php echo base_url('analisis/detail/'. $analisis->id); ?>"><?php echo $analisis->nomor_analisis; ?></a></li>
    <li><a href="<?php echo base_url('conto/detail/'. $conto->id); ?>">Conto Fisika | <?php echo $conto->nomor_conto; ?></a></li>
    <li class="active"><?php echo $type_analisis->nama; ?></li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-gears"></span> Detail Conto</h2>
</div>
<!-- END PAGE TITLE -->

<div class="row">
    <div class="col-md-12">
        <form action="<?php echo base_url('conto/update_nilai_fisika'); ?>" method="post">
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h3 class="panel-title"><?php echo $type_analisis->nama; ?></h3>
                    <ul class="panel-controls">
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#" aria-expanded="true"><span class="fa fa-download"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="<?php echo base_url('sertifikat/export_conto_fisika/' . $conto_detail_fisika->id); ?>"><i class="fa fa-file-excel-o"></i> Excel .xls</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="panel-body" id="<?php echo "form-" . $type_analisis->id_type_analisis; ?>">
                    <?php $this->load->view('conto/form_isi/fisika/' . $type_analisis->id_type_analisis); ?>
                </div>
                <div class="panel-footer">
                    <input type="hidden" name="id" value="<?php echo $conto_detail_fisika->id; ?>">
                    <input type="hidden" name="id_conto" value="<?php echo $conto->id; ?>">
                    <button class="btn btn-primary pull-right">simpan</button>
                </div>
            </div>
        </form>
    </div>
</div>
