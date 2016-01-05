<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active">Lokasi</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-gears"></span> Reference <?php echo form_error('deskripsi', '<small class="text-danger">', '</small>'); ?></h2>
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
                <div class="widget-int num-count"><?php echo count($satuan); ?></div>
                <div class="widget-title">Satuan</div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="widget widget-default widget-item-icon">
            <div class="widget-item-left">
                <i class="fa fa-refresh"></i>
            </div>
            <div class="widget-data">
                <div class="widget-int num-count"><?php echo count($mineral); ?></div>
                <div class="widget-title">Mineral</div>
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
                <h3 class="panel-title">Satuan</h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo base_url('reference/create/satuan'); ?>" method="post" class="input-group">
                    <input type="text" name="deskripsi" class="form-control" placeholder="Satuan">
                    <input type="hidden" name="table" value="satuan">
                    <span class="input-group-btn">
                        <button class="btn btn-primary">Tambah Satuan</button>
                    </span>
                </form>
                <div class="h2"></div>

                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Satuan</th>
                        <th>Detail</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no = 1; foreach ($satuan as $row_satuan):?>
                        <tr>
                            <td><?php echo $no++; ?>. </td>
                            <td><?php echo $row_satuan->deskripsi; ?></td>
                            <td><a href="<?php echo base_url('reference/detail/satuan/'.$row_satuan->id); ?>" class="btn btn-info btn-sm">Detail</a> </td>
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
                <h3 class="panel-title">Mineral</h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo base_url('reference/create/mineral'); ?>" method="post" class="input-group">
                    <input type="text" name="deskripsi" class="form-control" placeholder="Mineral">
                    <input type="hidden" name="table" value="mineral">
                    <span class="input-group-btn">
                        <button class="btn btn-primary">Tambah Mineral</button>
                    </span>
                </form>
                <div class="h2"></div>

                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Mineral</th>
                        <th>Detail</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no = 1; foreach ($mineral as $row_mineral):?>
                        <tr>
                            <td><?php echo $no++; ?>. </td>
                            <td><?php echo $row_mineral->deskripsi; ?></td>
                            <td><a href="<?php echo base_url('reference/detail/mineral/'.$row_mineral->id); ?>" class="btn btn-info btn-sm">Detail</a> </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>