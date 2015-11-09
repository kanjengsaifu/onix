<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/26/15
 * Time: 3:36 PM
 */
dump($nilai);
if($is_empty_nilai)
{

}

?>
<!-- Pengisian SEM -->
<form class="form-nilai-fisika" method="post" action="<?php echo base_url('analisis/simpan_nilai_fisika'); ?>">
    <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
    <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
    <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
    <h3>Element</h3>
    <div class="row">
        <div class="col-xs-4">
            <strong>OK</strong>
            <div class="input-group">
                <input type="text" name="nilai[]" class="form-control" placeholder="">
                <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-okwt"><?php echo count($nilai) == 0 ? '' : $nilai[0]; ?></span>
                <span class="input-group-addon">Wt%</span>
            </div><!-- /input-group -->
            <div class="input-group">
                <input type="text" name="nilai[]" class="form-control" placeholder="">
                <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-okat"><?php echo count($nilai) == 0 ? '' : $nilai[1]; ?></span>
                <span class="input-group-addon">At%</span>
            </div><!-- /input-group -->
        </div>
        <div class="col-xs-4">
            <strong>Mgk</strong>
            <div class="input-group">
                <input type="text" name="nilai[]" class="form-control" placeholder="">
                <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-mgkwt"><?php echo count($nilai) == 0 ? '' : $nilai[2]; ?></span>
                <span class="input-group-addon">Wt%</span>
            </div><!-- /input-group -->
            <div class="input-group">
                <input type="text" name="nilai[]" class="form-control" placeholder="">
                <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-mgkat"><?php echo count($nilai) == 0 ? '' : $nilai[3]; ?></span>
                <span class="input-group-addon">At%</span>
            </div><!-- /input-group -->
        </div>
        <div class="col-xs-4">
            <strong>Matrix</strong>
            <div class="input-group">
                <input type="text" name="nilai[]" class="form-control" placeholder="">
                <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-matwt"><?php echo count($nilai) == 0 ? '' : $nilai[4]; ?></span>
                <span class="input-group-addon">Wt%</span>
            </div><!-- /input-group -->
            <div class="input-group">
                <input type="text" name="nilai[]" class="form-control" placeholder="">
                <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-matat"><?php echo count($nilai) == 0 ? '' : $nilai[5]; ?></span>
                <span class="input-group-addon">At%</span>
            </div><!-- /input-group -->
        </div>
    </div>
    <button class="btn btn-success">Simpan Nilai</button>
</form>

<div class="row">
    <div class="col-xs-6">
        <div id="foto-<?php echo $detail_conto->id_conto.$detail_conto->id.'1'; ?>">
            <?php
            // cek ke directory
            $ada_foto1 = ada_foto($detail_conto->foto_1);
            ?>
            <?php if($ada_foto1 == TRUE){ ?>
                <img src="<?php echo base_url('assets/img/foto_conto/'.$detail_conto->foto_1); ?>" class="img-responsive"  onclick="show_gambar('<?php echo base_url('assets/img/foto_conto/'.$detail_conto->foto_1); ?>', '<?php echo $detail_conto->deskripsi_1; ?>')">
            <?php }else{ ?>
                <strong>Belum Ada Foto</strong>
            <?php }; ?>
        </div>
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

        <form action="<?php echo base_url('analisis/simpan_deskripsi_fotomikrograf'); ?>" method="post" class="form-fotomikro">
            <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
            <input type="hidden" name="no_deskripsi" value="1">
            <input type="hidden" name="nama_fisika" value="<?php echo $detail_conto->type_analisis; ?>">
            <div class="form-group">
                <label for='fotomikrografi' class="control-label">Deskripsi <?php echo $detail_conto->type_analisis; ?> : </label>
                <textarea id="fotomikrografi" name="fotomikrograf" class="form-control"><?php echo $detail_conto->deskripsi_1; ?></textarea>
                <div class="fotomikrografi-text"></div>
            </div>
            <button class="btn btn-primary" id="btn-simpan-fotomikro">Simpan Deskripsi Fotomikrografi - 1</button>
        </form>

    </div>
    <div class="col-xs-6">
        <div id="foto-<?php echo $detail_conto->id_conto.$detail_conto->id.'2'; ?>">
            <?php
            // cek ke directory
            $ada_foto2 = ada_foto($detail_conto->foto_2);
            ?>
            <?php if($ada_foto2 == TRUE){ ?>
                <img src="<?php echo base_url('assets/img/foto_conto/'.$detail_conto->foto_2); ?>" class="img-responsive"  onclick="show_gambar('<?php echo base_url('assets/img/foto_conto/'.$detail_conto->foto_2); ?>', '<?php echo $detail_conto->deskripsi_2; ?>')">
            <?php }else{ ?>
                <strong>Belum Ada Foto</strong>
            <?php }; ?>
        </div>
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

        <form action="<?php echo base_url('analisis/simpan_deskripsi_fotomikrograf'); ?>" method="post" class="form-fotomikro">
            <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
            <input type="hidden" name="no_deskripsi" value="2">
            <input type="hidden" name="nama_fisika" value="<?php echo $detail_conto->type_analisis; ?>">
            <div class="form-group">
                <label for='fotomikrografi' class="control-label">Deskripsi <?php echo $detail_conto->type_analisis; ?> : </label>
                <textarea id="fotomikrografi" name="fotomikrograf" class="form-control"><?php echo $detail_conto->deskripsi_2; ?></textarea>
                <div class="fotomikrografi-text"></div>
            </div>
            <button class="btn btn-primary" id="btn-simpan-fotomikro">Simpan Deskripsi Fotomikrografi - 2</button>
        </form>
    </div>
</div>