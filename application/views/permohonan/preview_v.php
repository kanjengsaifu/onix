<a href="<?php echo base_url('permohonan/reset'); ?>" id="btn-reset-permohonan" class="btn btn-xs btn-danger pull-right " data-toggle="tooltip" data-placement="bottom" title="Ulangi pengisian permohonan"><i class="fa fa-refresh"></i> Ulang</a>
<a href="#" id="btn-back" class="btn btn-xs btn-primary pull-left"><i class="fa fa-chevron-left"></i> Kembali</a>

<div class="clearfix"></div>

<h2>Preview Permohonan Laboratorium <?php echo $lab->nama; ?></h2>
<hr>

<div class="clearfix"></div>

<div class="progress">
    <div class="progress-bar progress-bar-success" style="width: 25%;">
        Pilih Pemohon
    </div>
    <div class="progress-bar progress-bar-success" style="width: 25%;">
        Form Permohonan
    </div>
    <div class="progress-bar progress-bar-info" role="progressbar"  style="width: 25%;">
        Preview
    </div>
    <div class="progress-bar progress-bar-warning" role="progressbar" style="width: 25%;">
        Selesai
    </div>
</div>

<hr>

<div id="form_param">
    <div class="row">
        <div class="col-md-5">
            <div class="list-group">
                <div class="list-group-item list-group-item-warning">
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
                    <div class="row">
                        <div class="col-xs-6">
                            <label for="tanggal_masuk">Tanggal conto Diterima</label>
                            <div class="form-control-static"><?php echo tanggal_format_indonesia($permohonan->tanggal_terima); ?></div>
                        </div>
                        <div class="col-xs-6">
                            <label for="tanggal_masuk">Tanggal Daftar</label>
                            <div class="form-control-static"><?php echo tanggal_format_indonesia(now()); ?></div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <label for="tanggal_masuk">Estimasi Waktu Selesai</label>
                    <div class="pull-right">5 Hari (6 Agustus 2015)</div>
                </div>
                <div class="list-group-item">
                    <div class="row">
                        <div class="col-xs-6">
                            <label for="contoh">Jenis Conto</label>
                            <div class="form-control-static"><?php echo $permohonan->jenis_conto; ?></div>
                        </div>
                        <div class="col-xs-6">
                            <label for="jumlah">Jumlah Conto</label>
                            <div class="form-control-static"><?php echo $permohonan->jumlah_conto; ?></div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item">
                    <label for="contoh">Kode Conto</label>
                    <div class="pull-right"><?php echo $permohonan->kode_conto; ?><br><sup>Example. <?php echo $permohonan->kode_conto.'-01'; ?></sup></div>
                </div>
                <div class="list-group-item">
                    <div class="form-control-static"><i class="fa fa-<?php echo $permohonan->preparasi ? 'check' : 'times'; ?>"></i> Preparasi</div>
                </div>
            </div>
        </div>
        <div class="col-md-7">
            <table class="table">
                <thead>
                <tr>
                    <th>Parameter</th>
                    <th>Harga</th>
                    <th>Keterangan</th>
                </tr>
                </thead>
                <tbody>
                <?php
                 // initialize
                    $total = 0;
                ?>
                <?php foreach($parameter as $key => $row): ?>
                    <tr>
                        <td><?php echo $row['nama']; ?></td>
                        <td>
                            <?php
                                $total += $row['harga_after'];
                            ?>
                            <div class="input-group">
                                <span class="input-group-addon">Rp.</span>
                                <input type="text" class="form-control" id="harga_parameter_<?php echo $row['id_parameter']; ?>" name="harga[]" value="<?php echo $row['harga_after']; ?>">
                                <span class="input-group-btn">
                                    <button class="btn btn-warning btn-update-harga-parameter" data-id="<?php echo $row['id_parameter']; ?>" data-rowid="<?php echo $key; ?>"><i class="fa fa-edit"></i></button>
                                </span>
                            </div>
                            <button class="btn btn-success btn-link btn-xs btn-reset-harga-parameter" data-id="<?php echo $row['id_parameter']; ?>" data-rowid="<?php echo $key; ?>"><i class="fa fa-refresh"></i> reset harga <?php echo format_rupiah($row['harga']); ?></button>
                        </td>
                        <td>
                            <?php
                                // metoda
                                echo !empty($row['metoda']) ? $row['metoda']['nama'] : '';
                                // basis
                                echo !empty($row['basis']) ? $row['basis'] : '';
                            ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
                <tfoot>
                <tr>
                    <th >Jumlah Parameter</th>
                    <td colspan="2"><?php echo count($parameter); ?></td>
                </tr>
                <tr>
                    <th>Total Harga</th>
                    <td colspan="2" id="total-harga"><?php echo format_rupiah($total); ?></td>
                </tr>
                </tfoot>
            </table>

            <form action="<?php echo base_url('permohonan/insert'); ?>" method="post" id="form-insert-permohonan">
                <button class="btn btn-success pull-right"><i class="fa fa-check"></i> Selesai</button>
            </form>
        </div>
    </div>
</div>
