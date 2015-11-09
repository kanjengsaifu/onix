<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active"><?php echo ucwords($title); ?></li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-flask"></span> Laboratorium <?php echo ucwords($title); ?></h2>
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
                <i class="fa fa-database"></i>
            </div>
            <div class="widget-data">
                <div class="widget-int num-count"><?php echo $jumlah_analisis_tersimpan; ?></div>
                <div class="widget-title">Analisis</div>
                <div class="widget-subtitle">Tersimpan</div>
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
    <?php foreach($lab as $row): ?>
        <div class="col-md-4">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="panel-title"><?php echo $row->nama; ?></div>
                </div>
                <div class="panel-body list-group">
                    <div class="list-group-item">
                        Jumlah Permohonan
                        <span class="badge badge-primary"><?php echo $row->jumlah_permohonan; ?></span>
                    </div>
                    <div class="list-group-item">
                        Jumlah Conto
                        <span class="badge badge-danger"><?php echo is_null($row->jumlah_conto) ? 0 : $row->jumlah_conto; ?></span>
                    </div>
                    <div class="list-group-item">
                        <a href="<?php echo base_url('analisis/lab/'.$row->id_lab); ?>" class="btn btn-primary btn-block">Detail</a>
                    </div>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
</div>
