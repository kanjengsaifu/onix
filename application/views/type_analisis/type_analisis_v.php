<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 11/23/13
 * Time: 10:00 AM
 */
$no = 1;

?>

<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active">Tipe Analisis</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><i class="fa fa-flask"></i> Tipe Analisis</h2>
    <?php if($this->tinyauth->is_admin()): ?>
    <a href="<?php echo base_url('type_analisis/create'); ?>" class="pull-right btn btn-primary"><i class="fa fa-plus"></i> Tambah</a>
    <?php endif; ?>
</div>
<!-- END PAGE TITLE -->

<div class="row">
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>No.</th>
                        <th>ID</th>
                        <th>Nama</th>
                        <th>ID Lab</th>
                        <th>Harga</th>
                        <th>Detail</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach($type_analisis as $row): ?>
                        <tr>
                            <td><?php echo $no++; ?></td>
                            <td><?php echo strtoupper($row->id_type_analisis); ?></td>
                            <td><?php echo $row->nama; ?></td>
                            <td><?php echo $row->id_lab; ?></td>
                            <td><?php echo format_rupiah($row->harga); ?></td>
                            <td><a href="<?php echo base_url('type_analisis/detail/'.$row->id_type_analisis); ?>" class="btn btn-info">Detail</a> </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>