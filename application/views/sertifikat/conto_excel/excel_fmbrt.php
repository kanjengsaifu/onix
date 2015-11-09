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
        <td colspan="6"><?php echo $pemohon->nama_sertifikat; ?></td>
        <td>JUMLAH CONTO</td>
        <td><?php echo $analisis->jumlah_conto; ?> Conto</td>
    </tr>
    <tr>
        <td>LOKASI</td>
        <td colspan="6"><?php echo $analisis->nama_lokasi; ?></td>
        <td>PENGUJI</td>
        <td>LAB. FISIKA MINERAL</td>
    </tr>
    </tbody>
</table>

<table>
    <thead>
    <tr>
        <th rowspan="2">NO.</th>
        <th rowspan="2">NOMOR ANALISIS</th>
        <th rowspan="2">KODE CONTO</th>
        <th colspan="2">KANDUNGAN</th>
        <th colspan="2">SPECIFIK GRAFITY (gr/cm<sup>3</sup>)</th>
    </tr>
    <tr>
        <th>AIR</th>
        <th>MINYAK</th>
        <th>BATUAN</th>
        <th>MINYAK</th>
    </tr>
    </thead>
    <tbody>
    <?php $no = 1 ; foreach($conto as $row):
            $detail_fisika_fmbbj = $this->conto_m->detail_fisika($row->id, 10);
            $nilai = json_decode($detail_fisika_fmbbj->nilai);
        ?>
        <tr>
            <td><?php echo $no; ?>.</td>
            <td><?php echo $row->nomor_conto; ?></td>
            <td><?php echo $analisis->kode_conto.$no++; ?></td>
            <td><?php echo !empty($nilai) ? $nilai->kandungan_air : '-' ?></td>
            <td><?php echo !empty($nilai) ? $nilai->kandungan_minyak : '-' ?></td>
            <td><?php echo !empty($nilai) ? $nilai->sp_batuan : '-' ?></td>
            <td><?php echo !empty($nilai) ? $nilai->sp_minyak : '-' ?></td>
        </tr>

    <?php endforeach; ?>
    </tbody>
</table>