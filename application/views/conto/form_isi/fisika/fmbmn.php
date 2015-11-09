<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/26/15
 * Time: 3:37 PM
 * Pengisian Analisis Mineralogi Butir
 */

?>
    <div class="form-group">
        <label>Deskripsi</label>
        <br>
        <textarea name="deskripsi" class="form-control"><?php echo !empty($nilai['deskripsi']) ? $nilai['deskripsi'] : ''; ?></textarea>
    </div>

    <div class="form-group">
        <label>Komposisi Mineral</label>
        <br>
        <select name="mineral" class="select" id="mineral">
            <?php foreach($minerals as $mineral): ?>
                <option value="<?php echo $mineral->id; ?>"><?php echo $mineral->deskripsi; ?></option>
            <?php endforeach; ?>
        </select>
        <button id="btn-add-mineral-fmbmn" type="button" class="btn btn-primary">Tambah</button>
    </div>

    <table id="fmbmn-komposisi-mineral" class="table">
        <thead>
        <tr>
            <th>Nama Mineral</th>
            <th>Volume %</th>
            <th>Keterangan</th>
            <th></th>
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
                        <td><input type="text" value="<?php echo $komposisi_mineral->nilai; ?>" name="komposisi_mineral[<?php echo $komposisi_mineral->id; ?>][nilai]" class="form-control"></td>
                        <td>
                            <textarea name="komposisi_mineral[<?php echo $komposisi_mineral->id; ?>][keterangan]" class="form-control"><?php echo $komposisi_mineral->keterangan; ?></textarea>
                        </td>
                        <td><button type="button" class="btn btn-xs btn-delete-mineral-fmbma btn-danger" data-id="<?php echo $komposisi_mineral->id; ?>"><i class="fa fa-times"></i> hapus</button></td>
                    </tr>
                <?php endforeach; ?>
            <?php endif; ?>
        </tbody>
    </table>