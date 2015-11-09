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

<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('type_analisis'); ?>">Type Analisis</a></li>
    <li class="active"><?php echo $type_analisis->nama; ?></li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><i class="fa fa-flask"></i> Tipe Analisis <?php echo $type_analisis->nama; ?></h2>
</div>
<!-- END PAGE TITLE -->

<div class="row">
    <div class="col-md-12">
        <div class="row">
            <div class="col-xs-4">
                <div class="form-group">
                    <label>ID Type</label>
                    <div class="form-control-static"><?php echo $type_analisis->id_type_analisis; ?></div>
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
                    <div class="form-control-static h3"><?php echo count($type_analisis_parameter); ?></div>
                </div>
            </div>
            <div class="col-xs-4">
                <div class="form-group">
                    <label>Prosedur</label>
                    <div>
                        <a href="<?php echo base_url('type_analisis/prosedur/' . $type_analisis->id_type_analisis); ?>">Update Prosedur</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <div class="panel-title">Tambah Parameter</div>
                    </div>
                    <form action="<?php echo base_url('type_analisis/insert_type_analisis_parameter'); ?>" method="post">
                        <div class="panel-body">
                            <div class="form-group">
                                <label class="control-label">Parameter</label>
                                <select name="id_parameter" class="form-control select">
                                    <option value="">--pilih parameter--</option>
                                    <?php foreach($parameter as $row_parameter): ?>
                                        <option value="<?php echo $row_parameter->id; ?>" <?php echo set_select('id_parameter', $row_parameter->id); ?>><?php echo $row_parameter->nama; ?></option>
                                    <?php endforeach; ?>
                                </select>
                                <?php echo form_error('id_parameter', '<small class="text-danger">', '</small>'); ?>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Harga</label>
                                <div class="input-group">
                                    <span class="input-group-addon">Rp</span>
                                    <input type="text" name="harga" class="form-control" value="<?php echo set_value('harga'); ?>">
                                </div>
                                <?php echo form_error('harga', '<small class="text-danger">', '</small>'); ?>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Satuan</label>
                                <input type="text" name="satuan" class="form-control" value="<?php echo set_value('satuan'); ?>">
                                <?php echo form_error('satuan', '<small class="text-danger">', '</small>'); ?>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <input type="hidden" name="id_type_analisis" value="<?php echo $type_analisis->id; ?>">
                            <input type="hidden" name="id_type_analisis_kode" value="<?php echo $type_analisis->id_type_analisis; ?>">
                            <button class="btn btn-warning pull-right">Simpan</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-9">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-title">
                            Parameter
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table datatable">
                            <thead>
                            <tr>
                                <th>No.</th>
                                <th>Nama</th>
                                <th>Satuan</th>
                                <th>Harga</th>
                                <th>Detail</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach($type_analisis_parameter as $row_type_analisis_parameter): ?>
                                <tr>
                                    <td><?php echo $no++ ?></td>
                                    <td><?php echo nama_kimia($row_type_analisis_parameter->nama_parameter); ?></td>
                                    <td><?php echo $row_type_analisis_parameter->satuan; ?></td>
                                    <td><?php echo format_rupiah($row_type_analisis_parameter->harga); ?></td>
                                    <td><a href="<?php echo base_url('parameter/detail/'.$row_type_analisis_parameter->id_parameter); ?>" class="btn btn-info">Detail</a></td>
                                    <td>
                                        <form class="delete_type_analisis_parameter" action="<?php echo base_url('type_analisis/delete_type_analisis_parameter'); ?>" method="post">
                                            <input type="hidden" name="kode_type_analisis" value="<?php echo $type_analisis->id_type_analisis; ?>">
                                            <input type="hidden" name="id" value="<?php echo $row_type_analisis_parameter->id; ?>">
                                            <button class="btn btn-danger btn-xs"><i class="fa fa-times"></i> hapus</button>
                                        </form>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
