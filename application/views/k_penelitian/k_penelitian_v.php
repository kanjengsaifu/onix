<div class="row">
    <div class="col-lg-6">
        <div class="input-group ">
            <span class="input-group-addon">cari data kelompok penyelidikan</span>
            <input type="text" class="form-control" id="search-box" placeholder="kelompok penyelidikan">
        </div>
    </div>
</div>
<div class="h3"></div>
<table id="default-table" class="table">
    <thead>
    <tr>
        <th>NO.</th>
        <th>ID KELOMPOK PENYELIDIKAN</th>
        <th>NAMA</th>
    <?php if($this->tinyauth->is_admin()): ?>
        <th></th>
    <?php endif; ?>
    </tr>
    </thead>
    <tbody>
    <?php
    $no = 1;
    foreach($kp as $row):
        ?>
    <tr>
        <td><?php echo $no++; ?>.</td>
        <td><?php echo strtoupper($row->id_kp); ?></td>
        <td><?php echo $row->nama; ?></td>
        <?php if($this->tinyauth->is_admin()): ?>
        <td>
            <a href="<?php echo base_url('k_penelitian/ubah/'.$row->id_kp); ?>" class="btn btn-warning btn-xs"><i class="glyphicon glyphicon-edit"></i> ubah</a>
        </td>
        <?php endif; ?>
    </tr>
        <?php
    endforeach;
    ?>
    </tbody>
</table>