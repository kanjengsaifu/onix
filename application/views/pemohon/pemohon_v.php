<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active">Pemohon</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-users"></span> Pemohon</h2>
</div>
<!-- END PAGE TITLE -->

<!-- WIDGET -->
<div class="row">
    <div class="col-md-3">
    </div>
    <div class="col-md-3">
    </div>
    <div class="col-md-3">
        <div class="widget widget-default widget-item-icon">
            <div class="widget-item-left">
                <i class="fa fa-users"></i>
            </div>
            <div class="widget-data">
                <div class="widget-int num-count"><?php echo count($pemohon); ?></div>
                <div class="widget-title">Pemohon</div>
                <div class="widget-subtitle">Terdaftar</div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="widget widget-default">
            <div class="widget-big-int plugin-clock">00:00</div>
            <div class="widget-subtitle"><?php echo getHari(date('w')).', '.tanggal_format_indonesia(now(TRUE)); ?></div>
        </div>
    </div>
</div>
<!-- END WIDGET -->


<div class="row">
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">Listing Pemohon</h3>
                <ul class="panel-controls">
                    <li><a href="<?php echo base_url('pemohon/create'); ?>" title="Tambah Pemohon"><span class="fa fa-plus"></span></a></li>
                </ul>
            </div>
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>NO</th>
                        <th>Tipe</th>
                        <th>Nama</th>
                        <th>Alamat</th>
                        <?php if($this->tinyauth->is_admin()): ?>
<!--                            <th>Username</th>-->
<!--                            <th>Password</th>-->
                            <th>Detail</th>
                        <?php endif; ?>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    $no = 1;
                    foreach($pemohon as $row):
                        ?>
                        <tr>
                            <td><?php echo $no++; ?>.</td>
                            <td><?php echo strtoupper($row->type_pemohon); ?></td>
                            <td><?php echo $row->nama; ?></td>
                            <td><?php echo $row->alamat; ?></td>
                            <?php if($this->tinyauth->is_admin()): ?>
<!--                                <td>--><?php //echo $row->username; ?><!--</td>-->
<!--                                <td>--><?php //echo $row->pass_awal; ?><!--</td>-->
                                <td>
                                    <a href="<?php echo base_url('pemohon/detail/'.$row->id_pemohon); ?>" class="btn btn-info">Detail</a>
                                </td>
                            <?php endif; ?>
                        </tr>
                    <?php
                    endforeach;
                    ?>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>


