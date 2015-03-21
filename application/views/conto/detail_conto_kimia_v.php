<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/7/13
 * Time: 11:51 AM
 */
?>
<a href="<?php echo base_url('analisis/detail/'. $analisis->id); ?>" class="btn btn-xs btn-primary pull-left" data-toggle="tooltip" data-placement="bottom" title="Kembali Ke Detail Analisis"><i class="fa fa-chevron-left"></i> Kembali</a>
<a href="<?php echo base_url('conto/analisis/'. $conto->id); ?>" class="btn btn-xs btn-warning pull-right" data-toggle="tooltip" data-placement="bottom" title="Update Data Nilai Conto"><i class="fa fa-edit"></i> Analisis</a>

<div class="clearfix"></div>

<div class="h4"></div>

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
                <th>Nilai</th>
                <th>Satuan</th>
            </tr>
            </thead>
            <tbody>
            <?php $no = 1; foreach($analisis_parameter as $parameter): ?>
                <tr>
                    <td><?php echo $no; ?></td>
                    <td><?php echo nama_kimia($parameter->nama); ?> <p><?php echo $parameter->deskripsi; ?></p></td>
                    <td><?php echo $parameter->nilai; ?></td>
                    <td><?php echo $parameter->satuan; ?></td>
                </tr>
            <?php $no++; endforeach; ?>
            </tbody>
        </table>
    </div>
</div>
