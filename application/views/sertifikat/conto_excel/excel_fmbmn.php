<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/26/15
 * Time: 3:33 PM
 * Analisis Berat Jenis
 */


?>

<table>
    <tbody>
    <tr>
        <td>MILIK</td>
        <td colspan="4"><?php echo $pemohon->nama_sertifikat; ?></td>
        <td>JUMLAH CONTO</td>
        <td><?php echo $analisis->jumlah_conto; ?> Conto</td>
    </tr>
    <tr>
        <td>LOKASI</td>
        <td colspan="4"><?php echo $analisis->nama_lokasi; ?></td>
        <td>PENGUJI</td>
        <td>LAB. FISIKA MINERAL</td>
    </tr>
    </tbody>
</table>

<table>
    <tbody>
    <tr>
        <td colspan="7">
            <u><b>Deskripsi</b</u><br>
            <div>
                <?php echo $nilai['deskripsi']; ?>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="7">
            <b><u>Deskripsi Mikroskopik</u></b><br>
            <?php $no = 1 ; foreach($nilai['komposisi_mineral'] as $row):?>
            <div>
                <?php echo $row->nama_mineral; ?>, <?php echo $row->keterangan; ?>.
            </div>
            <br>
            <?php endforeach; ?>
        </td>
    </tr>
    <tr>
        <td colspan="7">
            <b><u>Komposisi (%volume)</u></b><br>
            <?php $no = 1 ; foreach($nilai['komposisi_mineral'] as $row):?>
               <?php echo $row->nama_mineral; ?> (<?php echo $row->nilai; ?>).
            <?php endforeach; ?>
        </td>
    </tr>
    </tbody>
</table>