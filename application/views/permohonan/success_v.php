<div class="progress">
    <div class="progress-bar progress-bar-success" style="width: 25%;">
        Pilih Pemohon
    </div>
    <div class="progress-bar progress-bar-success" style="width: 25%;">
        Form Permohonan
    </div>
    <div class="progress-bar progress-bar-success" role="progressbar"  style="width: 25%;">
        Preview
    </div>
    <div class="progress-bar progress-bar-info" role="progressbar" style="width: 25%;">
        Selesai
    </div>
</div>

<div class="jumbotron">
    <h1 class="text-center">Anda Berhasil Membuat Permohonan Baru!</h1>
    <div class="well well-lg text-center">
        <b>Nomor Analisis</b>
        <br>
        <?php echo $nomor_analisis; ?>
    </div>
    <a href="<?php echo base_url('permohonan'); ?>" class="btn btn-info btn-lg pull-left"><i class="fa fa-chevron-left"></i> Halaman Permohonan</a>
    <a href="<?php echo base_url('permohonan/detail/' . $id_analisis); ?>" class="btn btn-success btn-lg pull-right">Detail Permohonan <i class="fa fa-chevron-right"></i></a>
</div>
