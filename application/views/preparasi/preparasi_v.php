<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active">Preparasi</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-gears"></span> Preparasi</h2>
</div>
<!-- END PAGE TITLE -->

<!-- WIDGET -->
<div class="row">
    <div class="col-md-3">
<!--        <div class="widget widget-default widget-item-icon">-->
<!--            <div class="widget-item-left">-->
<!--                <i class="fa fa-inbox"></i>-->
<!--            </div>-->
<!--            <div class="widget-data">-->
<!--                <div class="widget-int num-count">5</div>-->
<!--                <div class="widget-title">Preparasi</div>-->
<!--                <div class="widget-subtitle">Baru</div>-->
<!--            </div>-->
<!--        </div>-->
    </div>
    <div class="col-md-3">
<!--        <div class="widget widget-default widget-item-icon">-->
<!--            <div class="widget-item-left">-->
<!--                <i class="fa fa-refresh"></i>-->
<!--            </div>-->
<!--            <div class="widget-data">-->
<!--                <div class="widget-int num-count">20</div>-->
<!--                <div class="widget-title">Preparasi</div>-->
<!--                <div class="widget-subtitle">Dalam Proses</div>-->
<!--            </div>-->
<!--        </div>-->
    </div>
    <div class="col-md-3">
        <div class="widget widget-default widget-item-icon">
            <div class="widget-item-left">
                <i class="fa fa-database"></i>
            </div>
            <div class="widget-data">
                <div class="widget-int num-count"><?php echo count($preparasi); ?></div>
                <div class="widget-title">Preparasi</div>
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
    <div class="col-md-6">
        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title">Listing Permohonan Preparasi Pending</h3>
            </div>
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Nomor Analisis</th>
                        <th>Jenis Conto</th>
                        <th>Jumlah Conto</th>
                        <th>Tanggal Daftar</th>
                        <th>Status</th>
                        <th>Detail</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no = 1; foreach ($preparasi as $row): if($row->status == 0):?>
                        <tr>
                            <td><?php echo $no++; ?>. </td>
                            <td><?php echo $row->analisis->nomor_analisis; ?></td>
                            <td><?php echo $row->analisis->jenis_conto; ?></td>
                            <td><?php echo $row->analisis->jumlah_conto; ?></td>
                            <td><?php echo tanggal_format_indonesia($row->analisis->tanggal_terima); ?></td>
                            <td><?php echo label_status_preparasi($row->status); ?></td>
                            <td><a href="<?php echo base_url('preparasi/detail/'.$row->id); ?>" class="btn btn-info btn-sm">Detail</a> </td>
                        </tr>
                    <?php endif; endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Listing Permohonan Preparasi Terima</h3>
            </div>
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Nomor Analisis</th>
                        <th>Jenis Conto</th>
                        <th>Jumlah Conto</th>
                        <th>Tanggal Daftar</th>
                        <th>Status</th>
                        <th>Detail</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no = 1; foreach ($preparasi as $row): if($row->status == 1):?>
                        <tr>
                            <td><?php echo $no++; ?>. </td>
                            <td><?php echo $row->analisis->nomor_analisis; ?></td>
                            <td><?php echo $row->analisis->jenis_conto; ?></td>
                            <td><?php echo $row->analisis->jumlah_conto; ?></td>
                            <td><?php echo tanggal_format_indonesia($row->analisis->tanggal_terima); ?></td>
                            <td><?php echo label_status_preparasi($row->status); ?></td>
                            <td><a href="<?php echo base_url('preparasi/detail/'.$row->id); ?>" class="btn btn-info btn-sm">Detail</a> </td>
                        </tr>
                    <?php endif; endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <h3 class="panel-title">Listing Permohonan Preparasi dalam Proses</h3>
            </div>
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Nomor Analisis</th>
                        <th>Jenis Conto</th>
                        <th>Jumlah Conto</th>
                        <th>Tanggal Daftar</th>
                        <th>Status</th>
                        <th>Detail</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no = 1; foreach ($preparasi as $row): if($row->status == 2 && $row->id_petugas == $this->session->userdata('logged_id')):?>
                        <tr>
                            <td><?php echo $no++; ?>. </td>
                            <td><?php echo $row->analisis->nomor_analisis; ?></td>
                            <td><?php echo $row->analisis->jenis_conto; ?></td>
                            <td><?php echo $row->analisis->jumlah_conto; ?></td>
                            <td><?php echo tanggal_format_indonesia($row->analisis->tanggal_terima); ?></td>
                            <td><?php echo label_status_preparasi($row->status); ?></td>
                            <td><a href="<?php echo base_url('preparasi/detail/'.$row->id); ?>" class="btn btn-info btn-sm">Detail</a> </td>
                        </tr>
                    <?php endif; endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="panel panel-success">
            <div class="panel-heading">
                <h3 class="panel-title">Listing Permohonan Preparasi Selesai</h3>
            </div>
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Nomor Analisis</th>
                        <th>Jenis Conto</th>
                        <th>Jumlah Conto</th>
                        <th>Tanggal Daftar</th>
                        <th>Status</th>
                        <th>Detail</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no = 1; foreach ($preparasi as $row): if($row->status == 3 && $row->id_petugas == $this->session->userdata('logged_id')):?>
                        <tr>
                            <td><?php echo $no++; ?>. </td>
                            <td><?php echo $row->analisis->nomor_analisis; ?></td>
                            <td><?php echo $row->analisis->jenis_conto; ?></td>
                            <td><?php echo $row->analisis->jumlah_conto; ?></td>
                            <td><?php echo tanggal_format_indonesia($row->analisis->tanggal_terima); ?></td>
                            <td><?php echo label_status_preparasi($row->status); ?></td>
                            <td><a href="<?php echo base_url('preparasi/detail/'.$row->id); ?>" class="btn btn-info btn-sm">Detail</a> </td>
                        </tr>
                    <?php endif; endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>