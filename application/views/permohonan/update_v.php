<div class="row">
    <div class="col-sm-3">
        <ul class="nav nav-pills nav-stacked">
            <li class="active">
                <a href="<?php echo base_url('sertifikat/cetak_sertifikat/'.$id_analisis)?>">Cetak <div class="glyphicon glyphicon-print pull-right"></div></a>
            </li>
            <li class="">
                <a class="text-warning" href="<?php echo base_url('permohonan/update/'.$id_analisis)?>">Edit <div class="glyphicon glyphicon-edit pull-right"></div></a>
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
            <li>
                <a class="">Harga <div class="pull-right"><strong><?php echo format_rupiah($analisis->biaya); ?></strong></div></a>
            </li>
        </ul>
    </div>
    <div class="col-sm-9 sertifikat">
        <form action="" method="post">
            <h3>Update permohonan</h3>
            <hr>
            <div class="row">
                <div class="form-group col-md-4">
                    <label>Pemohon</label>
                    <div class="form-control-static"><?php echo $pemohon->nama; ?></div>
                </div>
                <div class="form-group col-md-4">
                    <label>Tanggal conto diterima</label>
                    <input type="text" name="tanggal_terima" id="tanggal_masuk" class="form-control" value="<?php echo $analisis->tanggal_terima; ?>">
                    <?php echo form_error('tanggal_terima', '<small class="text-danger">', '</small>'); ?>
                </div>
                <div class="form-group col-md-4">
                    <label>Alamat</label>
                    <textarea name="alamat" class="form-control"><?php echo $pemohon->alamat; ?></textarea>
                    <?php echo form_error('alamat', '<small class="text-danger">', '</small>'); ?>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-4">
                    <label>Jenis Conto</label>
                    <input type="text" name="jenis_conto" class="form-control" value="<?php echo $analisis->jenis_conto; ?>">
                    <?php echo form_error('jenis_conto', '<small class="text-danger">', '</small>'); ?>
                </div>
                <div class="form-group col-md-4">
                    <label>Kode Conto</label>
                    <input type="text" name="kode_conto" class="form-control" value="<?php echo $analisis->kode_conto; ?>">
                    <?php echo form_error('kode_conto', '<small class="text-danger">', '</small>'); ?>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-4">
                    <label for="provinsi">Provinsi</label>
                    <select name="provinsi" id="provinsi" class="form-control" onchange="kab(this.value)">
                        <option value="0">--Pilih Provinsi--</option>
                        <?php foreach($provinsi as $row): ?>
                            <option value="<?php echo $row->id_provinsi; ?>" <?php echo $lokasi->provinsi->id_provinsi  == $row->id_provinsi ? 'selected="true"' : ''; ?>><?php echo $row->nama; ?></option>
                        <?php endforeach; ?>
                    </select>
                    <?php echo form_error('provinsi', '<small class="text-danger">', '</small>'); ?>
                </div>
                <div class="form-group col-md-4">
                    <label>Kabupaten</label>
                    <label for="lokasi">Kabupaten</label>
                    <select name="lokasi" id="lokasi" class="form-control">
                        <option value="">--Kabupaten--</option>
                        <?php foreach($kabupaten as $row1): ?>
                            <option value="<?php echo $row1->id_kabupaten; ?>" <?php echo $analisis->lokasi  == $row1->id_kabupaten ? 'selected="true"' : ''; ?>><?php echo $row1->nama; ?></option>
                        <?php endforeach; ?>
                    </select>
                    <?php echo form_error('lokasi', '<small class="text-danger">', '</small>'); ?>
                    <sub>*Lokasi: <br><?php echo $analisis->nama_lokasi; ?></sub>
                </div>

            </div>
            <input type="hidden" name="id" value="<?php echo $analisis->id; ?>">
            <button class="btn btn-warning"><i class="glyphicon glyphicon-edit"></i> Update</button>
        </form>
    </div>
</div>
