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
    <li class="active">Parameter</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><i class="fa fa-flask"></i> Parameter</h2>
    <?php if($this->tinyauth->is_admin()): ?>
    <a href="<?php echo base_url('parameter/create'); ?>" class="pull-right btn btn-primary"><i class="fa fa-plus"></i> Tambah</a>
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
                        <th>Nama</th>
                        <th>Deskripsi</th>
                        <th>Satuan</th>
                        <th>Harga</th>
                        <th>Detail</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach($parameter as $row): ?>
                        <tr>
                            <td><?php echo $no++; ?></td>
                            <td><?php echo $row->nama; ?></td>
                            <td><?php echo $row->deskripsi; ?></td>
                            <td><?php echo $row->satuan; ?></td>
                            <td><?php echo format_rupiah($row->harga); ?></td>
                            <td><a href="<?php echo base_url('parameter/detail/'.$row->id); ?>" class="btn btn-info">Detail</a> </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>