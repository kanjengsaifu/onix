<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('permohonan'); ?>">Permohonan</a></li>
    <li class="active"><?php echo $analisis->nomor_analisis; ?></li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-bookmark"></span> Detail Permohonan</h2>
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
                <div class="widget-int num-count">Proses</div>
                <div class="widget-title">Permohonan</div>
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
    <div class="col-sm-4">
        <div class="panel">
            <div class="panel-body list-group">
                <div class="list-group-item">
                    Nomor Analisis <div class="pull-right"><?php echo $analisis->nomor_analisis; ?></div>
                </div>
                <div class="list-group-item">
                    Status
                    <div class="pull-right">
                        <?php echo $status_string; ?>
                    </div>
                </div>
                <div class="list-group-item">
                    Jumlah Conto <div class="pull-right"><?php echo $analisis->jumlah_conto; ?></div>
                </div>
                <div class="list-group-item">
                    Jenis Conto <div class="pull-right"><?php echo $analisis->jenis_conto; ?></div>
                </div>
                <div class="list-group-item">
                    Laboratorium <div class="pull-right"><strong><?php echo $analisis->laboratorium; ?></strong></div>
                </div>
                <div class="list-group-item">
                    Tanggal Estimasi selesai <div class="pull-right"><strong><?php echo tanggal_format_indonesia($tanggal_estimasi_selesai) ?></strong></div>
                </div>
                <div class="list-group-item">
                    Tanggal Selesai Preparasi <div class="pull-right"><strong><?php echo tanggal_format_indonesia($preparasi->tanggal_selesai) ?></strong></div>
                </div>
                <div class="list-group-item">
                    Total Biaya <div class="pull-right"><strong><?php echo format_rupiah($analisis->biaya); ?></strong></div>
                </div>
                <div class="list-group-item">
                    <a href="<?php echo base_url('permohonan/conto/' . $analisis->id); ?>" class="btn btn-info"><i class="fa fa-flask"></i> Conto Analisis</a>
                </div>
                <div class="list-group-item">
                    <label>Logo KAN</label>
                    <img src="<?php echo base_url(IMAGES.'logo-kan.png'); ?>" class="img-responsive">
                    <form class="input-group" action="<?php echo base_url('permohonan/update_logo_kan'); ?>" method="post">
                        <input type="hidden" value="<?php echo $analisis->id; ?>" name="id" class="form-control">
                        <span class="input-group-addon">Pakai Logo KAN</span>
                        <input type="checkbox" value="1" name="logo_kan" class="form-control" <?php set_checkbox_value($analisis->logo_kan, 1); ?>>
                        <span class="input-group-btn">
                            <button class="btn btn-warning"><i class="fa fa-edit"></i></button>
                        </span>
                    </form>
                </div>
                <div class="list-group-item">
                    <label>Nomor Sertifikat</label>
                    <form class="input-group" action="<?php echo base_url('permohonan/update_nomor_sertifikat'); ?>" method="post">
                        <span class="input-group-addon">No.</span>
                        <input type="hidden" value="<?php echo $analisis->id; ?>" name="id" class="form-control">
                        <input type="text" value="<?php echo $analisis->nomor_sertifikat; ?>" name="nomor_sertifikat" class="form-control">
                        <span class="input-group-btn">
                            <button class="btn btn-warning"><i class="fa fa-edit"></i></button>
                        </span>
                    </form>
                </div>
                <div class="list-group-item">
                    <label>Tanggal Dianalisis</label>
                    <form class="input-group" action="<?php echo base_url('permohonan/update_tanggal_analisis'); ?>" method="post">
                        <input type="hidden" value="<?php echo $analisis->id; ?>" name="id" class="form-control">
                        <input type="text" value="<?php echo $analisis->tanggal_analisis; ?>" name="tanggal_analisis" class="form-control datepicker">
                        <span class="input-group-btn">
                            <button class="btn btn-warning"><i class="fa fa-edit"></i></button>
                        </span>
                    </form>
                </div>
                <div class="list-group-item">
                    <label>Tanggal Publish</label>
                    <form class="input-group" action="<?php echo base_url('permohonan/update_tanggal_publish'); ?>" method="post">
                        <input type="hidden" value="<?php echo $analisis->id; ?>" name="id" class="form-control">
                        <input type="text" value="<?php echo $analisis->tanggal_publish; ?>" name="tanggal_publish" class="form-control datepicker">
                        <span class="input-group-btn">
                            <button class="btn btn-warning"><i class="fa fa-edit"></i></button>
                        </span>
                    </form>
                </div>
                <div class="list-group-item">
                    <label>Tanggal Estimasi Selesai</label>
                    <form class="input-group" action="<?php echo base_url('permohonan/update_estimasi_date'); ?>" method="post">
                        <input type="hidden" value="<?php echo $analisis->id; ?>" name="id" class="form-control">
                        <input type="text" value="<?php echo $analisis->estimasi_date; ?>" name="estimasi_date" class="form-control datepicker">
                        <span class="input-group-btn">
                            <button class="btn btn-warning"><i class="fa fa-edit"></i></button>
                        </span>
                    </form>
                </div>
            </div>
        </div>

        <?php if($button_selesai): ?>
            <form action="<?php echo base_url('permohonan/selesai_analisis'); ?>" method="post">
                <input type="hidden" name="id" value="<?php echo $analisis->id; ?>">
                <button class="btn btn-lg btn-success">Selesai Analisis</button>
            </form>
            <br>
        <?php endif; ?>

    </div>
    <div class="col-md-8">
        <div class="panel panel-info">
            <div class="panel-body sertifikat">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <h3><strong>SERTIFIKAT ANALISIS</strong></h3>
                        <i style="margin-top: -30px">(CERTIFICATE OF ANALYSIS)</i>
                    </div>
                </div>
                <div class="h3"></div>
                <div class="row">
                    <div class="col-lg-5">
                        <strong>Nomor Sertifikat</strong><br>
                    </div>
                    <div class="col-lg-1">:</div>
                    <div class="col-lg-6">
                        <strong>No. <?php echo $analisis->nomor_sertifikat; ?></strong>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5">
                        <strong>Tanggal Publish</strong>
                    </div>
                    <div class="col-lg-1">:</div>
                    <div class="col-lg-6">
                        <strong><?php echo tanggal_format_indonesia($analisis->tanggal_publish); ?></strong>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5">
                        <strong>Dibuat Untuk</strong><br>
                        <i>Certified for</i>
                    </div>
                    <div class="col-lg-1">:</div>
                    <div class="col-lg-6">
                        <strong><?php echo strtoupper($pemohon->nama_sertifikat); ?></strong>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5">
                        <strong>Alamat</strong><br>
                        <i>Address</i>
                    </div>
                    <div class="col-lg-1">:</div>
                    <div class="col-lg-6">
                        <strong><?php echo $pemohon->alamat; ?></strong>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5">
                        <strong>Jenis Conto</strong>
                        <br>
                        <i>Type of Sample</i>
                    </div>
                    <div class="col-lg-1">:</div>
                    <div class="col-lg-6">
                        <strong><?php echo $analisis->jenis_conto; ?></strong>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5">
                        <strong>Jumlah Conto</strong>
                        <br>
                        <i>Amount of Sample</i>
                    </div>
                    <div class="col-lg-1">:</div>
                    <div class="col-lg-6">
                        <strong><?php echo $analisis->jumlah_conto; ?> (<?php echo terbilang($analisis->jumlah_conto); ?>)</strong>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5">
                        <strong>Asal Conto</strong>
                        <br>
                        <i>Origin of Sample</i>
                    </div>
                    <div class="col-lg-1">:</div>
                    <div class="col-lg-6">
                        <strong><?php echo $analisis->nama_lokasi; ?></strong>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5">
                        <strong>Nomor Laboratorium</strong>
                        <br>
                        <i>Laboratory Number</i>
                    </div>
                    <div class="col-lg-1">:</div>
                    <div class="col-lg-6">
                        <strong><?php echo $analisis->nomor_analisis; ?> - <?php echo substr($analisis->nomor_analisis,6,5) + $analisis->jumlah_conto - 1; ?></strong>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5">
                        <strong>Tanggal Conto Diterima</strong>
                        <br>
                        <i>Date of Sample Received</i>
                    </div>
                    <div class="col-lg-1">:</div>
                    <div class="col-lg-6">
                        <strong><?php echo tanggal_format_indonesia($analisis->tanggal_terima); ?></strong>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-5">
                        <strong>Tanggal Conto Dianalisis</strong>
                        <br>
                        <i>Date of Sample Analysis</i>
                    </div>
                    <div class="col-lg-1">:</div>
                    <div class="col-lg-6">
                        <strong><?php echo tanggal_format_indonesia($analisis->tanggal_analisis); ?></strong>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="btn-group">
                    <a href="<?php echo base_url('sertifikat/cetak_sertifikat/'.$id_analisis)?>" class="btn btn-success"><i class="fa fa-print"></i> CETAK SERTIFIKAT ANALISIS </a>
                    <?php if(!$is_fisika): ?>
                        <a href="<?php echo base_url('sertifikat/export_kimia/'.$id_analisis)?>" class="btn btn-info"><i class="fa fa-print"></i> CETAK CONTO KIMIA </a>
                    <?php else: ?>
                        <a href="<?php echo base_url('permohonan/detail_conto_fisika/'.$id_analisis)?>" class="btn btn-info"><i class="fa fa-flask"></i> DETAIL CONTO FISIKA </a>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <div class="panel-title">
                    Tracking
                </div>
            </div>
            <div class="panel-body">
                <h2><?php echo $last_track->kegiatan; ?></h2>
            </div>
            <div class="panel-footer">
                <div class="">
                    <i class="fa fa-times-circle"></i> <?php echo tanggal_format_indonesia($last_track->updated_date, TRUE); ?>
                </div>
                <div class="">
                    <i class="fa fa-user"></i> <?php echo $last_track->petugas->nama; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <?php foreach($prosedur as $key => $row): ?>
        <?php echo !($key % 2) ? "<div class='clearfix'></div>" : ''; ?>
        <div class="col-md-6">
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-title">
                        <?php echo $row['type_analisis']->nama; ?>
                    </div>
                </div>
                <div class="panel-body tasks">
                    <?php
                        $no = 1;
                        foreach($row['kegiatan'] as $row_kegiatan):
                    ?>
                        <div class="task-item <?php echo $row_kegiatan->task_status; ?>" id="kegiatan-<?php echo $row_kegiatan->id; ?>">
                            <div class="task-text task-success ui-sortable-handle">
                                <strong class="form-control-static"><?php echo $no++ . '. ' . $row_kegiatan->kegiatan; ?></strong>
                                <div id="prosedur-kegiatan-<?php echo $row_kegiatan->id; ?>" class="hide">
                                    <hr>
                                    <label>Keluaran</label>
                                    <div class="form-control-static"><?php echo $row_kegiatan->keluaran; ?></div>
                                    <label>Keterangan</label>
                                    <div class="form-control-static"><?php echo $row_kegiatan->keterangan; ?></div>
                                    <label>Kelengkapan</label>
                                    <div class="form-control-static">
                                        <ul>
                                            <?php foreach($row_kegiatan->kelengkapan as $kelengkapan): ?>
                                                <li><?php echo $kelengkapan->kelengkapan; ?></li>
                                            <?php endforeach; ?>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="task-footer">
                                <div class="pull-left">
                                    <?php if($row_kegiatan->petugas): ?>
                                    <div>
                                        <span class="fa fa-user"></span> <?php echo $row_kegiatan->petugas->nama; ?>
                                    </div>
                                    <div>
                                        <span class="fa fa-clock-o"></span> <?php echo tanggal_format_indonesia($row_kegiatan->tracking->created_date, TRUE); ?>
                                    </div>
                                    <?php endif; ?>
                                </div>
                                <div class="pull-right">
                                    <a class="btn-detail-prosedur-kegiatan" data-id="<?php echo $row_kegiatan->id; ?>"><i class="fa fa-search"></i> Detail</a>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="clearfix"></div>
        <div class="pull-right">
            <?php if(!$analisis->is_cancel): ?>
                <form action="<?php echo base_url('permohonan/cancel_permohonan'); ?>" method="post" id="form-cancel-permohonan">
                    <input type="hidden" name="id" value="<?php echo $analisis->id; ?>">
                    <button class="btn btn-danger btn-xs"><i class="fa fa-times"></i> Cancel</button>
                </form>
            <?php else: ?>
                <form action="<?php echo base_url('permohonan/reset_permohonan'); ?>" method="post" id="form-reset-permohonan">
                    <input type="hidden" name="id" value="<?php echo $analisis->id; ?>">
                    <button class="btn btn-info btn-xs"><i class="fa fa-refresh"></i>Reset</button>
                </form>
            <?php endif; ?>
        </div>
    </div>
</div>
