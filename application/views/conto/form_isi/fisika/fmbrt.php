<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/26/15
 * Time: 3:33 PM
 * Analisis Retort
 */

?>

<div class="row">
    <div class="col-md-6">
        <h3>Kandungan (L/Ton)</h3>
        <div class="form-group">
            <label>Air</label>
            <input type="text" class="form-control" name="kandungan_air" value="<?php echo !$is_empty_nilai ? $nilai['kandungan_air'] : 0; ?>">
        </div>
        <div class="form-group">
            <label>Minyak</label>
            <input type="text" class="form-control" name="kandungan_minyak" value="<?php echo !$is_empty_nilai ? $nilai['kandungan_minyak'] : 0; ?>">
        </div>
    </div>
    <div class="col-md-6">
        <h3>Specific Gravity (gr/cm<sup>3</sup>)</h3>
        <div class="form-group">
            <label>Batuan</label>
            <input type="text" class="form-control" name="sp_batuan" value="<?php echo !$is_empty_nilai ? $nilai['sp_batuan'] : 0; ?>">
        </div>
        <div class="form-group">
            <label>Minyak</label>
            <input type="text" class="form-control" name="sp_minyak" value="<?php echo !$is_empty_nilai ? $nilai['sp_minyak'] : 0; ?>">
        </div>
    </div>
</div>
