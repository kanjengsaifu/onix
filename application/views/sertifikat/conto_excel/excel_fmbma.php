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
            <th rowspan="2" valign="middle"><?php echo $conto->nomor_conto; ?></th>
            <th>1</th>
            <th>2</th>
            <th>3</th>
            <th>4</th>
            <th>5</th>
            <th>6</th>
            <th>7</th>
            <th></th>
            <th>1</th>
            <th>2</th>
            <th>3</th>
            <th>4</th>
            <th>5</th>
            <th>6</th>
            <th>KD</th>
            <th>Total</th>
        </tr>
        <tr>
            <td><?php echo $nilai['fraksi'][0]; ?></td>
            <td><?php echo $nilai['fraksi'][1]; ?></td>
            <td><?php echo $nilai['fraksi'][2]; ?></td>
            <td><?php echo $nilai['fraksi'][3]; ?></td>
            <td><?php echo $nilai['fraksi'][4]; ?></td>
            <td><?php echo $nilai['fraksi'][5]; ?></td>
            <td><?php echo $nilai['fraksi'][6]; ?></td>
            <td><?php echo $nilai['total_fraksi']; ?></td>
            <?php
                foreach($nilai['fraksi'] as $fraksi_g):
                    $subtotal_fraksi_g = $nilai['total_fraksi'] == 0 ? 0 : $fraksi_g/$nilai['total_fraksi']*100;
                    $total_fraksi_g += $subtotal_fraksi_g;
                    $array_fraksi_g[] = $subtotal_fraksi_g;
            ?>
                <td><?php echo number_format($subtotal_fraksi_g, 3); ?></td>
            <?php endforeach; ?>
            <td><?php echo number_format($total_fraksi_g, 0); ?></td>
        </tr>
        </thead>
        <tbody>
        <?php
        $total_komposisi_mineral_g = 0;
        foreach($nilai['komposisi_mineral'] as $komposisi_mineral):
            $total_komposisi_mineral_t1 += $komposisi_mineral->t1;
            $total_komposisi_mineral_t2 += $komposisi_mineral->t2;
            $total_komposisi_mineral_t3 += $komposisi_mineral->t3;
            $total_komposisi_mineral_t4 += $komposisi_mineral->t4;
            $total_komposisi_mineral_t5 += $komposisi_mineral->t5;
            $total_komposisi_mineral_t6 += $komposisi_mineral->t6;
            $total_komposisi_mineral_t7 += $komposisi_mineral->t7;
            $total_komposisi_mineral = 0;
            ?>
            <tr id="mineral-<?php echo $komposisi_mineral->id; ?>">
                <td>
                    <?php echo $komposisi_mineral->nama_mineral; ?>
                </td>
                <td><?php echo $komposisi_mineral->t1; ?></td>
                <td><?php echo $komposisi_mineral->t2; ?></td>
                <td><?php echo $komposisi_mineral->t3; ?></td>
                <td><?php echo $komposisi_mineral->t4; ?></td>
                <td><?php echo $komposisi_mineral->t5; ?></td>
                <td><?php echo $komposisi_mineral->t6; ?></td>
                <td><?php echo $komposisi_mineral->t7; ?></td>
                <!-- TABLE RIGHT -->
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
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td><?php echo $total_komposisi_mineral_g; ?></td>
        </tr>
        </tfoot>
    </table>
