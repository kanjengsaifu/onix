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
    <li><a href="<?php echo base_url('conto/detail/'. $conto->id); ?>">Conto Kimia | <?php echo $conto->nomor_conto; ?></a></li>
    <li class="active">Update Conto</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-gears"></span> Detail Conto</h2>
</div>
<!-- END PAGE TITLE -->

<div class="row">
    <div class="col-md-4">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Conto</h3>
            </div>
            <div class="panel-body list-group">
                <div class="list-group-item">
                    <div class="">Status
                        <div class="pull-right"><?php echo status_label($conto->is_selesai); ?></div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="">Nomor Analisis
                        <div class="pull-right"><strong><?php echo $analisis->nomor_analisis; ?></strong></div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="">No Conto
                        <div class="pull-right"><strong><?php echo no_conto($conto->nomor_conto); ?></strong></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-8">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <h3 class="panel-title">Parameter</h3>
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
                    <?php $no = 1; foreach($analisis_parameter as $parameter): ?>
                        <tr>
                            <td><?php echo $no; ?>. </td>
                            <td>
                                <?php echo nama_kimia($parameter->nama); ?>
                            </td>
                            <td>
                                <?php if($conto->is_selesai == FALSE): ?>
                                    <form action="<?php echo base_url(); ?>" class="input-group input-group-sm form-update-conto-parameter">
                                        <input type="text" name="nilai" value="<?php echo $parameter->nilai; ?>" class="form-control">
                                        <span class="input-group-addon">
                                            <?php echo $parameter->satuan; ?>
                                        </span>
                                        <span class="input-group-btn">
                                            <button class="btn btn-warning"><i class="glyphicon glyphicon-edit"></i> simpan</button>
                                        </span>
                                        <input type="hidden" name="id" value="<?php echo $parameter->id_parameter_conto; ?>">
                                    </form>
                                <?php endif; ?>
                                <span>nilai: <span id= "nilai_<?php echo $parameter->id_parameter_conto; ?>"><?php echo $parameter->nilai; ?></span></span>
                            </td>
                        </tr>
                        <?php $no++; endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>