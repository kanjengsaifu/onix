<a href="<?php echo base_url('permohonan/reset'); ?>" id="btn-reset-permohonan" class="btn btn-xs btn-danger pull-right" data-toggle="tooltip" data-placement="bottom" title="Ulangi pengisian permohonan"><i class="fa fa-refresh"></i> Ulang</a>
<a href="<?php echo base_url('permohonan/preview'); ?>" class="btn btn-xs btn-info pull-left" data-toggle="tooltip" data-placement="bottom" title="Lihat data permohonan yang diinputkan sebelumnya"><i class="fa fa-eye"></i> Preview</a>

<div class="clearfix"></div>

<h2>Daftar Permohonan <?php echo $lab->nama; ?></h2>
<hr>

<div class="clearfix"></div>

<div class="wizard">
    <ul class="steps_4 anchor">
        <li>
            <a class="done" href="#step-1">
                <span class="stepNumber">1</span>
                <span class="stepDesc">Pemohon<br /><small>Pilih Pemohon</small></span>
            </a>
        </li>
        <li >
            <a class="selected" href="#step-2">
                <span class="stepNumber">2</span>
                <span class="stepDesc">Form<br /><small>Data Permohonan</small></span>
            </a>
        </li>
        <li>
            <a href="#step-3">
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

<form action="<?php echo base_url('permohonan/daftar/'.$lab->id_lab); ?>" method="post" role="form" id="form_param">
    <input type="hidden" name="id_lab" value="<?php echo $lab->id_lab; ?>">
    <input type="hidden" name="id_komoditi" value="<?php echo $lab->id_komoditi; ?>">
    <input type="hidden" name="id_pemohon" value="<?php echo $pemohon->id_pemohon; ?>">
    <div class="row">
        <div class="col-md-5">
            <div class="form-group">
                <label for="nama">Pemohon <a href="<?php echo base_url('permohonan/pemohon'); ?>" class="btn btn-warning btn-xs">pilih pemohon</a> </label>
                <div class="form-control-static"><?php echo $pemohon->nama; ?> (<?php echo $pemohon->type_pemohon->nama; ?>)</div>
            </div>
            <div class="form-group">
                <label for="tanggal_masuk">Tanggal conto diterima</label>
                <input type="text" name="tanggal_terima" id="tanggal_masuk" class="form-control" placeholder="dd-mm-yyyy" value="<?php echo set_value('tanggal_terima'); ?>">
                <?php echo form_error('tanggal_terima', '<small class="text-danger">', '</small>'); ?>
            </div>
            <div class="form-group">
                <label for="contoh">Jenis Conto</label>
                <input type="text" name="jenis_contoh" id="contoh" class="form-control" placeholder="Jenis Conto yang dianalisis" value="<?php echo set_value('jenis_contoh'); ?>">
                <?php echo form_error('jenis_contoh', '<small class="text-danger">', '</small>'); ?>
            </div>
            <div class="form-group">
                <label for="jumlah">Jumlah Conto</label>
                <input type="text" name="jumlah_contoh" id="jumlah" class="form-control" placeholder="Jumlah Conto" value="<?php echo set_value('jumlah_contoh'); ?>" onkeyup="refresh_harga()">
                <?php echo form_error('jumlah_contoh', '<small class="text-danger">', '</small>'); ?>
            </div>
            <div class="form-group">
                <label for="contoh">Kode Conto</label>
                <input type="text" name="kode_conto" id="kode_contoh" class="form-control" placeholder="Kode variabel untuk conto" value="<?php echo set_value('kode_conto'); ?>">
                <?php echo form_error('kode_conto', '<small class="text-danger">', '</small>'); ?>
            </div>
            <div class="form-group">
                <label for="provinsi">Provinsi</label>
                <select name="provinsi" id="provinsi" class="form-control" onchange="kab(this.value)">
                    <option value="0" SELECTED="">--Pilih Provinsi--</option>
                    <?php foreach($provinsi as $row): ?>
                        <option value="<?php echo $row->id_provinsi; ?>" <?php echo set_select('lokasi', $row->id_provinsi); ?>><?php echo $row->nama; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-group">
                <label for="provinsi">Kabupaten</label>
                <select name="lokasi" id="lokasi" class="form-control">
                    <option value="">--Kota--</option>
                </select>
                <?php echo form_error('lokasi', '<small class="text-danger">', '</small>'); ?>
            </div>
            <div class="form-group">
                <input type="checkbox" name="preparasi" value="1" <?php echo set_checkbox('preparasi', '1'); ?>>
                Preparasi
            </div>

            <h1 id="harga"></h1>
            <button type="submit" class="btn btn-primary">Simpan</button>

        </div>
        <div class="col-md-7">
            <h1>Jenis Parameter / Type Analisis</h1>
            <hr>
            <?php echo form_error('param[]', '<small class="text-danger">', '</small>'); ?>
            <?php $this->load->view('permohonan/parameter/'.$lab->id_lab); ?>
        </div>
    </div>
</form>
