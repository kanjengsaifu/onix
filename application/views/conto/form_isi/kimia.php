<a href="<?php echo base_url('conto/detail/'. $conto->id); ?>" class="btn btn-xs btn-primary pull-left" data-toggle="tooltip" data-placement="bottom" title="Kembali Ke Detail Conto"><i class="fa fa-chevron-left"></i> Kembali</a>

<div class="clearfix"></div>

<div class="row">
    <div class="col-sm-4">
        <ul class="nav nav-pills nav-stacked">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Detail Conto <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <?php
                    foreach($analisis_conto as $row_conto):
                        ?>
                        <li><a href="<?php echo base_url('conto/detail/'. $row_conto->id ); ?>"><?php echo no_conto( $row_conto->nomor_conto ); ?></a></li>
                    <?php endforeach; ?>
                </ul>
            </li>
            <li class="dropdown-header">
                detail analisis
            </li>
            <li>
                <a class="">Status <div class="pull-right"><?php echo status_label($conto->is_selesai); ?></div></a>
            </li>
            <li>
                <a class="">Nomor Analisis<div class="pull-right"><strong><?php echo $analisis->nomor_analisis; ?></strong></div></a>
            </li>
            <li>
                <a class="">No Conto<div class="pull-right"><strong><?php echo no_conto($conto->nomor_conto); ?></strong></div></a>
            </li>
        </ul>

    </div>
    <div class="col-sm-8">
        <table class="table table-data-simple">
            <thead>
            <tr>
                <th>#</th>
                <th>Parameter</th>
                <th>Satuan</th>
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
                    <td><span id="t_satuan_<?php echo $parameter->id_parameter; ?>"><?php echo $parameter->satuan; ?></span></td>
                    <td>
                        <?php if($conto->is_selesai == FALSE): ?>
                            <form action="<?php echo base_url(); ?>" class="input-group input-group-sm form-update-conto-parameter">
                                <input type="text" name="nilai" value="<?php echo $parameter->nilai; ?>" class="form-control">
                                <span class="input-group-btn">
                                    <button class="btn btn-success"><i class="glyphicon glyphicon-edit"></i> nilai</button>
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