<a href="<?php echo base_url('permohonan/reset'); ?>" class="btn btn-xs btn-danger pull-right"><i class="fa fa-refresh"></i> Ulang</a>
<h2>Daftar Permohonan <?php echo $lab->nama; ?></h2>

<?php dump($this->session->all_userdata()); ?>

<hr>

<!--<strong>Nomor Analisis</strong> --><?php //echo strtoupper($id_komoditi); ?><!-- / --><?php //echo $no_urut; ?><!-- / --><?php //echo strtoupper($lab['id_lab']); ?><!-- / --><?php //echo date('my'); ?>
<div class="clearfix"></div>

<div class="progress">
    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%;">
        Pilih Pemohon
    </div>
    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%;">
        Form Permohonan
    </div>
    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%;">
        Preview
    </div>
    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%;">
        Simpan
    </div>
</div>

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
                <label for="tanggal_masuk">Tanggal conto Diterima</label>
                <input type="text" name="tanggal_terima" id="tanggal_masuk" class="form-control" placeholder="xx-xx-xxxx Tanggal-Bulan-Tahun" value="<?php echo $this->session->userdata('permohonan')->tanggal_terima; ?>">
                <?php echo form_error('tanggal_terima', '<small class="text-danger">', '</small>'); ?>
            </div>
            <div class="form-group">
                <label for="contoh">Jenis Conto</label>
                <input type="text" name="jenis_contoh" id="contoh" class="form-control" placeholder="Jenis Conto yang dianalisis" value="<?php echo $this->session->userdata('permohonan')->jenis_contoh; ?>">
                <?php echo form_error('jenis_contoh', '<small class="text-danger">', '</small>'); ?>
            </div>
            <div class="form-group">
                <label for="jumlah">Jumlah Conto</label>
                <input type="text" name="jumlah_contoh" id="jumlah" class="form-control" placeholder="Jumlah Conto" value="<?php echo $this->session->userdata('permohonan')->jumlah_contoh; ?>" onkeyup="refresh_harga()">
                <?php echo form_error('jumlah_contoh', '<small class="text-danger">', '</small>'); ?>
            </div>
            <div class="form-group">
                <label for="contoh">Kode Conto</label>
                <input type="text" name="kode_conto" id="kode_contoh" class="form-control" placeholder="Kode variabel untuk conto" value="<?php echo $this->session->userdata('permohonan')->kode_conto; ?>">
                <?php echo form_error('kode_conto', '<small class="text-danger">', '</small>'); ?>
            </div>
            <div class="form-group">
                <label for="provinsi">Provinsi</label>
                <select name="provinsi" id="provinsi" class="form-control" onchange="kab(this.value)">
                    <option value="0">--Pilih Provinsi--</option>
                    <?php foreach($provinsi as $row): ?>
                        <option value="<?php echo $row->id_provinsi; ?>" <?php echo $row->id_provinsi == $this->session->userdata('permohonan')->provinsi ? 'selected="selected"' : ''; ?>><?php echo $row->nama; ?></option>
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
                <input type="checkbox" name="preparasi" value="1" <?php echo $this->session->userdata('permohonan')->preparasi ? ' checked="checked"' : ''; ?>>
                Preparasi
            </div>

            <h1 id="harga"></h1>
            <button type="submit" class="btn btn-primary">Simpan</button>

        </div>
        <div class="col-md-7">
            <h3>Jenis Parameter/Metoda</h3>
            <?php echo form_error('param[]', '<small class="text-danger">', '</small>'); ?>
            <?php $this->load->view('permohonan/'.$lab->id_lab); ?>
        </div>
    </div>
</form>
