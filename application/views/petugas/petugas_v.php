<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active">Petugas</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-user-md"></span> Petugas</h2>
</div>
<!-- END PAGE TITLE -->

<div class="row">
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">Listing Petugas</h3>
                <ul class="panel-controls">
                    <li><a href="<?php echo base_url('petugas/add'); ?>" title="Tambah Petugas"><span class="fa fa-plus"></span></a></li>
                </ul>
            </div>
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>NIP</th>
                        <th>Nama</th>
                        <th>Komoditi</th>
                        <th>Username</th>
                        <th>Detail</th>
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
                            <td>
                                <a href="<?php echo base_url('petugas/detail/'.$row->id_petugas); ?>" class="btn btn-info">detail</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>


