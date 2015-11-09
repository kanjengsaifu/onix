<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active">Permohonan</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-edit"></span> Permohonan</h2>
</div>
<!-- END PAGE TITLE -->

<!-- WIDGET -->
<div class="row">
    <div class="col-md-3">
        <div class="widget widget-success widget-no-subtitle">
            <div class="widget-big-int">
                <span class="num-count"><?php echo $transaksi_bulan_ini; ?></span>
            </div>
            <div class="widget-subtitle">Transaksi Bulan Ini</div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="widget widget-default widget-item-icon">
            <div class="widget-item-left">
                <i class="fa fa-refresh"></i>
            </div>
            <div class="widget-data">
                <div class="widget-int num-count"><?php echo count($permohonan_bulan_ini); ?></div>
                <div class="widget-title">Analisis</div>
                <div class="widget-subtitle">Bulan <?php echo getBulan(date('m')); ?></div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="widget widget-default widget-item-icon">
            <div class="widget-item-left">
                <i class="fa fa-database"></i>
            </div>
            <div class="widget-data">
                <div class="widget-int num-count"><?php echo count($permohonan); ?></div>
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
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">Listing Permohonan</h3>
                <?php if($this->tinyauth->is_admin()): ?>
                <ul class="panel-controls">
                    <li class="dropdown" data-placement="top" data-toggle="tooltip" data-original-title="Tambah form analisis">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-plus" ></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<?php echo base_url('permohonan/daftar/kml'); ?>">Kimia Logam</a></li>
                            <li><a href="<?php echo base_url('permohonan/daftar/knl'); ?>">Kimia Bukan Logam</a></li>
                            <li><a href="<?php echo base_url('permohonan/daftar/kpb'); ?>">Panas Bumi</a></li>
                            <li><a href="<?php echo base_url('permohonan/daftar/kbb'); ?>">Kimia Batubara & Material Organik</a></li>
                            <li><a href="<?php echo base_url('permohonan/daftar/kgb'); ?>">Kimia Gambut</a></li>
                            <li><a href="<?php echo base_url('permohonan/daftar/fmb'); ?>">Fisika Mineral & Batubara</a></li>
                        </ul>
                    </li>
                </ul>
                <?php endif; ?>
            </div>
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Nomor Analisis</th>
                        <th>Lab</th>
                        <th>Jenis Conto</th>
                        <th>Pemohon</th>
                        <th>Tanggal Daftar</th>
                        <th>Status</th>
                        <th>Detail</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no = 1; foreach ($permohonan as $analisis): ?>
                        <tr>
                            <td><?php echo $no++; ?>. </td>
                            <td><?php echo $analisis->nomor_analisis; ?> - <?php echo substr($analisis->nomor_analisis,6,5) + $analisis->jumlah_conto - 1; ?></td>
                            <td><?php echo $analisis->lab; ?></td>
                            <td><?php echo $analisis->jenis_conto; ?></td>
                            <td><?php echo $analisis->nama_pemohon; ?></td>
                            <td><?php echo tanggal_format_indonesia($analisis->tanggal_terima); ?></td>
                            <td><?php echo status_label($analisis->is_selesai); ?></td>
                            <td><a href="<?php echo base_url('permohonan/detail/'.$analisis->id); ?>" class="btn btn-info btn-sm">Detail</a> </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>