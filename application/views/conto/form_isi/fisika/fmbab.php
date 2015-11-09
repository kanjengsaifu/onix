<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/26/15
 * Time: 3:37 PM
 * Pengisian Analisis Mineral Butir
 */


if($is_empty_nilai)
{
    $nilai['berat_total'] = 0;
    $nilai['sm'] = 0;
    $nilai['m'] = 0;
    $nilai['nm'] = 0;

}

?>
    <div class="form-group">
        <label>Berat Total</label>
        <div class="input-group input-group-lg">
            <div id="berat-total" name="berat_total" class="form-control"></div>
            <span class="input-group-addon">gr</span>
        </div>
    </div>

    <table class="table">
        <thead>
        <tr>
            <th>Fraksi Mineral</th>
            <th>SM (% vol)</th>
            <th>M (% vol)</th>
            <th>NM (% vol)</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>Berat Fraksi</th>
            <th><input type="text" class="form-control input-fmbab" id="sm" name="sm" value="<?php echo $nilai['sm']; ?>"></th>
            <th><input type="text" class="form-control input-fmbab" id="m" name="m" value="<?php echo $nilai['m']; ?>"></th>
            <th><input type="text" class="form-control input-fmbab" id="nm" name="nm" value="<?php echo $nilai['nm']; ?>"></th>
        </tr>
        </tbody>
    </table>

    <button class="btn btn-warning pull-right">Update</button>

    <h1>Deskripsi Mikroskopis</h1>
    <div class="form-group">
        <label>Komposisi Mineral</label>
        <br>
        <select name="mineral" class="select" id="mineral">
            <?php foreach($minerals as $mineral): ?>
                <option value="<?php echo $mineral->id; ?>"><?php echo $mineral->deskripsi; ?></option>
            <?php endforeach; ?>
        </select>
        <button id="btn-add-mineral-fmbab" type="button" class="btn btn-primary">Tambah</button>
        <small class="text-capitalize" id="info-add-mineral"></small>
    </div>

    <table id="fmbab-komposisi-mineral" class="table table-bordered">
        <thead>
        <tr>
            <th rowspan="2">Nama Mineral</th>
            <th colspan="2">SM (%vol)</th>
            <th colspan="2">M (%vol)</th>
            <th colspan="2">NM (%vol)</th>
            <th rowspan="2">Hasil (%)</th>
            <th rowspan="2"</th>
        </tr>
        <tr>
            <th>% Fr</th>
            <th>% Tot</th>
            <th>% Fr</th>
            <th>% Tot</th>
            <th>% Fr</th>
            <th>% Tot</th>
        </tr>
        </thead>
        <tbody>
            <?php if(!empty($nilai['komposisi_mineral'])): ?>
                <?php foreach($nilai['komposisi_mineral'] as $komposisi_mineral): ?>
                    <tr id="mineral-<?php echo $komposisi_mineral->id; ?>">
                        <td>
                            <?php echo $komposisi_mineral->nama_mineral; ?>
                            <input type="hidden" name="komposisi_mineral[<?php echo $komposisi_mineral->id; ?>][nama_mineral]" value="<?php echo $komposisi_mineral->nama_mineral; ?>">
                            <input type="hidden" name="komposisi_mineral[<?php echo $komposisi_mineral->id; ?>][id]" value="<?php echo $komposisi_mineral->id; ?>">
                        </td>
                        <td><input type="text" class="form-control input-fmbab" id="input-sm-<?php echo $komposisi_mineral->id; ?>" name="komposisi_mineral[<?php echo $komposisi_mineral->id; ?>][sm]" value="<?php echo $komposisi_mineral->sm; ?>"></td>
                        <td><div id="sm-<?php echo $komposisi_mineral->id; ?>"></div></td>
                        <td><input type="text" class="form-control input-fmbab" id="input-m-<?php echo $komposisi_mineral->id; ?>" name="komposisi_mineral[<?php echo $komposisi_mineral->id; ?>][m]" value="<?php echo $komposisi_mineral->m; ?>"></td>
                        <td><div id="m-<?php echo $komposisi_mineral->id; ?>"></div></td>
                        <td><input type="text" class="form-control input-fmbab" id="input-nm-<?php echo $komposisi_mineral->id; ?>" name="komposisi_mineral[<?php echo $komposisi_mineral->id; ?>][nm]" value="<?php echo $komposisi_mineral->nm; ?>"></td>
                        <td><div id="nm-<?php echo $komposisi_mineral->id; ?>"></div></td>
                        <td><div id="hasil-<?php echo $komposisi_mineral->id; ?>"></div></td>
                        <td><button type="button" class="btn btn-xs btn-delete-mineral-fmbma btn-danger" data-id="<?php echo $komposisi_mineral->id; ?>"><i class="fa fa-times"></i> hapus</button></td>
                    </tr>
                <?php endforeach; ?>
            <?php else: ?>
                <tr id="table-empty-fmbab">
                    <td colspan="9"><button class="btn btn-info" type="button" id="btn-copy-fmbab">Salin Template</button> </td>
                </tr>
            <?php endif; ?>
        </tbody>
        <tfoot>
        <tr>
            <th>Jumlah</th>
            <th><div id="jumlah-sm"></div></th>
            <th></th>
            <th><div id="jumlah-m"></div></th>
            <th></th>
            <th><div id="jumlah-nm"></div></th>
            <th></th>
            <th><div id="jumlah-hasil"></div></th>
        </tr>
        </tfoot>
    </table>