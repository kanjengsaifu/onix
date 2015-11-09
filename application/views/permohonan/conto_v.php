<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('permohonan'); ?>">Permohonan</a></li>
    <li><a href="<?php echo base_url('permohonan/detail/' . $permohonan->id); ?>"><?php echo $permohonan->nomor_analisis; ?></a></li>
    <li class="active">Conto</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><a href="<?php echo base_url('permohonan/detail/'.$permohonan->id); ?>"><span class="fa fa-arrow-circle-o-left" id="btn-back"></span></a> Conto</h2>
</div>
<!-- END PAGE TITLE -->

<div class="row">
    <div class="col-md-4">
        <div class="panel panel-info">
            <div class="panel-body list-group">
                <div class="list-group-item">
                    <label for="contoh">Nomor Analisis</label>
                    <div class="pull-right"><?php echo $permohonan->nomor_analisis; ?></div>
                </div>
                <div class="list-group-item">
                    <label for="contoh">Laboratorium</label>
                    <div class="pull-right"><?php echo $laboratorium->nama; ?></div>
                </div>
                <div class="list-group-item">
                    <label for="contoh">Jenis Conto</label>
                    <div class="pull-right"><?php echo $permohonan->jenis_conto; ?></div>
                </div>
                <div class="list-group-item">
                    <label for="contoh">Jumlah Conto</label>
                    <div class="pull-right"><?php echo $permohonan->jumlah_conto; ?></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-8">
        <div class="panel">
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <?php if(count($conto) == 0): ?>
                            <th></th>
                        <?php else: ?>
                            <th>No</th>
                            <th>Nomor Conto</th>
                            <th>Kode Conto</th>
                            <th>Detail</th>
                        <?php endif; ?>
                    </tr>
                    </thead>
                    <tbody>
                        <?php if(count($conto) == 0): ?>
                            <tr>
                                <td colspan="4">
                                    <form action="<?php echo base_url('conto/insert_batch'); ?>" method="post" id="form_insert_batch_conto">
                                        <input type="hidden" value="<?php echo $permohonan->id; ?>" name="id">
                                        <button class="btn btn-warning btn-xs"><i class="fa fa-file"></i> Buat form untuk <?php echo $permohonan->jumlah_conto; ?> Conto</button>
                                    </form>
                                </td>
                            </tr>
                        <?php else: ?>
                            <?php $no = 1; $kode = 1; foreach($conto as $row_conto): ?>
                                <tr>
                                    <td><?php echo $no++; ?>.</td>
                                    <td>
                                        <?php echo $row_conto->nomor_conto; ?>
                                    </td>
                                    <td>
                                        <input type="text" value="<?php echo $row_conto->kode_conto; ?>" name="kode_conto[]" data-id="<?php echo $row_conto->id; ?>" class="form-control update-kode-conto">
                                        <sup>Kode conto tersimpan: <strong><span id="kode-tersimpan-<?php echo $row_conto->id; ?>"><?php echo $row_conto->kode_conto; ?></span></strong></sup>
                                    </td>
                                    <td>
                                        <?php if($is_fisika): ?>
                                            <a href="<?php echo base_url('permohonan/detail_conto_fisika/'. $row_conto->id_analisis); ?>">detail</a>
                                        <?php endif; ?>
                                    </td>
                                </tr>
                            <?php $kode++; endforeach; ?>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>