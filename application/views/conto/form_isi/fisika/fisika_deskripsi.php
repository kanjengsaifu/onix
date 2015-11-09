<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/26/15
 * Time: 3:38 PM
 */

?>

<form class="form-group form-simpan-mikroskopis" method="post" action="<?php echo base_url('analisis/simpan_mikroskopis'); ?>">
    <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
    <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
    <label class="control-label">Deskripsi <?php echo $detail_conto->id_type_analisis == 'fmbpb' ? 'Petrografi' : 'Mikroskopis'; ?> </label>
                <span id="label-for-<?php echo $detail_conto->id; ?>-mikroskopis">
                    <?php if(!empty($detail_conto->d_mikroskopis)): ?>
                        <span class="label label-success"><i class="glyphicon glyphicon-ok"></i></span>
                    <?php endif; ?>
                </span>
    <textarea name="deskripsi" class="form-control"><?php echo $detail_conto->d_mikroskopis; ?></textarea>
    <sup>*Deskripsi Mikroskopik</sup>
    <br>
    <button class="btn btn-primary" id="btn-simpan-mikroskopis">Simpan Deskripsi</button>
</form>

<form class="form-group form-simpan-komposisi" method="post" action="<?php echo base_url('analisis/simpan_komposisi'); ?>">
    <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
    <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
    <label class="control-label">Komposisi Mineral</label>
                    <span id="label-for-<?php echo $detail_conto->id; ?>-komposisi">
                        <?php if(!empty($detail_conto->komposisi)): ?>
                            <span class="label label-success"><i class="glyphicon glyphicon-ok"></i></span>
                        <?php endif; ?>
                    </span>
    <textarea name="komposisi" class="form-control"><?php echo $detail_conto->komposisi; ?></textarea>
    <br>
    <button class="btn btn-primary" id="btn-simpan-komposisi">Simpan Komposisi</button>
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