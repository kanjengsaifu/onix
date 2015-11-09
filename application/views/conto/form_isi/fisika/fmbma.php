<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/26/15
 * Time: 3:37 PM
 * Pengisian Analisis Ayak
 */

if($is_empty_nilai)
{
    $nilai['fraksi'] = [0, 0, 0, 0, 0, 0, 0];
    $nilai['total_fraksi'] = 0;
}

$total_komposisi_mineral_t1 = 0;
$total_komposisi_mineral_t2 = 0;
$total_komposisi_mineral_t3 = 0;
$total_komposisi_mineral_t4 = 0;
$total_komposisi_mineral_t5 = 0;
$total_komposisi_mineral_t6 = 0;
$total_komposisi_mineral_t7 = 0;

$total_fraksi_g = 0;
$array_fraksi_g = array();

?>

    <table class="table">
        <thead>
        <tr>
            <th>Ukuran Fraksi</th>
            <th>+425</th>
            <th>-425+300</th>
            <th>-300+180</th>
            <th>-180+150</th>
            <th>-150+106</th>
            <th>-106+75</th>
            <th>< 75</th>
            <th>Total</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>% Fraksi</td>
            <td><input type="text" step="any" name="fraksi[]" class="form-control fraksi" value="<?php echo $nilai['fraksi'][0]; ?>"></td>
            <td><input type="text" step="any" name="fraksi[]" class="form-control fraksi" value="<?php echo $nilai['fraksi'][1]; ?>"></td>
            <td><input type="text" step="any" name="fraksi[]" class="form-control fraksi" value="<?php echo $nilai['fraksi'][2]; ?>"></td>
            <td><input type="text" step="any" name="fraksi[]" class="form-control fraksi" value="<?php echo $nilai['fraksi'][3]; ?>"></td>
            <td><input type="text" step="any" name="fraksi[]" class="form-control fraksi" value="<?php echo $nilai['fraksi'][4]; ?>"></td>
            <td><input type="text" step="any" name="fraksi[]" class="form-control fraksi" value="<?php echo $nilai['fraksi'][5]; ?>"></td>
            <td><input type="text" step="any" name="fraksi[]" class="form-control fraksi" value="<?php echo $nilai['fraksi'][6]; ?>"></td>
            <td>
                <div class="total-fraksi"><?php echo $nilai['total_fraksi']; ?></div>
                <input type="hidden" step="any" name="total_fraksi" class="form-control total-fraksi" value="<?php echo $nilai['total_fraksi']; ?>">
            </td>
        </tr>
        </tbody>
    </table>

    <button class="btn btn-warning pull-right">Update</button>

    <div class="form-group">
        <label>Komposisi Mineral</label>
        <br>
        <select name="mineral" class="select" id="mineral">
            <?php foreach($minerals as $mineral): ?>
                <option value="<?php echo $mineral->id; ?>"><?php echo $mineral->deskripsi; ?></option>
            <?php endforeach; ?>
        </select>
        <button id="btn-add-mineral-fmbma" type="button" class="btn btn-primary">Tambah</button>
    </div>

    <table id="fmbma-komposisi-mineral" class="table">
        <tbody>
            <?php
                if(!empty($nilai['komposisi_mineral'])):
            ?>

                <?php
                    foreach($nilai['komposisi_mineral'] as $komposisi_mineral):
                        $total_komposisi_mineral_t1 += $komposisi_mineral->t1;
                        $total_komposisi_mineral_t2 += $komposisi_mineral->t2;
                        $total_komposisi_mineral_t3 += $komposisi_mineral->t3;
                        $total_komposisi_mineral_t4 += $komposisi_mineral->t4;
                        $total_komposisi_mineral_t5 += $komposisi_mineral->t5;
                        $total_komposisi_mineral_t6 += $komposisi_mineral->t6;
                        $total_komposisi_mineral_t7 += $komposisi_mineral->t7;
                        ?>
                    <tr id="mineral-<?php echo $komposisi_mineral->id; ?>">
                        <td>
                            <?php echo $komposisi_mineral->nama_mineral; ?>
                            <input type="hidden" name="komposisi_mineral[<?php echo $komposisi_mineral->id; ?>][nama_mineral]" value="<?php echo $komposisi_mineral->nama_mineral; ?>">
                            <input type="hidden" name="komposisi_mineral[<?php echo $komposisi_mineral->id; ?>][id]" value="<?php echo $komposisi_mineral->id; ?>">
                        </td>
                        <td><input type="text" value="<?php echo $komposisi_mineral->t1; ?>" name="komposisi_mineral[<?php echo $komposisi_mineral->id; ?>][t1]" class="form-control"></td>
                        <td><input type="text" value="<?php echo $komposisi_mineral->t2; ?>" name="komposisi_mineral[<?php echo $komposisi_mineral->id; ?>][t2]" class="form-control"></td>
                        <td><input type="text" value="<?php echo $komposisi_mineral->t3; ?>" name="komposisi_mineral[<?php echo $komposisi_mineral->id; ?>][t3]" class="form-control"></td>
                        <td><input type="text" value="<?php echo $komposisi_mineral->t4; ?>" name="komposisi_mineral[<?php echo $komposisi_mineral->id; ?>][t4]" class="form-control"></td>
                        <td><input type="text" value="<?php echo $komposisi_mineral->t5; ?>" name="komposisi_mineral[<?php echo $komposisi_mineral->id; ?>][t5]" class="form-control"></td>
                        <td><input type="text" value="<?php echo $komposisi_mineral->t6; ?>" name="komposisi_mineral[<?php echo $komposisi_mineral->id; ?>][t6]" class="form-control"></td>
                        <td><input type="text" value="<?php echo $komposisi_mineral->t7; ?>" name="komposisi_mineral[<?php echo $komposisi_mineral->id; ?>][t7]" class="form-control"></td>
                        <td><button type="button" class="btn btn-xs btn-delete-mineral-fmbma btn-danger" data-id="<?php echo $komposisi_mineral->id; ?>"><i class="fa fa-times"></i> hapus</button></td>
                    </tr>
                <?php endforeach; ?>
            <?php else: ?>
                    <tr id="table-empty-fmbma">
                        <td colspan="7"><button class="btn btn-info" type="button" id="btn-copy-fmbma">Salin Template</button></td>
                    </tr>
            <?php endif; ?>
        </tbody>
        <tfoot>
            <tr>
                <td></td>
                <td><?php echo $total_komposisi_mineral_t1; ?></td>
                <td><?php echo $total_komposisi_mineral_t2; ?></td>
                <td><?php echo $total_komposisi_mineral_t3; ?></td>
                <td><?php echo $total_komposisi_mineral_t4; ?></td>
                <td><?php echo $total_komposisi_mineral_t5; ?></td>
                <td><?php echo $total_komposisi_mineral_t6; ?></td>
                <td><?php echo $total_komposisi_mineral_t7; ?></td>
            </tr>
        </tfoot>
    </table>

    <button class="btn btn-warning pull-right">Update</button>
    <div class="h3"></div>

    <?php
        if(!empty($nilai['komposisi_mineral'])):
    ?>
    <table class="table table-bordered">
        <thead>
        <tr>
            <td></td>
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
            <td>6</td>
            <td>KD</td>
            <td>Total</td>
        </tr>
        <tr>
            <th><?php echo $nilai['total_fraksi']; ?></th>
            <?php

                foreach($nilai['fraksi'] as $fraksi_g):
                    $subtotal_fraksi_g = $nilai['total_fraksi'] == 0 ? 0 : $fraksi_g/$nilai['total_fraksi']*100;
                    $total_fraksi_g += $subtotal_fraksi_g;
                    $array_fraksi_g[] = $subtotal_fraksi_g;
            ?>

                <th><?php echo number_format($subtotal_fraksi_g, 3); ?></th>
            <?php endforeach; ?>
            <th><?php echo number_format($total_fraksi_g, 0); ?></th>
        </tr>
        </thead>
        <tbody>
        <?php if(!empty($nilai['komposisi_mineral'])): ?>

            <?php
                $total_komposisi_mineral_g = 0;
                foreach($nilai['komposisi_mineral'] as $komposisi_mineral):
                    $total_komposisi_mineral = 0;
                    ?>
                <tr id="mineral-<?php echo $komposisi_mineral->id; ?>">
                    <td>
                        <?php echo $komposisi_mineral->nama_mineral; ?>
                    </td>
                    <td><?php echo round($komposisi_mineral->t1*$array_fraksi_g[0]/100, 2); $total_komposisi_mineral += $komposisi_mineral->t1*$array_fraksi_g[0]/100;?></td>
                    <td><?php echo round($komposisi_mineral->t2*$array_fraksi_g[1]/100, 2); $total_komposisi_mineral += $komposisi_mineral->t2*$array_fraksi_g[1]/100;?></td>
                    <td><?php echo round($komposisi_mineral->t3*$array_fraksi_g[2]/100, 2); $total_komposisi_mineral += $komposisi_mineral->t3*$array_fraksi_g[2]/100;?></td>
                    <td><?php echo round($komposisi_mineral->t4*$array_fraksi_g[3]/100, 2); $total_komposisi_mineral += $komposisi_mineral->t4*$array_fraksi_g[3]/100;?></td>
                    <td><?php echo round($komposisi_mineral->t5*$array_fraksi_g[4]/100, 2); $total_komposisi_mineral += $komposisi_mineral->t5*$array_fraksi_g[4]/100;?></td>
                    <td><?php echo round($komposisi_mineral->t6*$array_fraksi_g[5]/100, 2); $total_komposisi_mineral += $komposisi_mineral->t6*$array_fraksi_g[5]/100;?></td>
                    <td><?php echo round($komposisi_mineral->t7*$array_fraksi_g[6]/100, 2); $total_komposisi_mineral += $komposisi_mineral->t7*$array_fraksi_g[6]/100;?></td>
                    <td><?php echo round($total_komposisi_mineral, 2); $total_komposisi_mineral_g += $total_komposisi_mineral; ?></td>
                </tr>
            <?php endforeach; ?>
        <?php endif; ?>
        </tbody>
        <tfoot>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td><?php echo round($total_komposisi_mineral_g, 2); ?></td>
        </tr>
        </tfoot>
    </table>
    <?php endif; ?>