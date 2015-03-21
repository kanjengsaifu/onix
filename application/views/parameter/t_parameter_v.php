<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 11/23/13
 * Time: 10:21 AM
 */

?>
<a href="<?php echo base_url('type_analisis/detail/'.$type_analisis->id_type_analisis); ?>" class="btn btn-primary"><i class="glyphicon glyphicon-chevron-left"></i> Kembali</a>
<br>
<br>
<?php echo validation_errors('<div class="alert alert-danger">', '</div>'); ?>
<h1>Tambah Parameter untuk Type Analisis <?php echo $type_analisis->nama; ?></h1>
<hr>
<form method="post">
    <div class="form-group">
        <label>ID Parameter</label>
        <input type="text" name="id_parameter" value="<?php echo set_value('id_parameter'); ?>" class="form-control">
    </div>
    <div class="form-group">
        <label>Nama Parameter</label>
        <input type="text" name="nama" value="<?php echo set_value('nama'); ?>" class="form-control">
    </div>
    <div class="form-group">
        <label for="harga">Harga</label>
        <div class="input-group">
            <span class="input-group-addon">Rp.</span>
            <input type="text" name="harga" value="<?php echo set_value('harga'); ?>" class="form-control" id="harga">
        </div>
    </div>
    <div class="form-group">
        <label>Satuan</label>
        <input type="text" name="satuan" value="<?php echo set_value('satuan'); ?>" class="form-control">
    </div>
    <div class="form-group">
        <label>Deskripsi</label>
        <input type="text" name="deskripsi" value="<?php echo set_value('deskripsi'); ?>" class="form-control">
    </div>
    <input type="hidden" name="id_type" value="<?php echo $type_analisis->id_type; ?>">
    <input type="hidden" name="id_type_analisis" value="<?php echo $type_analisis->id_type_analisis; ?>">
    <button class="btn btn-primary">Simpan</button>
</form>