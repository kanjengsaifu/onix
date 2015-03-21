<?php echo validation_errors(); ?>
<form action="<?php echo base_url('fisika/tambah_conto/'.$type_analisis->id_type.'/'.$no_analisis); ?>" method="post" class="form-center">
    <div class="row">
        <div class="col-sm-12">
            <div class="alert alert-success"><div class="info-data"><?php echo $type_analisis->nama; ?></div> type analisis</div>
            <input type="hidden" value="<?php echo $type_analisis->id_type; ?>" id="id_type_analisis">
            <input type="hidden" value="<?php echo $no_analisis; ?>" id="no_analisis">
        </div>
        <div class="col-sm-12">
            <div class="alert alert-info"><div class="info-data"><div class="glyphicon glyphicon-plus"></div> Tambah Conto</div></div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label" for="nama_batuan">Nama Butiran</label>
        <input type="text" name="nama_batuan" id="nama_batuan" class="form-control">
    </div>
    <div class="form-group">
        <label class="control-label" for="berat">Berat</label>
        <div class="input-group">
            <input type="text" name="berat" id="berat" class="form-control form-control-static">
            <div class="input-group-addon">gr</div>
        </div>
    </div>
        <input type="hidden" name="deskripsi" id="deskripsi">
    <button type="submit" class="btn btn-primary">Simpan</button>
</form>
