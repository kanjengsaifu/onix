<h1>Listing Pemohon</h1>
<a href="<?php echo base_url('pemohon/daftar'); ?>" class="btn btn-primary">
    <i class="fa fa-plus"></i> Tambah Pemohon
</a>

<hr>

<table class="table table-data">
    <thead>
    <tr>
        <th>NO</th>
        <th>Tipe</th>
        <th>Nama</th>
        <th>Alamat</th>
    <?php if($this->tinyauth->is_admin()): ?>
        <th>Username</th>
        <th>Password</th>
        <th></th>
    <?php endif; ?>
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
        <?php if($this->tinyauth->is_admin()): ?>
            <td><?php echo $row->username; ?></td>
            <td><?php echo $row->pass_awal; ?></td>
            <td>
                <a href="<?php echo base_url('pemohon/detail/'.$row->id_pemohon); ?>" class="btn btn-info btn-xs">Detail</a>
            </td>
        <?php endif; ?>
    </tr>
        <?php
    endforeach;
    ?>
    </tbody>
</table>