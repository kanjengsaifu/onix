<h1>Silahkan Pilih Pemohon</h1>
<a href="<?php echo base_url('pemohon/daftar'); ?>" class="btn btn-primary">
    <i class="fa fa-plus"></i> Tambah Pemohon
</a>

<hr>

<div class="progress">
    <div class="progress-bar progress-bar-info" style="width: 25%;">
        Pilih Pemohon
    </div>
    <div class="progress-bar progress-bar-warning" style="width: 25%;">
        Form Permohonan
    </div>
    <div class="progress-bar progress-bar-warning" role="progressbar"  style="width: 25%;">
        Preview
    </div>
    <div class="progress-bar progress-bar-warning" role="progressbar" style="width: 25%;">
        Selesai
    </div>
</div>

<hr>

<table class="table table-data">
    <thead>
    <tr>
        <th>NO</th>
        <th>Tipe</th>
        <th>Nama</th>
        <th>Alamat</th>
        <th>Pilih</th>
    </tr>
    </thead>
    <tbody>
    <?php
    $no = 1;
    foreach($pemohon as $row):
    ?>
    <tr>
        <td><?php echo $no++; ?>.</td>
        <td><?php echo strtoupper($row->type_pemohon); ?></td>
        <td><?php echo $row->nama; ?></td>
        <td><?php echo $row->alamat; ?></td>
        <td><a href="<?php echo base_url('permohonan/set_pemohon/'.$row->id_pemohon); ?>" class="btn btn-success btn-xs">Pilih</a></td>
    </tr>
        <?php
    endforeach;
    ?>
    </tbody>
</table>