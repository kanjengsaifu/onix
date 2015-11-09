<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 5/17/15
 * Time: 11:54 PM
 */

$file = date('YmdHis').'_transaksi_'.$from.'_'.$to.'.xls';
header("Content-type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=$file");

?>
<table>
    <tbody>
    <tr>
        <th colspan="2" align="left">Dari</th>
        <td colspan="2"><?php echo tanggal_format_indonesia($from); ?></td>
    </tr>
    <tr>
        <th colspan="2" align="left">Sampai</th>
        <td colspan="2"><?php echo tanggal_format_indonesia($to); ?></td>
    </tr>
    <tr>
        <th colspan="2" align="left">Jumlah Permohonan</th>
        <td colspan="2" align="left"><?php echo count($permohonan); ?></td>
    </tr>
    <tr>
        <th colspan="2" align="left">Total Transaksi</th>
        <td colspan="2"><?php echo format_rupiah($total_transaksi); ?></td>
    </tr>
    </tbody>
</table>

<table>
    <tr>
        <td></td>
    </tr>
</table>

<table>
    <thead>
    <tr>
        <th>Nomor Analisis</th>
        <th>Lab</th>
        <th>Jenis Conto</th>
        <th>Pemohon</th>
        <th>Tanggal Daftar</th>
        <th>Biaya</th>
        <th>Status</th>
    </tr>
    </thead>
    <tbody>
    <?php $no = 1; foreach ($permohonan as $analisis): ?>
        <tr>
            <td><?php echo $analisis->nomor_analisis; ?> - <?php echo substr($analisis->nomor_analisis,6,5) + $analisis->jumlah_conto - 1; ?></td>
            <td><?php echo $analisis->lab; ?></td>
            <td><?php echo $analisis->jenis_conto; ?></td>
            <td><?php echo $analisis->nama_pemohon; ?></td>
            <td><?php echo tanggal_format_indonesia($analisis->tanggal_terima); ?></td>
            <td><?php echo format_rupiah($analisis->biaya); ?></td>
            <td><?php echo !$analisis->is_cancel ? 'PROSES' : 'CANCEL'; ?></td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>