<?php echo validation_errors('<div class="alert alert-danger">', '</div>'); ?>
<h1>Daftar Pemohon baru</h1>
<form role="form" action="<?php echo base_url('pemohon/daftar'); ?>" method="post">
    <div class="form-group">
        <label for="id">Tipe Pemohon</label>
        <select name="type_pemohon" class="form-control">
            <?php foreach($type_pemohon as $type): ?>
                <option value="<?php echo $type->id; ?>"><?php echo $type->nama; ?></option>
            <?php endforeach; ?>
        </select>
    </div>
    <div class="form-group">
        <label for="nama">Nama Pemohon</label>
        <input type="text" class="form-control" id="nama" placeholder="Nama Pemohon" name="nama" value="<?php echo set_value('nama'); ?>">
    </div>
    <div class="form-group">
        <label for="nama">Nama di Sertifikat</label>
        <input type="text" class="form-control" id="nama_sertifikat" placeholder="Nama di Sertifikat" name="nama_sertifikat" value="<?php echo set_value('nama_sertifikat'); ?>">
    </div>
    <div class="form-group">
        <label for="nama">Alamat</label>
        <input type="text" class="form-control" id="alamat" placeholder="Alamat" name="alamat" value="<?php echo set_value('alamat'); ?>">
    </div>
    <div class="form-group">
        <label for="deskripsi">Deskripsi</label>
        <textarea class="form-control" id="deskripsi" placeholder="Deskripsi Pemohon" name="deskripsi"><?php echo set_value('deskripsi'); ?></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Simpan</button>
</form>