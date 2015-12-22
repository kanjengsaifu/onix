<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('analisis/detail/' . $analisis->id); ?>">Analisis <?php echo $analisis->nomor_analisis; ?></a></li>
    <li class="active"><?php echo $title; ?></li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-search"></span> <?php echo ucwords($title); ?></h2>
</div>
<!-- END PAGE TITLE -->

<div class="row">
    <div class="col-md-12">
        <div class="panel panel-info">
            <div class="panel-heading">
                <ul class="panel-controls">
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#" aria-expanded="true"><span class="fa fa-download"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="<?php echo base_url('sertifikat/export_kimia/' . $analisis->id); ?>"><i class="fa fa-file-excel-o"></i> Excel .xls</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>Nomor Analisis</th>
                        <th>Kode Conto</th>
                        <?php foreach($parameter as $col_parameter): ?>
                            <th><?php echo $col_parameter->nama_parameter; ?><br>(<?php echo $col_parameter->satuan; ?>)</th>
                        <?php endforeach; ?>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no = 1; foreach($conto as $row_conto): ?>
                        <tr>
                            <td>
                                <?php echo $row_conto->nomor_conto; ?>
                            </td>
                            <td>
                                <?php echo $row_conto->kode_conto; ?>
                            </td>
                            <?php foreach($row_conto->detail_parameter as $col_detail_parameter): ?>
                                <td>
                                    <div class="input-group input-group-sm ">
                                        <input type="text" name="nilai" value="<?php echo $col_detail_parameter->nilai; ?>" class="form-control form-update-conto-parameter" data-id="<?php echo $col_detail_parameter->id; ?>">

                                        <?php
                                        $array_parameter_total = ['Fixed Carbon'];
                                        if($analisis->id_lab == 'kbb' && in_array($parameter->nama_parameter, $array_parameter_total)):
                                            ?>

                                            <span class="input-group-btn">
                                            <button class="btn btn-warning" id="parameter-count-<?php echo $col_detail_parameter->id; ?>"><i class="fa fa-refresh"></i></button>
                                        </span>

                                        <?php endif; ?>

                                    </div>
                                    <p><?php echo $col_detail_parameter->deskripsi; ?></p>
                                    Nilai Tersimpan:
                                    <strong id= "nilai_<?php echo $col_detail_parameter->id; ?>"><?php echo $col_detail_parameter->nilai; ?></strong>
                                    <br>
                                </td>
                            <?php endforeach; ?>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
