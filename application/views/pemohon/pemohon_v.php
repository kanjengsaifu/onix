<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active">Petugas</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-user"></span> Pemohon</h2>
</div>
<!-- END PAGE TITLE -->

<div class="row">
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">Listing Pemohon</h3>
                <ul class="panel-controls">
                    <li><a href="<?php echo base_url('pemohon/add'); ?>" title="Tambah Pemohon"><span class="fa fa-plus"></span></a></li>
                </ul>
            </div>
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>NO</th>
                        <th>Tipe</th>
                        <th>Nama</th>
                        <th>Alamat</th>
                        <?php if($this->tinyauth->is_admin()): ?>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Detail</th>
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
                                    <a href="<?php echo base_url('pemohon/detail/'.$row->id_pemohon); ?>" class="btn btn-info">Detail</a>
                                </td>
                            <?php endif; ?>
                        </tr>
                    <?php
                    endforeach;
                    ?>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>


