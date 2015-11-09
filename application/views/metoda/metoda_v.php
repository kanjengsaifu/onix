<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active">Metoda</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-gears"></span> Metoda</h2>
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
                <i class="fa fa-refresh"></i>
            </div>
            <div class="widget-data">
                <div class="widget-int num-count"><?php echo count($metoda); ?></div>
                <div class="widget-title">Metoda</div>
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
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title">Metoda</h3>
                <ul class="panel-controls">
                    <li><a href="<?php echo base_url('metoda/create'); ?>"><i class="fa fa-plus"></i> </a> </li>
                </ul>
            </div>
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Metoda</th>
                        <th>Lab</th>
                        <th>Detail</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no = 1; foreach ($metoda as $row):?>
                        <tr>
                            <td><?php echo $no++; ?>. </td>
                            <td><?php echo $row->nama; ?></td>
                            <td><?php echo $row->lab; ?></td>
                            <td><a href="<?php echo base_url('metoda/detail/'.$row->id_metoda); ?>" class="btn btn-info btn-sm">Detail</a> </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>