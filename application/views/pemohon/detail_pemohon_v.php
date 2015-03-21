<?php echo validation_errors('<div class="alert alert-danger">', '</div>'); ?>
<h1>Pemohon <small><?php echo $pemohon->nama; ?></small></h1>
<div class="row">
    <div class="col-sm-8">
        <h3>Sertifikat Analisis</h3>
        <table class="table table-data">
            <thead>
            <tr>
                <th>Nomor Analisis</th>
                <th>Jenis Conto</th>
                <th>Jumlah Conto</th>
                <th>Tanggal Terima</th>
                <th>Tanggal Daftar</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach($hasil_analisis as $row): ?>
                <tr>
                    <td><a href="<?php echo base_url('permohonan/detail/'. $row->id_analisis); ?>"><?php echo $row->nomor_analisis; ?></a></td>
                    <td><?php echo $row->jenis_contoh; ?></td>
                    <td><?php echo $row->jumlah_contoh; ?></td>
                    <td><?php echo tanggal_format_indonesia($row->tanggal_terima); ?></td>
                    <td><?php echo tanggal_format_indonesia($row->tanggal_daftar); ?></td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <div class="col-sm-4">
        <h3>Update Data Pemohon</h3>
        <form role="form" action="<?php echo base_url('pemohon/detail/'.$pemohon->id_pemohon); ?>" method="post">
            <div class="form-group">
                <label for="id">Type Pemohon</label>
                <select name="type_pemohon" class="form-control">
                    <?php foreach($type_pemohon as $type): ?>
                        <option value="<?php echo $type->id; ?>" <?php echo $pemohon->id_type_pemohon == $type->id ? 'SELECTED' : ''; ?>><?php echo $type->nama; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-group">
                <label for="nama">Nama Pemohon</label>
                <input type="text" class="form-control" id="nama" placeholder="Nama Pemohon" name="nama" value="<?php echo $pemohon->nama; ?>">
            </div>
            <div class="form-group">
                <label for="nama">Nama di Sertifikat</label>
                <input type="text" class="form-control" id="nama_sertifikat" placeholder="Nama di Sertifikat" name="nama_sertifikat" value="<?php echo $pemohon->nama_sertifikat; ?>">
            </div>
            <div class="form-group">
                <label for="nama">Alamat</label>
                <input type="text" class="form-control" id="alamat" placeholder="Alamat" name="alamat" value="<?php echo $pemohon->alamat; ?>">
            </div>
            <div class="form-group">
                <label for="deskripsi">Deskripsi</label>
                <textarea class="form-control" id="deskripsi" placeholder="Deskripsi Pemohon" name="deskripsi"><?php echo $pemohon->deskripsi; ?></textarea>
            </div>
            <input type="hidden" name="id" value="<?php echo $pemohon->id_pemohon; ?>">
            <a href="<?php echo base_url('pemohon'); ?>" class="btn btn-danger">Cancel</a>
            <button type="submit" class="btn btn-warning">Ubah</button>
        </form>
    </div>
</div>