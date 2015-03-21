<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 11/23/13
 * Time: 10:11 AM
 */
$no = 1;
    flashdata();
?>

<h1>Type Analisis <?php echo $type_analisis->nama; ?></h1>
<hr>
<div class="row">
    <div class="col-xs-4">
        <div class="form-group">
            <label>ID Type</label>
            <div class="form-control-static"><?php echo $type_analisis->id_type; ?></div>
        </div>
    </div>
    <div class="col-xs-4">
        <div class="form-group">
            <label>Nama</label>
            <div class="form-control-static"><?php echo $type_analisis->nama; ?></div>
        </div>
    </div>
    <div class="col-xs-4">
        <div class="form-group">
            <label>Laboratorium</label>
            <div class="form-control-static"><?php echo $type_analisis->laboratorium->nama; ?></div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-xs-4">
        <form action="<?php echo base_url('type_analisis/update_harga'); ?>" method="post">
            <div class="form-group">
                <label>Harga</label>
                <div class="input-group">
                    <span class="input-group-addon">
                        Rp.
                    </span>
                    <input type="text" class="form-control" name="harga" value="<?php echo $type_analisis->harga; ?>">
                    <span class="input-group-btn">
                        <button class="btn btn-warning">Update Harga</button>
                    </span>
                </div>
            </div>
            <input type="hidden" name="id_type_analisis" value="<?php echo $type_analisis->id_type_analisis; ?>">
        </form>
    </div>
    <div class="col-xs-4">
        <div class="form-group">
            <label>Jumlah Parameter</label>
            <div class="form-control-static"><?php echo count($parameter); ?></div>
        </div>
    </div>
</div>

<a class="btn btn-primary" href="<?php echo base_url('type_analisis');?>"><i class="fa fa-chevron-left"></i> Kembali</a>
<a class="btn btn-primary pull-right" href="<?php echo base_url('parameter/tambah_parameter/' . $type_analisis->id_type_analisis);?>"><i class="glyphicon glyphicon-plus"></i> Parameter <?php echo $type_analisis->id_type; ?></a>


<hr>

<table class="table table-data">
    <thead>
    <tr>
        <th>No.</th>
        <th>ID</th>
        <th>Nama</th>
        <th>Satuan</th>
        <th>Harga</th>
    </tr>
    </thead>
    <tbody>
    <?php foreach($parameter as $data): ?>
    <tr>
        <td><?php echo $no++; ?></td>
        <td><a href="<?php echo base_url('parameter/detail/'.$data->id_parameter); ?>"><?php echo $data->id_parameter; ?></a></td>
        <td><?php echo nama_kimia($data->nama); ?></td>
        <td><?php echo $data->satuan; ?></td>
        <td><?php echo format_rupiah($data->harga); ?></td>
    </tr>
        <?php endforeach; ?>
    </tbody>
</table>

