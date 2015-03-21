<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 11/23/13
 * Time: 10:00 AM
 */
$no = 1;

?>
<h1>Type Analisis</h1>
<hr>
<table class="table table-data">
    <thead>
    <tr>
        <th>No.</th>
        <th>ID</th>
        <th>Nama</th>
        <th>ID Lab</th>
        <th>Harga</th>
    </tr>
    </thead>
    <tbody>
    <?php foreach($type_analisis as $row): ?>
    <tr>
        <td><?php echo $no++; ?></td>
        <td><a href="<?php echo base_url('type_analisis/detail/'.$row->id_type_analisis); ?>"><?php echo $row->id_type; ?></a> </td>
        <td><?php echo $row->nama; ?></td>
        <td><?php echo $row->id_lab; ?></td>
        <td><?php echo format_rupiah($row->harga); ?></td>
    </tr>
    <?php endforeach; ?>
    </tbody>
</table>