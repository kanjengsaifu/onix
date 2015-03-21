<div id="foto">
    <?php if($ada_foto == TRUE){ ?>
        <img src="<?php echo base_url('assets/img/foto_conto/'.$conto->id_conto.'.jpg'); ?>" class="img-responsive"  onclick="show_gambar()">
    <?php }else{ ?>
        <strong>Belum Ada Foto</strong>
    <?php }; ?>
</div>
<legend>Form Foto</legend>
<form action="<?php echo base_url('analisis/simpan_gambar'); ?>" id="form-gambar" method="post" enctype="multipart/form-data">
    <input id="i_foto" name="foto" type="file">
    <input type="hidden" name="id_proses" value="<?php echo $conto->id_conto; ?>">
    <div class="progress" id="progress">
        <div class="progress-bar" role="progressbar">
            <div class="percent"></div>
        </div>
    </div>
    <button type="submit" class="btn btn-primary" id="btn-simpan-gambar">Simpan Fotomikrografi</button>
</form>

<br>
<br>
<form action="<?php echo base_url('analisis/simpan_fotomikrograf'); ?>" method="post" id="form-fotomikro">
    <input type="hidden" name="id_proses" value="<?php echo $conto->id_conto; ?>">
    <div class="form-group">
        <label for='fotomikrografi' class="control-label">Deskripsi : </label>
        <textarea id="fotomikrografi" name="fotomikrograf" class="form-control"><?php echo $conto->fotomikrografi; ?></textarea>
        <div class="fotomikrografi-text"></div>
    </div>
    <button class="btn btn-primary" id="btn-simpan-fotomikro">Simpan Deskripsi</button>
</form>

<br>
<br>