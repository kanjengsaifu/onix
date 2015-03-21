<h1>Listing Petugas Analisis</h1>
<a href="<?php echo base_url('petugas/daftar'); ?>" class="btn btn-primary">
    <i class="fa fa-plus"></i> Tambah Petugas
</a>

<hr>

<table class="table table-data">
    <thead>
    <tr>
        <th>NO.</th>
        <th>NIP</th>
        <th>NAMA</th>
        <th>KOMODITI</th>
        <th>USERNAME</th>
        <?php if($this->tinyauth->is_admin()): ?>
        <th>PASSWORD</th>
        <th></th>
        <?php endif; ?>
    </tr>
    </thead>
    <tbody>
    <?php $no = 1; foreach($petugas as $row): ?>
    <tr id="<?php echo $row->id_petugas; ?>">
        <td><?php echo $no++; ?>.</td>
        <td><?php echo $row->nip; ?></td>
        <td><?php echo $row->nama; ?></td>
        <td><?php echo nama_komoditi($row->id_komoditi); ?></td>
        <td><?php echo $row->username; ?></td>
        <?php if($this->tinyauth->is_admin()): ?>
            <td><?php echo $row->pass_awal; ?></td>
            <td>
                <a href="<?php echo base_url('petugas/detail/'.$row->id_petugas); ?>" class="btn btn-info btn-xs">detail</a>
            </td>
        <?php endif; ?>
    </tr>
        <?php endforeach; ?>
    </tbody>
</table>

