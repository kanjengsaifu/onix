<div class="row">
    <div class="col-sm-3">
        <ul class="nav nav-pills nav-stacked">
                <li class="active">
                    <a href="<?php echo base_url('sertifikat/cetak_sertifikat/'.$id_analisis)?>">Cetak <div class="glyphicon glyphicon-print pull-right"></div></a>
                </li>
                <li class="">
                    <a class="text-warning" href="<?php echo base_url('permohonan/update/'.$id_analisis)?>">Edit <div class="glyphicon glyphicon-edit pull-right"></div></a>
                </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Detail Conto <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <?php
                    foreach($conto as $data):
                    ?>
                        <li><a href="<?php echo base_url('permohonan/detail_conto/'.$id_analisis.'/'.$data->id); ?>"><?php echo no_conto($data->id_conto); ?></a></li>
                    <?php endforeach; ?>
                </ul>
            </li>
            <li class="dropdown-header">
                detail analisis
            </li>
            <li>
                <a class="">Status <div class="pull-right"><?php echo status_label($analisis->is_selesai); ?></div></a>
            </li>
            <li>
                <a class="">Pemeriksa <div class="pull-right"><strong>LAB. PSDG</strong></div></a>
            </li>
            <?php if(substr($analisis->id_pemohon, 0, 1 == 'p')): ?>
            <li>
                <a class="">Harga <div class="pull-right"><strong><?php echo $harga; ?></strong></div></a>
            </li>
            <?php endif; ?>
        </ul>

    </div>
    <div class="col-sm-9 sertifikat">
        <div class="row">
            <div class="col-sm-12 text-center">
                <h3><strong>SERTIFIKAT ANALISIS</strong></h3>
                <i style="margin-top: -30px">(CERTIFICATE OF ANALYSIS)</i>
            </div>
        </div>
        <div class="h3"></div>
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
                <strong>Jenis Conto</strong><br>
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
            </div>
            <div class="col-lg-1">:</div>
            <div class="col-lg-6">
                <strong><?php echo $analisis->jumlah_conto; ?> (<?php echo terbilang($analisis->jumlah_conto); ?>)</strong>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5">
                <strong>Asal Conto</strong>
            </div>
            <div class="col-lg-1">:</div>
            <div class="col-lg-6">
                <strong><?php echo $analisis->nama_lokasi; ?></strong>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5">
                <strong>Nomor Laboratorium</strong>
            </div>
            <div class="col-lg-1">:</div>
            <div class="col-lg-6">
                <strong><?php echo $analisis->nomor_analisis; ?></strong>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5">
                <strong>Tanggal Conto Diterima</strong>
            </div>
            <div class="col-lg-1">:</div>
            <div class="col-lg-6">
                <strong><?php echo tanggal_format_indonesia($analisis->tanggal_terima); ?></strong>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-5">
                <strong>Tanggal Conto Dianalisis</strong>
            </div>
            <div class="col-lg-1">:</div>
            <div class="col-lg-6">
                <strong><?php echo tanggal_format_indonesia($analisis->tanggal_daftar); ?></strong>
            </div>
        </div>
    </div>
</div>
