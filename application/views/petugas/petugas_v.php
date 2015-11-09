<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active">Petugas</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-user"></span> Petugas</h2>
</div>
<!-- END PAGE TITLE -->

<!-- WIDGET -->
<div class="row">
    <div class="col-md-3">
    </div>
    <div class="col-md-3">
        <div class="widget widget-default widget-item-icon">
            <div class="widget-item-left">
                <i class="fa fa-user-secret"></i>
            </div>
            <div class="widget-data">
                <div class="widget-int num-count"><?php echo $petugas_count_logged_in; ?></div>
                <div class="widget-title">Petugas</div>
                <div class="widget-subtitle">Sedang Login</div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="widget widget-default widget-item-icon">
            <div class="widget-item-left">
                <i class="fa fa-user"></i>
            </div>
            <div class="widget-data">
                <div class="widget-int num-count"><?php echo count($petugas); ?></div>
                <div class="widget-title">Petugas</div>
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
                <h3 class="panel-title">Listing Petugas</h3>
                <?php if($this->tinyauth->is_admin()): ?>
                <ul class="panel-controls">
                    <li><a href="<?php echo base_url('petugas/create'); ?>" title="Tambah Petugas"><span class="fa fa-plus"></span></a></li>
                </ul>
                <?php endif; ?>
            </div>
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>NIP</th>
                        <th>Nama</th>
                        <th>Komoditi</th>
                        <th>Username</th>
                        <th>Aksi</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no = 1; foreach($petugas as $row): ?>
                        <tr id="<?php echo $row->id_petugas; ?>">
                            <td><?php echo $no++; ?>.</td>
                            <td><?php echo $row->nip; ?></td>
                            <td><?php echo $row->nama; ?></td>
                            <td><?php echo strtoupper($row->komoditi); ?></td>
                            <td><?php echo $row->username; ?></td>
                            <td>
                                <a href="<?php echo base_url('petugas/detail/'.$row->id_petugas); ?>" class="btn btn-info">Detail</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


