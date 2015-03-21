<h1>Ubah Data Kelompok Penyelidikan</h1>
    <?php echo validation_errors(); ?>
<form role="form" action="<?php echo base_url('k_penelitian/ubah'); ?>" method="post">
    <input type="hidden" name="type_pemohon" value="k">
    <div class="form-group">
        <label for="id-kp">ID Kelompok Penyelidikan</label>
        <input type="text" class="form-control" name="id_kp" id="id-kp" placeholder="ID Kelompok Penelitian" value="<?php echo $id_kp ?>">
        <input type="hidden" class="form-control" name="id_kp_lama" value="<?php echo $id_kp ?>">
        <input type="hidden" class="form-control" name="id_pemohon"  value="<?php echo $id_pemohon ?>">
    </div>
    <div class="form-group">
        <label for="nama">ID Kelompok Penyelidikan</label>
        <div class="input-group">
            <span class="input-group-addon">Kp.</span>
            <input type="text" class="form-inline form-control" name="nama" id="nama" placeholder="Nama Kelompok Penelitian" value="<?php echo $nama; ?>">
        </div>
    </div>
    <button type="submit" class="btn btn-primary">Simpan</button>
</form>