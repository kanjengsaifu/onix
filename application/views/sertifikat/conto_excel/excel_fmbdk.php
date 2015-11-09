<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/26/15
 * Time: 3:33 PM
 * Analisis Berat Jenis
 */


$conto = $this->conto_m->by_analisis($analisis->id);

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
    <thead>
    <tr>
        <th>NO.</th>
        <th>NOMOR ANALISIS</th>
        <th>KODE CONTO</th>
        <th>DERAJAT KEMAGNETAN (%)</th>
    </tr>
    </thead>
    <tbody>
    <?php $no = 1 ; foreach($conto as $row):
            $detail_fisika_fmbbj = $this->conto_m->detail_fisika($row->id, 3);
            $nilai = json_decode($detail_fisika_fmbbj->nilai);
        ?>
        <tr>
            <td><?php echo $no; ?>.</td>
            <td><?php echo $row->nomor_conto; ?></td>
            <td><?php echo $analisis->kode_conto.$no++; ?></td>
            <td><?php echo !empty($nilai) ? $nilai->nilai : 0; ?></td>
        </tr>

    <?php endforeach; ?>
    </tbody>
</table>