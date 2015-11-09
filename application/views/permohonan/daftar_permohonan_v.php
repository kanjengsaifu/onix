<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="#">Permohonan</a></li>
    <li class="active">Tugas Analisis <?php echo $lab->nama; ?></li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2>Permohonan Tugas Analisis <?php echo $lab->nama; ?></h2>
</div>
<!-- END PAGE TITLE -->

<div class="row">
    <div class="col-md-12">

        <div class="wizard">
            <ul class="steps_4 anchor">
                <li>
                    <a class="done" href="#step-1">
                        <span class="stepNumber">1</span>
                        <span class="stepDesc">Pemohon<br /><small>Pilih Pemohon</small></span>
                    </a>
                </li>
                <li>
                    <a class="selected" href="#step-2">
                        <span class="stepNumber">2</span>
                        <span class="stepDesc">Form<br /><small>Data Permohonan</small></span>
                    </a>
                </li>
                <li>
                    <a href="#step-3">
                        <span class="stepNumber">3</span>
                        <span class="stepDesc">Preview<br /><small>Pre-edit</small></span>
                    </a>
                </li>
                <li>
                    <a href="#step-4">
                        <span class="stepNumber">4</span>
                        <span class="stepDesc">Simpan<br /><small>Selesai</small></span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="line-height-30">&nbsp;</div>

        <form action="<?php echo base_url('permohonan/daftar/'.$lab->id_lab); ?>" class="form-horizontal" method="post" role="form" id="form_pendaftaran">
            <input type="hidden" name="id_lab" value="<?php echo $lab->id_lab; ?>">
            <input type="hidden" name="id_komoditi" value="<?php echo $lab->id_komoditi; ?>">
            <input type="hidden" name="id_pemohon" value="<?php echo $pemohon->id_pemohon; ?>">

            <div class="panel tabs">

                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#tab-permohonan" role="tab" data-toggle="tab">Data Permohonan</a></li>
                    <li><a href="#tab-parameter" role="tab" data-toggle="tab">Parameter</a></li>
                </ul>

                <div class="panel-body tab-content">
                    <div class="tab-pane active" id="tab-permohonan">

                        <div class="form-group">
                            <label class="col-md-3 col-xs-12 control-label">Pemohon </label>
                            <div class="col-md-6 col-xs-12">
                                <label class="check">
                                    <?php echo $pemohon->nama; ?> (<?php echo $pemohon->type_pemohon->nama; ?>) <a href="<?php echo base_url('permohonan/pemohon'); ?>" class="btn btn-warning btn-xs">Ganti</a>
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 col-xs-12 control-label">Tanggal Conto diterima</label>
                            <div class="col-md-6 col-xs-12">
                                <input type="text" name="tanggal_terima" id="tanggal_masuk" class="form-control datepicker" placeholder="dd-mm-yyyy" value="<?php echo set_value('tanggal_terima', now(TRUE)); ?>">
                                <?php echo form_error('tanggal_terima', '<small class="text-danger">', '</small>'); ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 col-xs-12 control-label" for="contoh">Jenis Conto</label>
                            <div class="col-md-6 col-xs-12">
                                <input type="text" name="jenis_contoh" id="contoh" class="form-control" value="<?php echo set_value('jenis_contoh'); ?>">
                                <?php echo form_error('jenis_contoh', '<small class="text-danger">', '</small>'); ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 col-xs-12 control-label" for="jumlah">Jumlah Conto</label>
                            <div class="col-md-6 col-xs-12">
                                <input type="text" name="jumlah_contoh" id="jumlah" class="form-control" value="<?php echo set_value('jumlah_contoh'); ?>" onkeyup="refresh_harga()">
                                <?php echo form_error('jumlah_contoh', '<small class="text-danger">', '</small>'); ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 col-xs-12 control-label" for="provinsi">Provinsi</label>
                            <div class="col-md-6 col-xs-12">
                                <select name="provinsi" id="provinsi" class="form-control select" onchange="kab(this.value)">
                                    <option value="0" SELECTED="">--Pilih Provinsi--</option>
                                    <?php foreach($provinsi as $row): ?>
                                        <option value="<?php echo $row->id_provinsi; ?>" <?php echo set_select('provinsi', $row->id_provinsi); ?>><?php echo $row->nama; ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 col-xs-12 control-label" for="provinsi">Kabupaten</label>
                            <div class="col-md-6 col-xs-12">
                                <select name="lokasi" id="lokasi" class="form-control">
                                    <option value="">--Kota--</option>
                                </select>
                                <?php echo form_error('lokasi', '<small class="text-danger">', '</small>'); ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 col-xs-12 control-label" for="preparasi">Preparasi</label>
                            <div class="col-md-6 col-xs-12">
                                <label class="check">
                                    <input type="checkbox" name="preparasi" class="icheckbox" value="1" <?php echo set_checkbox('preparasi', '1', TRUE); ?>>
                                </label>
                                <span class="help-block">Harga Preparasi Rp. 600.000</span>
                                <?php echo form_error('param[]', '<small class="text-danger">', '</small>'); ?>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-parameter">

                        <?php echo form_error('param[]', '<small class="text-danger">', '</small>'); ?>
                        <?php $this->load->view('permohonan/parameter/'.$page_parameter); ?>

                    </div>
                </div>
                <div class="panel-footer">
                    <button class="btn btn-primary pull-right">Simpan <span class="fa fa-floppy-o fa-right"></span></button>
                    <?php if($this->session->userdata('permohonan')): ?>
                        <a href="<?php echo base_url('permohonan/preview'); ?>" class="btn btn-info pull-right" data-toggle="tooltip" data-placement="bottom" title="Lihat data permohonan yang diinputkan sebelumnya"><i class="fa fa-eye"></i> Preview</a>
                    <?php endif; ?>
                    <a href="<?php echo base_url('permohonan/reset'); ?>" id="btn-reset-permohonan" class="btn btn-danger pull-left" data-toggle="tooltip" data-placement="bottom" title="Ulangi pengisian permohonan"><i class="fa fa-refresh"></i> Ulang</a>
                </div>
            </div>
        </form>
    </div>
</div>