<?php
        if($is_fisika == TRUE):
?>
            <a href="<?php echo base_url('fisika/detail/'.$id_analisis); ?>" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-chevron-left"></span> Kembali</a>
    <?php else: ?>
            <a href="<?php echo base_url('analisis/detail/'.$id_analisis); ?>" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-chevron-left"></span> Kembali</a>
<?php
        endif;
        echo "<br><br>";
?>
    <div class="row">
        <div class="col-sm-3">
            <div class="alert alert-info"><div class="info-data"><?php echo strtoupper(no_conto($conto->id_conto)); ?></div><span class="glyphicon glyphicon-list info-icon"></span> nomor conto</div>
        </div>
<!--        --><?php //if($is_fisika == TRUE): ?>
<!--            <div class="col-sm-4">-->
<!--                <div class="alert alert-info">-->
<!--                    <div class="info-data">-->
<!--                        --><?php //echo ($conto->nama_batuan == NULL) ? '-' : $conto->nama_batuan; ?>
<!--                    </div>-->
<!--                    <button class="btn btn-xs btn-info" id="btn-add-nama"><div class="glyphicon glyphicon-edit"></div></button> nama batuan-->
<!--                </div>-->
<!--            </div>-->
<!--            <div class="col-sm-2">-->
<!--                <div class="alert alert-info">-->
<!--                    <div class="info-data">-->
<!--                        --><?php //echo $conto->berat; ?><!-- gr-->
<!--                    </div>-->
<!--                    <button class="btn btn-xs btn-info" id="btn-add-berat"><div class="glyphicon glyphicon-edit"></div></button> berat-->
<!--                </div>-->
<!--            </div>-->
<!---->
<!--        --><?php //endif; ?>
    </div>

        <?php
            $page = strtolower($type_analisis);
            if($is_fisika == FALSE)
                $page = 'kimia';
            else
                $page = 'fisika';

            $this->load->view('analisis/form_isi/'.$page);
        ?>
        <input type="hidden" value="<?php echo $conto->id; ?>" id="id_conto">
        <input type="hidden" value="<?php echo $id_analisis; ?>" id="id_analisis">
        <input type="hidden" value="<?php echo $type_analisis; ?>" id="id_type">
        <?php if($conto->is_selesai == FALSE): ?>
            <button class="btn btn-primary btn-lg" id="btn_selesai_conto"><span class="glyphicon glyphicon-ok"></span> Selesai</button>
        <?php endif; ?>

<div class="modal fade" id="modal-param"">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Isi Nilai untuk parameter: <span  id="title-param"></span></h4>
                <input type="hidden" name="id_proses" value="<?php echo $conto->id; ?>">
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="input-param" class="control-label col-lg-2">Nilai: </label>
                        <div class="col-lg-3">
                            <input type="text" class="form-control" name="nilai_param" id="input-param">
                            <input type="hidden" id="id-param" name="id_param">
                            <input type="hidden" id="nama-param" name="nama_param">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="satuan-input-param" class="control-label col-lg-2">Satuan: </label>
                        <select name="satuan" id="satuan-input-param">
                            <option value="">--pilih satuan--</option>
                            <option>%</option>
                            <option>‰</option>
                            <option>% mol</option>
                            <option>umhos/cm</option>
                            <option>ppm (mg/L)</option>
                            <option>ppm</option>
                            <option>ppb</option>
                            <option>ppt</option>
                            <option>g/cm3</option>
                            <option>meg%</option>
                            <option>cal/gr</option>
                            <option>°C</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
                <button type="button" class="btn btn-primary" onclick="isi_parameter()">Simpan</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="modal-catatan"">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Isi catatan untuk parameter: <span id="title-param-catatan"></span></h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="input-param" class="control-label col-lg-2">Catatan: </label>
                        <div class="col-lg-8">
                            <textarea type="text" class="form-control" name="catatan" id="input-catatan"></textarea>
                            <input type="hidden" id="id-param-catatan" name="id_param_catatan">
                            <input type="hidden" id="nama-param-catatan" name="nama_param_catatan">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
                <button type="button" class="btn btn-primary" onclick="isi_catatan()">Simpan</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<?php if($is_fisika == TRUE): ?>
<div class="modal fade" id="modal-nama-batuan">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Isi Nama Batuan</h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="input-param" class="control-label col-lg-3">Nama Batuan: </label>
                        <div class="col-lg-8">
                            <input type="text" class="form-control" name="nama_batuan" id="input-nama-batuan">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
                <button type="button" class="btn btn-primary" id="btn-simpan-nama-batuan">Simpan</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="modal-berat"">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Isi jumlah Berat</h4>
                <input type="hidden" name="id_proses" value="<?php echo $conto->id_conto; ?>">
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="input-param" class="control-label col-lg-2">Berat: </label>
                        <div class="col-lg-3 input-group">
                            <input type="text" class="form-control" name="berat" id="input-berat"><span class="input-group-addon">gr</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
                <button type="button" class="btn btn-primary" id="btn-simpan-berat">Simpan</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="modal-gambar"">
    <div class="modal-dialog">
        <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Fotomikrografi :</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <button type="button" onclick="show_gambar()" class="btn btn-success btn-block" <?php if($ada_foto == FALSE) echo 'DISABLED'; ?> id="btn-show-foto">Lihat Foto</button><br>
                        </div>
                    </div>
                    <legend>Ubah Data Foto</legend>
                    <form action="<?php echo base_url('analisis/simpan_gambar'); ?>" id="form-gambar" method="post" enctype="multipart/form-data">
                        <input id="i_foto" name="foto" type="file">
                        <input type="hidden" name="id_proses" value="<?php echo $conto->id_conto; ?>">
                        <div class="progress" id="progress">
                            <div class="progress-bar" role="progressbar">
                                <div class="percent"></div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary" id="btn-simpan-gambar">Simpan Fotomikrografi</button>
                    </form>
                    <br>
                    <br>
                    <form action="<?php echo base_url('analisis/simpan_fotomikrograf'); ?>" method="post" id="form-fotomikro">
                        <input type="hidden" name="id_proses" value="<?php echo $conto->id_conto; ?>">
                        <div class="form-group">
                            <label for='fotomikrografi' class="control-label">Deskripsi : </label>
                            <textarea id="fotomikrografi" name="fotomikrograf" class="form-control"></textarea>
                            <div class="fotomikrografi-text"></div>
                        </div>
                        <button class="btn btn-primary" id="btn-simpan-fotomikro">Simpan Deskripsi</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
                </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="modal-lihat-gambar"">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Foto Conto</h4>
                <input type="hidden" name="id_proses" value="<?php echo $conto->id_conto; ?>">
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12">
                        <div id="gambar-modal"></div>
                    </div>
                    <div class="col-sm-12">
                        <strong>FOTOMIKROGRAFI:</strong><br>
                        <div id="deskripsi"></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="modal-parameter"">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Tambah Parameter</h4>
                <input type="hidden" name="id_proses" value="<?php echo $conto->id_conto; ?>">
            </div>
            <div class="modal-body">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label for="input-param" class="control-label col-lg-2">Parameter: </label>
                        <div class="col-lg-3">
                            <select name="param">
                                <option value="">--Pilih Parameter--</option>
                                <?php
                                    $parameter = $this->parameter_m->get_param_by_type($type_analisis);
                                    foreach($parameter as $param):
                                ?>
                                    <option value="<?php echo $param->id_parameter; ?>"><?php echo $param->nama; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
                <button type="button" class="btn btn-primary" id="btn_tambah_parameter">Simpan</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<?php endif; ?>
