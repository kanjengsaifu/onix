<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('pemohon'); ?>">Pemohon</a></li>
    <li class="active"><?php echo $pemohon->nama; ?></li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-users"></span> Pemohon</h2>
</div>
<!-- END PAGE TITLE -->

<!-- WIDGET -->
<div class="row">
    <div class="col-md-3">
        <div class="widget widget-default widget-item-icon">
            <div class="widget-item-left">
                <i class="fa fa-check"></i>
            </div>
            <div class="widget-data">
                <div class="widget-int num-count"><?php echo 1; ?></div>
                <div class="widget-title">Analisis</div>
                <div class="widget-subtitle">Selesai</div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="widget widget-default widget-item-icon">
            <div class="widget-item-left">
                <i class="fa fa-refresh"></i>
            </div>
            <div class="widget-data">
                <div class="widget-int num-count"><?php echo 12; ?></div>
                <div class="widget-title">Analisis</div>
                <div class="widget-subtitle">Dalam Proses</div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
    </div>
    <div class="col-md-3">
    </div>
</div>
<!-- END WIDGET -->


<div class="row">
    <div class="col-md-6">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Sertifikat Analisis</h3>
            </div>
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>Nomor Analisis</th>
                        <th>Tanggal Terima</th>
                        <th>Tanggal Daftar</th>
                        <th>Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach($hasil_analisis as $row): ?>
                        <tr>
                            <td><a href="<?php echo base_url('permohonan/detail/'. $row->id); ?>"><?php echo $row->nomor_analisis; ?></a></td>
                            <td><?php echo tanggal_format_indonesia($row->tanggal_terima); ?></td>
                            <td><?php echo tanggal_format_indonesia($row->tanggal_daftar); ?></td>
                            <td><?php echo status_label($row->is_selesai); ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <form role="form" action="<?php echo base_url('pemohon/detail/'.$pemohon->id_pemohon); ?>" method="post">
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h3 class="panel-title">Update Pemohon</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="id">Type Pemohon</label>
                        <select name="type_pemohon" class="form-control select">
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
                </div>
                <div class="panel-footer">
                    <input type="hidden" name="id" value="<?php echo $pemohon->id_pemohon; ?>">
                    <a href="<?php echo base_url('pemohon'); ?>" class="btn btn-danger">Cancel</a>
                    <button type="submit" class="btn btn-warning pull-right">Update</button>
                </div>
            </div>
        </form>
    </div>
</div>


