<h1>Daftar Kelompok Penyelidikan</h1>
    <?php echo validation_errors(); ?>
<form role="form" action="<?php echo base_url('pemohon/daftar/k'); ?>" method="post">
    <input type="hidden" name="type_pemohon" value="k">
    <div class="form-group">
        <label for="id-kp">ID Kelompok Penyelidikan</label>
        <input type="text" class="form-control" name="id" id="id-kp" placeholder="ID Kelompok Penyelidikan" value="<?php echo set_value('id'); ?>">
    </div>
    <div class="form-group">
        <label for="nama">ID Kelompok Penyelidikan</label>
        <div class="input-group">
            <span class="input-group-addon">Kp.</span>
            <input type="text" class="form-inline form-control" name="nama" id="nama" placeholder="Nama Kelompok Penyelidikan" value="<?php echo set_value('nama'); ?>">
        </div>
    </div>
    <button type="submit" class="btn btn-primary">Simpan</button>
</form>