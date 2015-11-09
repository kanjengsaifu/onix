<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active">Lokasi</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-gears"></span> Lokasi</h2>
</div>
<!-- END PAGE TITLE -->

<!-- WIDGET -->
<div class="row">
    <div class="col-md-3">
    </div>
    <div class="col-md-3">
        <div class="widget widget-default widget-item-icon">
            <div class="widget-item-left">
                <i class="fa fa-database"></i>
            </div>
            <div class="widget-data">
                <div class="widget-int num-count"><?php echo count($provinsi); ?></div>
                <div class="widget-title">Provinsi</div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="widget widget-default widget-item-icon">
            <div class="widget-item-left">
                <i class="fa fa-refresh"></i>
            </div>
            <div class="widget-data">
                <div class="widget-int num-count"><?php echo count($kabupaten); ?></div>
                <div class="widget-title">Kabupaten</div>
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
    <div class="col-md-6">
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title">Provinsi</h3>
                <ul class="panel-controls">
                    <li><a href="<?php echo base_url('lokasi/insert_provinsi'); ?>"><i class="fa fa-plus"></i> </a> </li>
                </ul>
            </div>
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Provinsi</th>
                        <th>Detail</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no = 1; foreach ($provinsi as $row_provinsi):?>
                        <tr>
                            <td><?php echo $no++; ?>. </td>
                            <td><?php echo $row_provinsi->nama; ?></td>
                            <td><a href="<?php echo base_url('lokasi/detail_provinsi/'.$row_provinsi->id_provinsi); ?>" class="btn btn-info btn-sm">Detail</a> </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Kabupaten</h3>
                <ul class="panel-controls">
                    <li><a href="<?php echo base_url('lokasi/insert_kabupaten'); ?>"><i class="fa fa-plus"></i> </a> </li>
                </ul>
            </div>
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Kabupaten</th>
                        <th>Provinsi</th>
                        <th>Detail</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no = 1; foreach ($kabupaten as $row_kabupaten):?>
                        <tr>
                            <td><?php echo $no++; ?>. </td>
                            <td><?php echo $row_kabupaten->nama; ?></td>
                            <td><?php echo $row_kabupaten->provinsi; ?></td>
                            <td><a href="<?php echo base_url('lokasi/detail_kabupaten/'.$row_kabupaten->id_kabupaten); ?>" class="btn btn-info btn-sm">Detail</a> </td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>