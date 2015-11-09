<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/26/15
 * Time: 3:33 PM
 * Analisis Derajat Kemagnetan
 */

?>

<div class="row">
    <div class="col-md-6">
        <h3>Derajat Kemagnetan (%)</h3>
        <div class="form-group">
            <label>Nilai</label>
            <input type="text" class="form-control" name="nilai" value="<?php echo !$is_empty_nilai ? $nilai['nilai'] : 0; ?>">
        </div>
    </div>
</div>
