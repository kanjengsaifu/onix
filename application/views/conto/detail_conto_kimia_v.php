<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/7/13
 * Time: 11:51 AM
 */
?>
<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('analisis'); ?>">Analisis</a></li>
    <li><a href="<?php echo base_url('analisis/detail/'. $analisis->id); ?>"><?php echo $analisis->nomor_analisis; ?></a></li>
    <li class="active">Conto Kimia | <?php echo $conto->nomor_conto; ?></li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-gears"></span> Detail Conto</h2>
</div>
<!-- END PAGE TITLE -->

<!-- WIDGET -->
<div class="row">
    <div class="col-md-3">
        <div class="widget widget-default widget-no-subtitle">
            <div class="widget-big-int">
                <small class="num-count">Kode Conto</small>
            </div>
            <div class="widget-subtitle"><?php echo $conto->kode_conto; ?></div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="widget widget-success widget-no-subtitle">
            <div class="widget-big-int">
                <small class="num-count"><?php echo $analisis->nomor_analisis; ?></small>
            </div>
            <div class="widget-subtitle">Nomor Analisis</div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="widget widget-info widget-no-subtitle">
            <div class="widget-big-int">
                <small class="num-count"><?php echo $conto->nomor_conto; ?></small>
            </div>
            <div class="widget-subtitle">Nomor Conto</div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="widget widget-default">
            <div class="widget-big-int plugin-clock">00:00</div>
            <div class="widget-subtitle"><?php echo getHari(date('w')).', '.tanggal_format_indonesia(now(TRUE)); ?></div>
        </div>
    </div>
</div>
<!-- END WIDGET -->

<div class="row">
    <?php foreach($analisis_type_analisis as $key => $row_type_analisis): ?>
        <?php echo !($key % 3) ? "<div class='clearfix'></div>" : ''; ?>
        <div class="col-md-4">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title"><?php echo $row_type_analisis->nama; ?></div>
                </div>
                <div class="panel-body">
                    <table class="table datatable_simple">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Parameter</th>
                            <th>Nilai</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php $no = 1; foreach($row_type_analisis->parameter as $parameter): ?>
                            <tr>
                                <td><?php echo $no; ?></td>
                                <td><?php echo $parameter->nama_parameter; ?></td>
                                <td>
                                    <?php if($conto->is_selesai == FALSE): ?>
                                        <div class="input-group input-group-sm ">
                                            <input type="text" name="nilai" value="<?php echo $parameter->nilai; ?>" data-nama="<?php echo $parameter->nama_parameter; ?>" class="form-control form-update-conto-parameter" data-id="<?php echo $parameter->id; ?>">
                                            <span class="input-group-addon">
                                                <?php echo $parameter->satuan; ?>
                                            </span>

                                            <?php
                                                $array_parameter_total = ['Fixed Carbon'];
                                                if($analisis->id_lab == 'kbb' && in_array($parameter->nama_parameter, $array_parameter_total)):
                                            ?>

                                            <span class="input-group-btn">
                                                <button class="btn btn-warning" id="parameter-count-<?php echo $parameter->id; ?>"><i class="fa fa-refresh"></i></button>
                                            </span>

                                            <?php endif; ?>

                                        </div>
                                    <?php endif; ?>
                                    <p><?php echo $parameter->deskripsi; ?></p>
                                    Nilai Tersimpan:
                                    <strong id= "nilai_<?php echo $parameter->id; ?>"><?php echo $parameter->nilai; ?></strong>
                                    <br>
                                    <?php echo !empty($parameter->basis) ? '<sup>Basis: ' . $parameter->basis .'</sup><br>' : ''; ?>
                                    <?php echo !empty($parameter->metoda) ? '<sup>Metoda: ' . $parameter->metoda .'</sup><br>' : ''; ?>
                                </td>
                            </tr>
                            <?php $no++; endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
</div>

<div class="row">
    <div class="col-xs-12">
        <div class="pull-right">
            <?php if($conto->is_selesai): ?>
                <form action="<?php echo base_url('conto/set_unselesai'); ?>" method="post">
                    <input type="hidden" name="id" value="<?php echo $conto->id; ?>">
                    <button class="btn btn-warning btn-xs" id="btn-ubah-conto">ubah</button>
                </form>
            <?php else: ?>
            <form action="<?php echo base_url('conto/set_selesai'); ?>" method="post">
                <input type="hidden" name="id" value="<?php echo $conto->id; ?>">
                <button class="btn btn-success btn-xs" id="btn-selesai-conto">selesai</button>
            </form>
            <?php endif; ?>
        </div>
    </div>
</div>