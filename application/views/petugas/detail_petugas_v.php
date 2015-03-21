<?php echo validation_errors('<div class="alert alert-danger">', '</div>'); ?>
<h1>Ubah Data Petugas Analisis</h1>
<form role="form" action="<?php echo base_url('petugas/detail/'.$petugas->id_petugas); ?>" method="post">
    <input type="hidden" value="p" name="type_pemohon">
    <div class="form-group">
        <label for="nip">NIP</label>
        <input type="text" class="form-control" id="nip" disabled placeholder="Nomor Induk Pegawai" name="nip" value="<?php echo $petugas->nip; ?>">
    </div>
    <div class="form-group">
        <label for="nama">Nama</label>
        <input type="text" class="form-control" id="nama" placeholder="Nama Petugas" name="nama" value="<?php echo $petugas->nama; ?>">
    </div>
    <div class="form-group">
        <label for="telepon">Telepon</label>
        <input type="text" class="form-control" id="telepon" placeholder="Telepon" name="telepon" value="<?php echo $petugas->telepon; ?>">
    </div>
    <div class="form-group">
        <label for="email">Email</label>
        <input type="text" class="form-control" id="email" placeholder="Email" name="email" value="<?php echo $petugas->email; ?>">
    </div>
    <div class="form-group">
        <label for="komoditi">Komoditi</label>
        <select name="komoditi" id="komoditi" class="form-control">
            <?php foreach($komoditi as $row): ?>
                <option value="<?php echo $row->id_komoditi; ?>" <?php echo $petugas->id_komoditi == $row->id_komoditi ? 'SELECTED' : ''; ?>><?php echo strtoupper($row->nama); ?></option>
            <?php endforeach; ?>
        </select>
    </div>
    <input type="hidden" name="id_petugas" value="<?php echo $petugas->id_petugas; ?>">
    <button type="submit" class="btn btn-primary">Simpan</button>
</form>

<button class="btn btn-danger btn-xs pull-right" id="btn-hapus-petugas" data-id="<?php echo $petugas->id_petugas; ?>" data-name="<?php echo $petugas->nama; ?>"><i class="fa fa-times"></i> hapus</button>
