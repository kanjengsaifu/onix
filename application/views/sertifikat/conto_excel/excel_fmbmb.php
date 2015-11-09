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
        <td colspan="2"><?php echo $pemohon->nama_sertifikat; ?></td>
        <td>JUMLAH CONTO</td>
        <td><?php echo $analisis->jumlah_conto; ?> Conto</td>
    </tr>
    <tr>
        <td>LOKASI</td>
        <td colspan="2"><?php echo $analisis->nama_lokasi; ?></td>
        <td>PENGUJI</td>
        <td>LAB. FISIKA MINERAL</td>
    </tr>
    </tbody>
</table>

<table>
    <thead>
    <tr>
        <th>NO.</th>
        <th>NAMA MINERAL</th>
        <th>KETERANGAN</th>
    </tr>
    </thead>
    <tbody>
    <?php $no=1; foreach($nilai['komposisi_mineral'] as $row): ?>
    <tr>
        <td>#<?php echo $no++; ?>.</td>
        <td><?php echo $row->nama_mineral; ?></td>
        <td><?php echo $row->keterangan; ?></td>
    </tr>

    <?php endforeach; ?>
    </tbody>
</table>