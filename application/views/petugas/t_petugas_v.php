<?php echo validation_errors('<div class="alert alert-danger">', '</div>'); ?>
<h1>Tambah Data Petugas Analisis</h1>
<form role="form" action="<?php echo base_url('petugas/daftar'); ?>" method="post">
    <input type="hidden" value="p" name="type_pemohon">
    <div class="form-group">
        <label for="id">NIP</label>
        <input type="text" class="form-control" id="id" placeholder="Nomor Induk Pegawai" name="nip" value="<?php echo set_value('nip'); ?>">
    </div>
    <div class="form-group">
        <label for="nama">Nama</label>
        <input type="text" class="form-control" id="nama" placeholder="Nama Petugas" name="nama" value="<?php echo set_value('nama'); ?>">
    </div>
    <div class="form-group">
        <label for="telepon">Telepon</label>
        <input type="text" class="form-control" id="telepon" placeholder="Telepon" name="telepon" value="<?php echo set_value('telepon'); ?>">
    </div>
    <div class="form-group">
        <label for="email">Email</label>
        <input type="text" class="form-control" id="email" placeholder="Email" name="email" value="<?php echo set_value('email'); ?>">
    </div>
    <div class="form-group">
        <label for="komoditi">Komoditi</label>
        <select name="komoditi" id="komoditi" class="form-control">
            <?php foreach($komoditi as $row): ?>
                <option value="<?php echo $row->id_komoditi; ?>" <?php echo set_select('komoditi',$row->id_komoditi); ?>><?php echo strtoupper($row->nama); ?></option>
            <?php endforeach; ?>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Simpan</button>
</form>