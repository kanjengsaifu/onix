<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/26/15
 * Time: 3:38 PM
 */

?>
<div class="row">
    <div class="col-xs-5">
        <form class="form-nilai-fisika" method="post" action="<?php echo base_url('analisis/simpan_nilai_fisika'); ?>">
            <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
            <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
            <div class="input-group">
                <input type="text" name="nilai[]" class="form-control" placeholder="Simpan Nilai <?php echo $detail_conto->type_analisis; ?>">
                <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
                            <span class="input-group-btn">
                                <button class="btn btn-success" type="submit">Simpan Nilai</button>
                            </span>
                <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-nilai"><?php echo count($nilai) == 0 ? '' : $nilai[0]; ?></span>
                <span class="input-group-addon">gr/cm<sup>3</sup></span>
                <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
            </div><!-- /input-group -->
        </form>
    </div>
</div>