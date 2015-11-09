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
                                <td><?php echo $col_detail_parameter->nilai; ?></td>
                            <?php endforeach; ?>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
