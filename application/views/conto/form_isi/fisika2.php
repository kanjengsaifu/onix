<?php
    // ambil type dipakai
    foreach($detail_conto_fisika as $detail_conto):
?>
<h3 class="alert alert-info"><strong><?php echo $detail_conto->type_analisis; ?></strong></h3>
<div id="foto-<?php echo $detail_conto->id.$detail_conto->id_conto; ?>">
    <?php

    $ada_foto = ada_foto($detail_conto->id.$detail_conto->id_conto);

    ?>
    <?php if($ada_foto == TRUE){ ?>
        <img src="<?php echo base_url('assets/img/foto_conto/'.$detail_conto->id.$detail_conto->id_conto.'.jpg'); ?>" class="img-responsive"  onclick="show_gambar()">
    <?php }else{ ?>
        <strong>Belum Ada Foto</strong>
    <?php }; ?>
</div>
<legend>Form Foto</legend>
<div class="row">
    <div class="col-xs-6">
        <form action="<?php echo base_url('analisis/simpan_gambar'); ?>" class="form-gambar" method="post" enctype="multipart/form-data">
            <input id="i_foto" name="foto" type="file">
            <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id_conto; ?>">
            <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
            <input type="hidden" name="no_foto" value="1">
            <div class="progress" id="progress">
                <div class="progress-bar" role="progressbar">
                    <div class="percent"></div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary" data-id="<?php echo $detail_conto->id; ?>" id="btn-simpan-gambar">Simpan Fotomikrografi - 1</button>
        </form>

        <form action="<?php echo base_url('analisis/simpan_fotomikrograf'); ?>" method="post" class="form-fotomikro">
            <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
            <input type="hidden" name="no_deskripsi" value="1">
            <div class="form-group">
                <label for='fotomikrografi' class="control-label">Deskripsi <?php echo $detail_conto->type_analisis; ?> : </label>
                <textarea id="fotomikrografi" name="fotomikrograf" class="form-control"><?php echo $detail_conto->deskripsi; ?></textarea>
                <div class="fotomikrografi-text"></div>
            </div>
            <button class="btn btn-primary" id="btn-simpan-fotomikro">Simpan Deskripsi Fotomikrografi - 1</button>
        </form>

    </div>
    <div class="col-xs-6">
        <form action="<?php echo base_url('analisis/simpan_gambar'); ?>" class="form-gambar" method="post" enctype="multipart/form-data">
            <input id="i_foto" name="foto" type="file">
            <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id_conto; ?>">
            <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
            <input type="hidden" name="no_foto" value="2">
            <div class="progress" id="progress">
                <div class="progress-bar" role="progressbar">
                    <div class="percent"></div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary" data-id="<?php echo $detail_conto->id; ?>" id="btn-simpan-gambar">Simpan Fotomikrografi - 2</button>
        </form>

        <form action="<?php echo base_url('analisis/simpan_fotomikrograf'); ?>" method="post" class="form-fotomikro">
            <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
            <input type="hidden" name="no_deskripsi" value="2">
            <div class="form-group">
                <label for='fotomikrografi' class="control-label">Deskripsi <?php echo $detail_conto->type_analisis; ?> : </label>
                <textarea id="fotomikrografi" name="fotomikrograf" class="form-control"><?php echo $detail_conto->deskripsi; ?></textarea>
                <div class="fotomikrografi-text"></div>
            </div>
            <button class="btn btn-primary" id="btn-simpan-fotomikro">Simpan Deskripsi Fotomikrografi - 2</button>
        </form>
    </div>
</div>

<hr>



<?php endforeach; ?>

<br>
<br>

