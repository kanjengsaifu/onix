<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active">Permohonan</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-check"></span> Sukses</h2>
</div>
<!-- END PAGE TITLE -->

<div class="row">
    <div class="col-md-12">
        <div class="wizard">
            <ul class="steps_4 anchor">
                <li>
                    <a class="done" href="#step-1">
                        <span class="stepNumber">1</span>
                        <span class="stepDesc">Pemohon<br /><small>Pilih Pemohon</small></span>
                    </a>
                </li>
                <li>
                    <a class="done" href="#step-2">
                        <span class="stepNumber">2</span>
                        <span class="stepDesc">Form<br /><small>Data Permohonan</small></span>
                    </a>
                </li>
                <li>
                    <a class="done" href="#step-3">
                        <span class="stepNumber">3</span>
                        <span class="stepDesc">Preview<br /><small>Pre-edit</small></span>
                    </a>
                </li>
                <li >
                    <a class="selected" href="#step-4">
                        <span class="stepNumber">4</span>
                        <span class="stepDesc">Simpan<br /><small>Selesai</small></span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="line-height-30">&nbsp;</div>

        <div class="panel">
            <div class="panel-body">
                <h1 class="text-center">Anda Berhasil Membuat Permohonan Baru!</h1>
                <div class="well well-lg text-center">
                    <b>Nomor Analisis</b>
                    <br>
                    <?php echo $nomor_analisis; ?>
                </div>
                <a href="<?php echo base_url('permohonan'); ?>" class="btn btn-primary btn-lg pull-left"><i class="fa fa-chevron-left"></i> List Permohonan</a>
                <a href="<?php echo base_url('permohonan/detail/' . $id_analisis); ?>" class="btn btn-info btn-lg pull-right">Detail Permohonan <i class="fa fa-chevron-right"></i></a>
            </div>
        </div>
    </div>
</div>


