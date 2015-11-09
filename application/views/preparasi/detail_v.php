<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('preparasi'); ?>">Preparasi</a></li>
    <li class="active">Detail</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-gears"></span> Detail Preparasi</h2>
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
                <div class="widget-int num-count"><?php echo label_status_preparasi($preparasi->status); ?></div>
                <div class="widget-title">Preparasi</div>
                <div class="widget-subtitle">Status</div>
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
    <div class="col-md-4">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Analisis</h3>
            </div>
            <div class="panel-body list-group">
                <div class="list-group-item">
                    <h6>Nomor Analisis</h6>
                    <p><?php echo $analisis->nomor_analisis; ?></p>
                </div>
                <div class="list-group-item">
                    <h6>Jenis Conto</h6>
                    <p><?php echo $analisis->jenis_conto; ?></p>
                </div>
                <div class="list-group-item">
                    <h6>Jumlah Conto</h6>
                    <p><?php echo $analisis->jumlah_conto; ?></p>
                </div>
                <div class="list-group-item">
                    <h6>Preparasi untuk Laboratorium</h6>
                    <p><?php echo $analisis->lab; ?></p>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-4">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Preparasi</h3>
            </div>
            <div class="panel-body list-group">
                <div class="list-group-item">
                    <h6>Tanggal Masuk</h6>
                    <p><?php echo tanggal_format_indonesia($preparasi->tanggal_masuk); ?></p>
                </div>
                <div class="list-group-item">
                    <h6>Tanggal Mulai</h6>
                    <p><?php echo tanggal_format_indonesia($preparasi->tanggal_mulai); ?></p>
                </div>
                <div class="list-group-item">
                    <h6>Petugas Preparasi</h6>
                    <p><?php echo $preparasi->petugas; ?></p>
                </div>
                <div class="list-group-item">
                    <h6>Status</h6>
                    <p><?php echo label_status_preparasi($preparasi->status); ?></p>
                </div>
                <div class="list-group-item">
                    <h6>Tanggal Selesai</h6>
                    <p><?php echo tanggal_format_indonesia($preparasi->tanggal_selesai); ?></p>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-4">

        <?php
            switch($preparasi->status)
            {
                case 0:
                    $title = 'Terima Conto';
                    $deskripsi = 'Jika Conto sudah diterima mohon klik Terima Conto.';
                    $status = 1;
                    $id_kegiatan = 2;
                    $button = 'btn-primary';
                    break;
                case 1:
                    $title = 'Mulai Preparasi';
                    $deskripsi = 'Dengan mengklik tombol proses preparasi, maka tanggal masuk preparasi akan terisi tanggal hari ini dan status preparasi akan berubah menjadi proses.';
                    $status = 2;
                    $id_kegiatan = 3;
                    $button = 'btn-warning';
                    break;
                case 2:
                    $title = 'Selesai Preparasi';
                    $deskripsi = 'Dengan mengklik tombol selesai preparasi, maka tanggal selesai preparasi akan terisi tanggal hari ini dan status preparasi akan berubah menjadi selesai.';
                    $status = 3;
                    $id_kegiatan = 4;
                    $button = 'btn-warning';
                    break;
                default:
                    $title = "Sudah selesai Preparasi";
                    $deskripsi = '';
                    $status = '';
                    $id_kegiatan = '';
                    $button = 'disabled';
            }


        ?>
        <form action="<?php echo base_url('preparasi/update_status'); ?>" method="post">
            <h3><?php echo $title; ?></h3>
            <p><?php echo $deskripsi; ?></p>
            <input type="hidden" name="id" value="<?php echo $preparasi->id; ?>">
            <input type="hidden" name="id_analisis" value="<?php echo $analisis->id; ?>">
            <input type="hidden" name="status" value="<?php echo $status; ?>">
            <input type="hidden" name="id_kegiatan" value="<?php echo $id_kegiatan; ?>">
            <button class="btn <?php echo $button; ?> pull-right"><?php echo $title; ?></button>
        </form>
    </div>
</div>