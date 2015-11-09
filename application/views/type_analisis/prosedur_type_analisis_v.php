<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 11/23/13
 * Time: 10:00 AM
 */
?>

<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="">Home</a></li>
    <li><a href="<?php echo base_url('type_analisis'); ?>">Tipe Analisis</a></li>
    <li><a href="<?php echo base_url('type_analisis/detail/' . $type_analisis->id_type_analisis); ?>"><?php echo $type_analisis->nama; ?></a></li>
    <li class="active">Prosedur</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><i class="fa fa-list"></i> Prosedur <?php echo $type_analisis->nama; ?></h2>
</div>
<!-- END PAGE TITLE -->

<div class="row">
    <div class="col-md-4">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <div class="panel-title">Tambah Prosedur Kegiatan</div>
            </div>
            <form action="<?php echo base_url('type_analisis/insert_prosedur_kegiatan'); ?>" method="post">
                <div class="panel-body">

                    <div class="form-group">
                        <label class="control-label">Kegiatan</label>
                        <select name="kegiatan" class="form-control select">
                            <option value="">--Pilih Kegiatan--</option>
                            <?php foreach($reference['kegiatan'] as $temp_kegiatan): ?>
                                <option value="<?php echo $temp_kegiatan->id; ?>" <?php echo set_select('kegiatan', $temp_kegiatan->id); ?>><?php echo $temp_kegiatan->deskripsi; ?></option>
                            <?php endforeach; ?>
                        </select>
                        <?php echo form_error('kegiatan', '<small class="text-danger">', '</small>'); ?>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Pelaksana</label>
                        <select name="pelaksana" class="form-control select">
                            <option value="">--Pilih Pelaksana--</option>
                            <?php foreach($reference['pelaksana'] as $temp_pelaksana): ?>
                                <option value="<?php echo $temp_pelaksana->id; ?>" <?php echo set_select('pelaksana', $temp_pelaksana->id); ?>><?php echo $temp_pelaksana->deskripsi; ?></option>
                            <?php endforeach; ?>
                        </select>
                        <?php echo form_error('pelaksana', '<small class="text-danger">', '</small>'); ?>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Kelengkapan</label>
                        <div class="input-group">
                            <select id="kelengkapan" name="temp_kelengkapan" class="form-control">
                                <option value="">--Pilih Kelengkapan--</option>
                                <?php foreach($reference['kelengkapan'] as $temp_kelengkapan): ?>
                                    <option value="<?php echo $temp_kelengkapan->id; ?>"><?php echo $temp_kelengkapan->deskripsi; ?></option>
                                <?php endforeach; ?>
                            </select>
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button" id="btn-add-kelengkapan">Tambah Kelengkapan</button>
                            </span>
                        </div>
                        <?php echo form_error('kelengkapan', '<small class="text-danger">', '</small>'); ?>
                        <div class="list-group" id="list-kelengkapan">
                            <?php if($this->input->post('kelengkapan')):; ?>
                                <?php foreach($this->input->post('kelengkapan') as $key => $select_kelengkapan): ?>
                                    <div class='list-group-item list-group-item-info' id='kelengkapan-<?php echo $select_kelengkapan; ?>'>
                                        <button class='btn btn-link btn-del-kelengkapan' data-id='<?php echo $select_kelengkapan; ?>'><i class='fa fa-times'></i></button>
                                        <?php echo $this->input->post('nama_kelengkapan')[$key]; ?>
                                        <input type='hidden' name='kelengkapan[]' value='<?php echo $select_kelengkapan; ?>'>
                                        <input type='hidden' name='nama_kelengkapan[]' value='<?php echo $this->input->post('nama_kelengkapan')[$key]; ?>'>
                                    </div>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Waktu</label>
                        <div class="input-group">
                            <input type="number" class="form-control" name="waktu" value="<?php echo set_value('waktu'); ?>">
                            <span class="input-group-addon" id="type_waktu">Menit</span>
                        </div>
                        <?php echo form_error('waktu', '<small class="text-danger">', '</small>'); ?>
                    </div>

                    <div class="form-group">
                        <input type="checkbox" id="is_perhari" name="is_perhari" value="1" <?php echo set_checkbox('is_perhari', 1); ?>> Perhari
                    </div>
                    <div id="perhari">
                        <div class="form-group">
                            <label class="control-label">Jumlah Conto</label>
                            <input class="form-control" type="number" name="jumlah_conto" value="<?php echo set_value('jumlah_conto'); ?>">
                        </div>
                        <div class="form-group">
                            <label class="control-label">Hari</label>
                            <input class="form-control" type="number" name="hari" value="<?php echo set_value('hari'); ?>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Keluaran</label>
                        <select name="keluaran" class="form-control select">
                            <option value="">--Pilih Keluaran--</option>
                            <?php foreach($reference['keluaran'] as $keluaran): ?>
                                <option value="<?php echo $keluaran->id; ?>" <?php echo set_select('keluaran', $keluaran->id); ?>><?php echo $keluaran->deskripsi; ?></option>
                            <?php endforeach; ?>
                        </select>
                        <?php echo form_error('keluaran', '<small class="text-danger">', '</small>'); ?>
                    </div>

                    <div class="form-group">
                        <label class="control-label">Keterangan</label>
                        <textarea name="keterangan" class="form-control"><?php echo set_value('keterangan'); ?></textarea>
                        <?php echo form_error('keterangan', '<small class="text-danger">', '</small>'); ?>
                    </div>

                    <div class="form-group">
                        <input type="checkbox" name="prosedur_khusus" value="1" <?php echo set_checkbox('prosedur_khusus', 1); ?>> Prosedur Khusus
                    </div>
                </div>
                <div class="panel-footer">
                    <input type="hidden" name="id" value="<?php echo $prosedur->id; ?>">
                    <input type="hidden" name="kode_type_analisis" value="<?php echo $type_analisis->id_type_analisis; ?>">
                    <button class="btn btn-success pull-right">Tambah</button>
                </div>
            </form>
        </div>
    </div>

    <div class="col-md-8">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Urutan Kegiatan</div>
            </div>
            <div class="panel-body">
                <div id="tasks" class="tasks ui-sortable">
                    <?php if(!empty($prosedur->kegiatan)): ?>
                        <?php $no = 1; foreach($prosedur->kegiatan as $kegiatan): ?>
                            <div class="task-item <?php echo $kegiatan->prosedur_khusus ? 'task-danger' : 'task-info'; ?>" id="kegiatan-<?php echo $kegiatan->id; ?>">
                                <div class="task-text task-success ui-sortable-handle">
                                    <strong class="form-control-static"><?php echo $no++ . '. ' . $kegiatan->kegiatan; ?></strong>
                                    <div id="prosedur-kegiatan-<?php echo $kegiatan->id; ?>" class="hide">
                                        <hr>
                                        <label>Keluaran</label>
                                        <div class="form-control-static"><?php echo $kegiatan->keluaran; ?></div>
                                        <label>Keterangan</label>
                                        <div class="form-control-static"><?php echo $kegiatan->keterangan; ?></div>
                                        <label>Kelengkapan</label>
                                        <div class="form-control-static">
                                            <ul>
                                                <?php foreach($kegiatan->kelengkapan as $kelengkapan): ?>
                                                    <li><?php echo $kelengkapan->kelengkapan; ?></li>
                                                <?php endforeach; ?>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="task-footer">
                                    <div class="pull-left">
                                        <div>
                                            <span class="fa fa-user"></span> <?php echo $kegiatan->pelaksana; ?>
                                        </div>
                                        <div>
                                            <span class="fa fa-clock-o"></span> <?php echo $kegiatan->is_perhari ? "$kegiatan->jumlah_conto Conto / $kegiatan->hari Hari" : "$kegiatan->waktu Menit"; ?>
                                        </div>
                                        <input type="checkbox" class="update-prosedur-khusus" data-id="<?php echo $kegiatan->id; ?>" <?php echo $kegiatan->prosedur_khusus ? 'checked' : ''; ?>> Prosedur Khusus
                                    </div>
                                    <div class="pull-right">
                                        <a class="btn-detail-prosedur-kegiatan" data-id="<?php echo $kegiatan->id; ?>"><i class="fa fa-search"></i> Detail</a>
                                        <a class="btn-del-prosedur-kegiatan" data-id="<?php echo $kegiatan->id; ?>"><i class="fa fa-times"></i></a>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <a href="<?php echo base_url('type_analisis/copy_from_default/' . $type_analisis->id_type_analisis .'/'. $prosedur->id); ?>" class="btn btn-lg btn-warning">Salin dari type analisis AAS</a>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <form action="<?php echo base_url('type_analisis/update_prosedur'); ?>" method="post">
            <div class="panel panel-warning">
                <div class="panel-body">
                    <div class="form-group">
                        <label class="control-label">Keterangan Total Waktu</label>
                        <textarea name="keterangan_total_waktu" class="form-control" rows="10"><?php echo $prosedur->keterangan_total_waktu; ?></textarea>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Keterangan Prosedur</label>
                        <textarea name="keterangan_prosedur" class="form-control" rows="15"><?php echo $prosedur->keterangan_prosedur; ?></textarea>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Keterangan</label>
                        <textarea name="keterangan" class="form-control" rows="15"><?php echo $prosedur->keterangan; ?></textarea>
                    </div>
                </div>
                <div class="panel-footer">
                    <input type="hidden" name="id" value="<?php echo $prosedur->id; ?>">
                    <input type="hidden" name="id_type_analisis" value="<?php echo $type_analisis->id; ?>">
                    <input type="hidden" name="kode_type_analisis" value="<?php echo $type_analisis->id_type_analisis; ?>">
                    <button class="btn btn-warning pull-right">Update</button>
                </div>
            </div>
        </form>
    </div>
</div>