<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li class="<?php echo base_url('permohonan'); ?>">Permohonan</li>
    <li class="active">Pencarian</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-search"></span> Permohonan</h2>
</div>
<!-- END PAGE TITLE -->

<form action="<?php echo base_url('permohonan/search'); ?>">
    <div class="row">
        <div class="col-md-3">
            <div class="panel">
                <div class="panel-heading">
                    <div class="panel-title">Pencarian</div>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <input type="text" class="form-control datepicker" name="from" placeholder="Dari" value="<?php echo $from; ?>">
                        <input type="text" class="form-control datepicker" name="to" placeholder="Sampai" value="<?php echo $to; ?>">
                    </div>
                </div>
                <div class="panel-footer">
                    <button class="btn btn-warning btn-block">Cari</button>
                </div>
            </div>
        </div>
    </div>
</form>

<div class="row">
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-heading">
                <h3 class="panel-title">Permohonan</h3>
                <ul class="panel-controls">
                    <li><a href="<?php echo base_url("permohonan/export_excel?from=$from&to=$to"); ?>"><i class="fa fa-download"></i> </a> </li>
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
                        <th>Biaya</th>
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
                            <td><?php echo format_rupiah($analisis->biaya); ?></td>
                            <td><a href="<?php echo base_url('permohonan/detail/'.$analisis->id); ?>" class="btn btn-info btn-sm">Detail</a> </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>