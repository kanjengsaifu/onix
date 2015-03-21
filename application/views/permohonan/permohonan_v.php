<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="active">Permohonan</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-list"></span> Permohonan</h2>
</div>
<!-- END PAGE TITLE -->

<div class="row">
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">Listing Permohonan</h3>
                <ul class="panel-controls">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-plus"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<?php echo base_url('permohonan/daftar/kml'); ?>">Kimia Logam</a></li>
                            <li><a href="<?php echo base_url('permohonan/daftar/knl'); ?>">Kimia Bukan Logam</a></li>
                            <li><a href="<?php echo base_url('permohonan/daftar/kpb'); ?>">Panas Bumi</a></li>
                            <li><a href="<?php echo base_url('permohonan/daftar/kbb'); ?>">Kimia Batubara & Material Organik</a></li>
                            <li><a href="<?php echo base_url('permohonan/daftar/kgb'); ?>">Kimia Gambut</a></li>
                            <li><a href="<?php echo base_url('permohonan/daftar/fmb'); ?>">Fisika Mineral & Batubara</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Nomor Analisis</th>
                        <th>Lab</th>
                        <th>Jenis Conto</th>
                        <th>Pemohon</th>
                        <th>Tanggal Daftar</th>
                        <th>Status</th>
                        <th>Detail</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no = 1; foreach ($permohonan as $analisis): ?>
                        <tr>
                            <td><?php echo $no++; ?>. </td>
                            <td><?php echo $analisis->nomor_analisis; ?> - <?php echo substr($analisis->nomor_analisis,6,5) + $analisis->jumlah_conto - 1; ?></td>
                            <td><?php echo $analisis->lab; ?></td>
                            <td><?php echo $analisis->jenis_conto; ?></td>
                            <td><?php echo $analisis->nama_pemohon; ?></td>
                            <td><?php echo tanggal_format_indonesia($analisis->tanggal_terima); ?></td>
                            <td><?php echo status_label($analisis->is_selesai); ?></td>
                            <td><a href="<?php echo base_url('permohonan/detail/'.$analisis->id); ?>" class="btn btn-info btn-sm">Detail</a> </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>