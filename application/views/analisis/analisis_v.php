<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('analisis'); ?>">Analisis</a></li>
    <li class="active"><?php echo $title; ?></li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-flask"></span> Analisis <?php echo $title; ?></h2>
</div>
<!-- END PAGE TITLE -->

<!-- WIDGET -->
<div class="row">
    <div class="col-md-3">
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
                <div class="widget-int num-count"><?php echo count($analisis); ?></div>
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

        <?php if($this->session->flashdata('error_message')): ?>
            <div class="alert alert-danger">
                <?php echo $this->session->flashdata('error_message'); ?>
            </div>
        <?php endif; ?>


        <div class="panel panel-default">
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>No</th>
                        <th>Nomor Analisis</th>
                        <th>Jenis Conto</th>
                        <th>Jumlah Conto</th>
                        <th>Tanggal Daftar</th>
                        <th>Status</th>
                        <th>Aksi</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no=1; foreach ($analisis as $row): ?>
                        <tr>
                            <td><?php echo $no++; ?></td>
                            <td><?php echo $row->nomor_analisis; ?></td>
                            <td><?php echo $row->jenis_conto; ?></td>
                            <td><?php echo $row->jumlah_conto; ?></td>
                            <td><?php echo tanggal_format_indonesia($row->tanggal_terima); ?></td>
                            <td class="status">
                                <?php echo status_label($row->is_selesai); ?>
                            </td>
                            <td>
                                <div class="btn-group btn-group-sm">
                                    <a href="<?php echo base_url('analisis/detail/'.$row->id); ?>" class="btn btn-primary"><i class="fa fa-edit"></i> Analisis</a>
                                </div>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
                <sup>*Klik Selesai jika sudah selesai menganalisis</sup>

            </div>
        </div>
    </div>
</div>