<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="#">Permohonan</a></li>
    <li class="active">Tugas Analisis <?php echo $lab->nama; ?></li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-arrow-circle-o-left" id="btn-back"></span> Preview</h2>
</div>
<!-- END PAGE TITLE -->

<div class="row">
    <div class="col-md-12">
        <div class="wizard">
            <ul class="steps_4 anchor">
                <li>
                    <a class="done" href="#step-1">
                        <span class="stepNumber">1</span>
                        <span class="stepDesc">Pemohon<br /><small>Pilih Pemohon</small></span>
                    </a>
                </li>
                <li>
                    <a class="done" href="#step-2">
                        <span class="stepNumber">2</span>
                        <span class="stepDesc">Form<br /><small>Data Permohonan</small></span>
                    </a>
                </li>
                <li>
                    <a class="selected" href="#step-3">
                        <span class="stepNumber">3</span>
                        <span class="stepDesc">Preview<br /><small>Pre-edit</small></span>
                    </a>
                </li>
                <li>
                    <a href="#step-4">
                        <span class="stepNumber">4</span>
                        <span class="stepDesc">Simpan<br /><small>Selesai</small></span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="line-height-30">&nbsp;</div>

        <div class="row">
            <div class="col-md-5">
                <div class="panel panel-info">
                    <div class="panel-body list-group">
                        <div class="list-group-item">
                            <label for="nama">Nomor Analisis</label>
                            <div class="pull-right"><?php echo $nomor_analisis; ?></div>
                        </div>
                        <div class="list-group-item">
                            <label for="nama">Pemohon</label>
                            <div class="pull-right"><?php echo $pemohon->nama; ?></div>
                        </div>
                        <div class="list-group-item">
                            <label for="nama">Kategori Pemohon</label>
                            <div class="pull-right"><?php echo $pemohon->type_pemohon->nama; ?></div>
                        </div>
                        <div class="list-group-item">
                            <label for="provinsi">Lokasi</label>
                            <div class="pull-right"><?php echo $permohonan->nama_lokasi; ?></div>
                        </div>
                        <div class="list-group-item">
                            <label for="tanggal_masuk">Tanggal Conto Diterima</label>
                            <div class="pull-right"><?php echo tanggal_format_indonesia($permohonan->tanggal_terima); ?></div>
                        </div>
                        <div class="list-group-item">
                            <label for="tanggal_masuk">Tanggal Daftar</label>
                            <div class="pull-right"><?php echo tanggal_format_indonesia(now()); ?></div>
                        </div>
                        <div class="list-group-item">
                            <label for="contoh">Jenis Conto</label>
                            <div class="pull-right"><?php echo $permohonan->jenis_conto; ?></div>
                        </div>
                        <div class="list-group-item">
                            <label for="jumlah">Jumlah Conto</label>
                            <div class="pull-right">
                                <?php echo $permohonan->jumlah_conto; ?>
                                <input type="hidden" value="<?php echo $is_fisika ? 1 : $permohonan->jumlah_conto; ?>" id="jumlah_conto">
                            </div>
                        </div>
                        <div class="list-group-item">
                            <div class="form-control-static"><i class="fa fa-<?php echo $permohonan->preparasi ? 'check' : 'times'; ?>"></i> Preparasi</div>
                        </div>
                        <div class="list-group-item">
                            <label for="tanggal_masuk">Estimasi Waktu Selesai</label>
                            <div class="pull-right"><?php echo tanggal_format_indonesia($estimasi_date); ?></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-md-1">
                                <strong>#</strong>
                            </div>
                            <div class="col-md-5">
                                <strong>Parameter</strong>
                            </div>
                            <div class="col-md-6">
                                <strong>Harga</strong>
                            </div>
                        </div>
                    </div>
                    <?php
                    // initialize
                    $total = 0;

                    $no = 1;
                    foreach($parameter as $key => $row):
                        $data = [
                            'no'        => $no++,
                            'key'       => $key,
                            'row'       => $row
                        ];

                        if($is_fisika)
                        {
                            $this->load->view('permohonan/include/cart_fisika', $data);
                        }
                        else
                        {
                            $this->load->view('permohonan/include/cart_kimia', $data);
                        }

                        $total += $row['harga_after'];
                    endforeach;

                    ?>

                    <div class="panel-body list-group">
                        <div class="list-group-item">
                            <label>Jumlah Parameter</label>
                            <div class="pull-right"><?php echo count($parameter); ?></div>
                        </div>
                        <?php if(!$is_fisika): ?>
                        <div class="list-group-item">
                            <label>Total Harga Perconto</label>
                            <h3 class="pull-right">
                                Rp. <span id="total-harga-perconto"><?php echo $total; ?></span>
                            </h3>
                        </div>
                        <?php endif; ?>
                        <div class="list-group-item">
                            <label>Total Biaya</label>
                            <h1 class="pull-right" >
                                Rp. <span id="total-biaya"><?php echo $is_fisika ? $total : $total * $permohonan->jumlah_conto; ?></span>
                            </h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12">
                <form action="<?php echo base_url('permohonan/insert'); ?>" method="post" id="form-insert-permohonan">
                    <button class="btn btn-success pull-right"><i class="fa fa-check-circle"></i> Selesai</button>
                </form>
                <a href="<?php echo base_url('permohonan/reset'); ?>" id="btn-reset-permohonan" class="btn btn-danger pull-right " data-toggle="tooltip" data-placement="bottom" title="Ulangi pengisian permohonan"><i class="fa fa-refresh"></i> Ulang</a>
            </div>
        </div>

    </div>
</div>
