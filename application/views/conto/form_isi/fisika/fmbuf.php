<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/26/15
 * Time: 3:33 PM
 * Analisis Derajat Kemagnetan
 */

$metoda = $this->metoda_m->all();
if($is_empty_nilai)
{
    $nilai['metoda_uji'] = '';
}

?>

<div class="row">
    <div class="col-md-4">
        <h3>Metoda Uji</h3>
        <div class="form-group">
            <select name="metoda_uji" class="form-control select">
                <option value="">--Pilih Metoda Uji--</option>
                <?php foreach($metoda as $row): ?>
                    <option <?php echo $nilai['metoda_uji'] == $row->nama ? 'SELECTED' : ''; ?>><?php echo $row->nama; ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <div class="col-md-4">
        <h3>Kuat Tekan (kg/cm<sup>3</sup>)</h3>
        <div class="form-group">
            <input type="text" class="form-control" name="kuat_tekan" value="<?php echo !$is_empty_nilai ? $nilai['kuat_tekan'] : 0; ?>">
        </div>
    </div>
    <div class="col-md-4">
        <h3>Berat Jenis (gr/cm<sup>3</sup>)</h3>
        <div class="form-group">
            <input type="text" class="form-control" name="berat_jenis" value="<?php echo !$is_empty_nilai ? $nilai['berat_jenis'] : 0; ?>">
        </div>
    </div>
</div>

    <div class="clearfix"></div>