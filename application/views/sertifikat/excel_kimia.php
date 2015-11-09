<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 4/21/15
 * Time: 12:50 PM
 */

$file = date('YmdHis').'_'.$analisis->nomor_analisis.'k'.'.xls';
header("Content-type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=$file");
$no = 1;

?>

<table align="left">
    <tbody>
    <tr>
        <td colspan="2">NOMOR ANALISIS KIMIA</td>
        <td colspan="4"><?php echo $analisis->nomor_analisis; ?> - <?php echo substr($analisis->nomor_analisis,6,5) + $analisis->jumlah_conto - 1; ?></td>
    </tr>
    <tr>
        <td colspan="2">JUMLAH CONTO</td>
        <td colspan="4"><?php echo $analisis->jumlah_conto; ?></td>
    </tr>
    <tr>
        <td colspan="2">JENIS CONTO</td>
        <td colspan="4"><?php echo $analisis->jenis_conto; ?></td>
    </tr>
    <tr>
        <td colspan="2">LOKASI</td>
        <td colspan="4"><?php echo $analisis->nama_lokasi; ?></td>
    </tr>
    <tr>
        <td colspan="2">TANGGAL ANALISIS</td>
        <td colspan="4"><?php echo tanggal_format_indonesia($analisis->tanggal_analisis); ?></td>
    </tr>
    <tr>
        <td colspan="2">ANALISIS UNTUK</td>
        <td colspan="4"><?php echo $pemohon->nama_sertifikat; ?></td>
    </tr>
    </tbody>
</table>

<table align="left">
    <tr>
        <td></td>
    </tr>
</table>

<table>
    <thead>
    <tr>
        <th>Parameter</th>
        <th>Metoda</th>
    </tr>
    </thead>
    <tbody>
        <?php foreach($parameter as $col_metoda): ?>
        <tr>
            <td><?php echo $col_metoda->nama_parameter; ?></td>
            <td><?php echo $col_metoda->metoda; ?></td>
        </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<table align="left">
    <tr>
        <td></td>
    </tr>
</table>

<table align="center">
    <thead>
    <tr>
        <th rowspan="2" valign="middle">Nomor Analisis</th>
        <th rowspan="2" valign="middle">Kode Conto</th>
        <?php foreach($parameter as $col_parameter): ?>
            <th><?php echo $col_parameter->nama_parameter; ?></th>
        <?php endforeach; ?>
    </tr>
    <tr>
        <?php foreach($parameter as $col_satuan): ?>
            <td>(<?php echo $col_satuan->satuan; ?>)</td>
        <?php endforeach; ?>
    </tr>
    </thead>
    <tbody>
    <?php foreach($conto as $row_conto): ?>
    <tr>
        <td>
            <?php echo $row_conto->nomor_conto; ?>
        </td>
        <td>
            <?php echo $row_conto->kode_conto; ?>
        </td>
        <?php foreach($row_conto->detail_parameter as $col_detail_parameter): ?>
            <td><?php echo $col_detail_parameter->nilai; ?></td>
        <?php endforeach; ?>
    </tr>
    <?php endforeach; ?>
    </tbody>
</table>