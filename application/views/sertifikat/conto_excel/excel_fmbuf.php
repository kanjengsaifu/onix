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
        <th>KODE CONTO</th>
        <th>METODA UJI</th>
        <th>KUAT TEKAN (kg/cm<sup>2</sup>)</th>
        <th>BERAT JENIS (gr/cm<sup>3</sup>)</th>
    </tr>
    </thead>
    <tbody>
    <?php $no = 1 ; foreach($conto as $row):
            $detail_fisika_fmbbj = $this->conto_m->detail_fisika($row->id, 13);
            $nilai = json_decode($detail_fisika_fmbbj->nilai);
        ?>
        <tr>
            <td><?php echo $no; ?>.</td>
            <td><?php echo $analisis->kode_conto.$no++; ?></td>
            <td><?php echo $nilai->metoda_uji; ?></td>
            <td><?php echo $nilai->kuat_tekan; ?></td>
            <td><?php echo $nilai->berat_jenis; ?></td>
        </tr>

    <?php endforeach; ?>
    </tbody>
</table>