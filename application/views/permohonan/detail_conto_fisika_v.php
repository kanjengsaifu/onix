<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('permohonan'); ?>">Permohonan</a></li>
    <li><a href="<?php echo base_url('permohonan/detail/' . $permohonan->id); ?>"><?php echo $permohonan->nomor_analisis; ?></a></li>
    <li class="active">Detail Conto Fisika</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-arrow-circle-o-left" id="btn-back"></span> Detail Conto Fisika</h2>
</div>
<!-- END PAGE TITLE -->

<div class="row">
    <div class="col-md-3">
        <div class="panel panel-info">
            <div class="panel-body list-group">
                <div class="list-group-item">
                    <label for="contoh">Jenis Conto</label>
                    <div class="pull-right"><?php echo $permohonan->jenis_conto; ?></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-9">
        <div class="panel">
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>No</th>
                        <th>Nomor Conto</th>
                        <th>Kode Conto</th>
                        <th>Type Analisis</th>
                        <th>Download</th>
                    </tr>
                    </thead>
                    <tbody>
                        <?php $no = 1; foreach($conto as $row_conto): ?>
                            <?php foreach($row_conto->detail_fisika as $row_fisika ): ?>
                            <tr>
                                <td><?php echo $no++; ?>.</td>
                                <td>
                                    <?php echo $row_conto->nomor_conto; ?>
                                </td>
                                <td>
                                    <?php echo $row_conto->kode_conto; ?>
                                </td>
                                <td><?php echo $row_fisika->nama_type_analisis; ?></td>
                                <td>
                                    <?php if($row_fisika->export_excel): ?>
                                        <?php if(empty($row_fisika->nilai)){ ?>
                                            <button class="btn btn-default btn-xs disabled">
                                                <i class="fa fa-file-excel-o"></i>
                                            </button>
                                        <?php }else{ ?>
                                            <a href="<?php echo base_url('sertifikat/export_conto_fisika/' . $row_fisika->id); ?>" class="btn btn-xs btn-info">
                                                <i class="fa fa-file-excel-o"></i>
                                            </a>
                                        <?php }; ?>
                                    <?php else: ?>
                                        <label class="text-warning"></label>
                                    <?php endif; ?>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>