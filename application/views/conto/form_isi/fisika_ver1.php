<?php
    // analisis yg ada nilainya
    $type_analisis_nilai = array(
        'FMBBJ',
        'FMBDK'
    );

    $type_analisis_deskripsi = array(
        'FMBAB',
        'FMBMB',
        'FMBMN',
        'FMBPB'
    );
    // ambil type dipakai
    foreach($detail_conto_fisika as $detail_conto):
?>
<h3 class="alert alert-warning"><strong><?php echo $detail_conto->type_analisis; ?></strong></h3>
        <!-- Pengisian Berat Jenis dan Derajat Kemagnetan -->
        <?php if(in_array(strtoupper($detail_conto->id_type_analisis), $type_analisis_nilai)): ?>
            <div class="row">
                <div class="col-xs-5">
                    <form class="form-nilai-fisika" method="post" action="<?php echo base_url('analisis/simpan_nilai_fisika'); ?>">
                        <div class="input-group">
                            <input type="text" name="nilai" class="form-control" placeholder="Simpan Nilai <?php echo $detail_conto->type_analisis; ?>">
                            <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
                            <span class="input-group-btn">
                                <button class="btn btn-success" type="submit">Simpan Nilai</button>
                            </span>
                            <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>"><?php echo $detail_conto->nilai; ?></span>
                            <span class="input-group-addon">gr/cm<sup>3</sup></span>
                            <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
                        </div><!-- /input-group -->
                    </form>
                </div>
            </div>
        <!-- Pengisian Deskripsi Mikrografi -->
        <?php elseif(in_array(strtoupper($detail_conto->id_type_analisis), $type_analisis_deskripsi)): ?>
            <form class="form-group form-simpan-mikroskopik" method="post" action="<?php echo base_url('analisis/simpan_mikroskopik'); ?>">
                <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
                <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
                <label class="control-label">Deskripsi Mikroskopik</label>
                <span id="label-for-<?php echo $detail_conto->id; ?>">
                    <?php if(!empty($detail_conto->d_mikroskopik)): ?>
                        <span class="label label-success"><i class="glyphicon glyphicon-ok"></i></span>
                    <?php endif; ?>
                </span>
                <textarea name="deskripsi" class="form-control"><?php echo $detail_conto->d_mikroskopik; ?></textarea>
                <sup>*Deskripsi Mikroskopik</sup>
                <br>
                <button class="btn btn-primary" id="btn-simpan-mikroskopik">Simpan Deskripsi</button>
            </form>

        <form class="form-group form-simpan-komposisi" method="post" action="<?php echo base_url('analisis/simpan_komposisi'); ?>">
            <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
            <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
            <label class="control-label">Komposisi Mineral</label>
                <span id="label-for-<?php echo $detail_conto->id; ?>">
                    <?php if(!empty($detail_conto->d_mikroskopik)): ?>
                        <span class="label label-success"><i class="glyphicon glyphicon-ok"></i></span>
                    <?php endif; ?>
                </span>
            <textarea name="komposisi" class="form-control"><?php echo $detail_conto->komposisi; ?></textarea>
            <br>
            <button class="btn btn-primary" id="btn-simpan-komposisi">Simpan Komposisi</button>
        </form>

            <div class="row">
                <div class="col-xs-6">
                    <div id="foto-<?php echo $detail_conto->id_conto.$detail_conto->id.'1'; ?>">
                        <?php
                        // cek ke directory
                        $ada_foto1 = ada_foto($detail_conto->foto_1);
                        ?>
                        <?php if($ada_foto1 == TRUE){ ?>
                            <img src="<?php echo base_url('assets/img/foto_conto/'.$detail_conto->foto_1); ?>" class="img-responsive"  onclick="show_gambar('<?php echo base_url('assets/img/foto_conto/'.$detail_conto->foto_1); ?>', '<?php echo $detail_conto->deskripsi_1; ?>')">
                        <?php }else{ ?>
                            <strong>Belum Ada Foto</strong>
                        <?php }; ?>
                    </div>
                    <form action="<?php echo base_url('analisis/simpan_gambar'); ?>" class="form-gambar" method="post" enctype="multipart/form-data">
                        <input id="i_foto" name="foto" type="file">
                        <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id_conto; ?>">
                        <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
                        <input type="hidden" name="no_foto" value="1">
                        <div class="progress" id="progress">
                            <div class="progress-bar" role="progressbar">
                                <div class="percent"></div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary" data-id="<?php echo $detail_conto->id; ?>" id="btn-simpan-gambar">Simpan Fotomikrografi - 1</button>
                    </form>

                    <form action="<?php echo base_url('analisis/simpan_deskripsi_fotomikrograf'); ?>" method="post" class="form-fotomikro">
                        <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
                        <input type="hidden" name="no_deskripsi" value="1">
                        <input type="hidden" name="nama_fisika" value="<?php echo $detail_conto->type_analisis; ?>">
                        <div class="form-group">
                            <label for='fotomikrografi' class="control-label">Deskripsi <?php echo $detail_conto->type_analisis; ?> : </label>
                            <textarea id="fotomikrografi" name="fotomikrograf" class="form-control"><?php echo $detail_conto->deskripsi_1; ?></textarea>
                            <div class="fotomikrografi-text"></div>
                        </div>
                        <button class="btn btn-primary" id="btn-simpan-fotomikro">Simpan Deskripsi Fotomikrografi - 1</button>
                    </form>

                </div>
                <div class="col-xs-6">
                    <div id="foto-<?php echo $detail_conto->id_conto.$detail_conto->id.'2'; ?>">
                        <?php
                        // cek ke directory
                        $ada_foto2 = ada_foto($detail_conto->foto_2);
                        ?>
                        <?php if($ada_foto2 == TRUE){ ?>
                            <img src="<?php echo base_url('assets/img/foto_conto/'.$detail_conto->foto_2); ?>" class="img-responsive"  onclick="show_gambar('<?php echo base_url('assets/img/foto_conto/'.$detail_conto->foto_2); ?>', '<?php echo $detail_conto->deskripsi_2; ?>')">
                        <?php }else{ ?>
                            <strong>Belum Ada Foto</strong>
                        <?php }; ?>
                    </div>
                    <form action="<?php echo base_url('analisis/simpan_gambar'); ?>" class="form-gambar" method="post" enctype="multipart/form-data">
                        <input id="i_foto" name="foto" type="file">
                        <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id_conto; ?>">
                        <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
                        <input type="hidden" name="no_foto" value="2">
                        <div class="progress" id="progress">
                            <div class="progress-bar" role="progressbar">
                                <div class="percent"></div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary" data-id="<?php echo $detail_conto->id; ?>" id="btn-simpan-gambar">Simpan Fotomikrografi - 2</button>
                    </form>

                    <form action="<?php echo base_url('analisis/simpan_deskripsi_fotomikrograf'); ?>" method="post" class="form-fotomikro">
                        <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
                        <input type="hidden" name="no_deskripsi" value="2">
                        <input type="hidden" name="nama_fisika" value="<?php echo $detail_conto->type_analisis; ?>">
                        <div class="form-group">
                            <label for='fotomikrografi' class="control-label">Deskripsi <?php echo $detail_conto->type_analisis; ?> : </label>
                            <textarea id="fotomikrografi" name="fotomikrograf" class="form-control"><?php echo $detail_conto->deskripsi_2; ?></textarea>
                            <div class="fotomikrografi-text"></div>
                        </div>
                        <button class="btn btn-primary" id="btn-simpan-fotomikro">Simpan Deskripsi Fotomikrografi - 2</button>
                    </form>
                </div>
            </div>
        <!-- Pengisian Retort -->
        <?php elseif(strtoupper($detail_conto->id_type_analisis) == 'FMBRT'): ?>
            <div class="row">
                <div class="col-xs-6">
                    <form class="form-nilai-fisika" method="post" action="<?php echo base_url('analisis/simpan_nilai_fisika'); ?>">
                        <div class="input-group">
                            <input type="text" name="nilai" class="form-control" placeholder="Kandungan Air">
                            <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
                            <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>"><?php echo $detail_conto->nilai; ?></span>
                            <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
                            <span class="input-group-btn">
                        </div><!-- /input-group -->
                        <div class="input-group">
                            <input type="text" name="nilai" class="form-control" placeholder="Kandungan Minyak">
                            <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
                            <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>"><?php echo $detail_conto->nilai; ?></span>
                            <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
                            <span class="input-group-btn">
                        </div><!-- /input-group -->
                        <sup>*Isi salah satu, air atau minyak</sup><br>
                        <button class="btn btn-success" type="submit">Simpan Nilai Analisis Retort</button>
                    </form>
                </div>
                <div class="col-xs-6">
                    <form class="form-nilai-fisika" method="post" action="<?php echo base_url('analisis/simpan_nilai_fisika'); ?>">
                        <div class="input-group">
                            <input type="text" name="nilai" class="form-control" placeholder="Specific Gravity Batuan">
                            <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
                            <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>"><?php echo $detail_conto->nilai; ?></span>
                            <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
                            <span class="input-group-btn">
                        </div><!-- /input-group -->
                        <div class="input-group">
                            <input type="text" name="nilai" class="form-control" placeholder="Specific Gravity Minyak">
                            <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
                            <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>"><?php echo $detail_conto->nilai; ?></span>
                            <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
                            <span class="input-group-btn">
                        </div><!-- /input-group -->
                        <sup>*Isi salah satu, batuan atau minyak</sup><br>
                    </form>
                </div>
            </div>
        <!-- Pengisian Kuat Tekan -->
        <?php elseif(strtoupper($detail_conto->id_type_analisis) == 'FMBUF'): ?>
            <form class="form-nilai-fisika" method="post" action="<?php echo base_url('analisis/simpan_nilai_fisika'); ?>">
                <div class="row">
                    <div class="col-xs-6">
                        <strong>Kuat tekan (kg/cm<sup>2</sup>)</strong>
                            <div class="input-group">
                                <input type="text" name="nilai" class="form-control" placeholder="Simpan Nilai <?php echo $detail_conto->type_analisis; ?>">
                                <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
                                <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>"><?php echo $detail_conto->nilai; ?></span>
                                <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
                            </div><!-- /input-group -->
                            <strong>Berat jenis (gr/cm<sup>3</sup>)</strong>
                            <div class="input-group">
                                <input type="text" name="nilai" class="form-control" placeholder="Simpan Nilai <?php echo $detail_conto->type_analisis; ?>">
                                <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
                                <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>"><?php echo $detail_conto->nilai; ?></span>
                                <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
                            </div><!-- /input-group -->
                            <br>
                            <button class="btn btn-success" type="submit">Simpan Nilai Kuat Tekan dan Berat Jenis</button>
                    </div>
                </div>
            </form>
        <!-- Pengisian Kuat Tekan -->
        <?php elseif(strtoupper($detail_conto->id_type_analisis) == 'FMBXR'): ?>
        <form class="form-nilai-fisika" method="post" action="<?php echo base_url('analisis/simpan_nilai_fisika'); ?>">
            <div class="row">
                <div class="col-xs-6">
                    <strong>Nama Mineral</strong>
                    <div class="input-group">
                        <input type="text" name="nilai" class="form-control" placeholder="Nama Mineral">
                        <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
                        <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="submit">Simpan Nama Mineral</button>
                        </span>
                    </div><!-- /input-group -->
                    <br>
                    <span>Quartz, Kaolinite, Pyrophylitte</span>
                </div>
            </div>
        </form>
        <!-- Pengisian SRA Source Rock Analyzer -->
        <?php elseif(strtoupper($detail_conto->id_type_analisis) == 'FMBSR'): ?>
        <form class="form-nilai-fisika" method="post" action="<?php echo base_url('analisis/simpan_nilai_fisika'); ?>">
            <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
            <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
            <div class="row">
                <div class="col-xs-2">
                    <strong>S1(mg/g)</strong>
                    <div class="input-group">
                        <input type="text" name="nilai" class="form-control" placeholder="S1">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>"><?php echo $detail_conto->nilai; ?></span>
                    </div>
                </div>
                <div class="col-xs-2">
                    <strong>S2(mg/g)</strong>
                    <div class="input-group">
                        <input type="text" name="nilai" class="form-control" placeholder="S2">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>"><?php echo $detail_conto->nilai; ?></span>
                    </div>
                </div>
                <div class="col-xs-2">
                    <strong>S3(mg/g)</strong>
                    <div class="input-group">
                        <input type="text" name="nilai" class="form-control" placeholder="S3">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>"><?php echo $detail_conto->nilai; ?></span>
                    </div>
                </div>
                <div class="col-xs-2">
                    <strong>TOC</strong>
                    <div class="input-group">
                        <input type="text" name="nilai" class="form-control" placeholder="TOC">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>"><?php echo $detail_conto->nilai; ?></span>
                    </div>
                </div>
                <div class="col-xs-2">
                    <strong>T Max</strong>
                    <div class="input-group">
                        <input type="text" name="nilai" class="form-control" placeholder="T Max">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>"><?php echo $detail_conto->nilai; ?></span>
                    </div>
                </div>
                <div class="col-xs-1">
                    <strong>HI</strong>
                    <div class="input-group">
                        <input type="text" name="nilai" class="form-control" placeholder="HI">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>"><?php echo $detail_conto->nilai; ?></span>
                    </div>
                </div>
                <div class="col-xs-1">
                    <strong>OI</strong>
                    <div class="input-group">
                        <input type="text" name="nilai" class="form-control" placeholder="OI">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>"><?php echo $detail_conto->nilai; ?></span>
                    </div>
                </div>
            </div>
            <br>
            <button class="btn btn-success" type="submit">Simpan SRA</button>
        </form>
        <?php endif; ?>
<hr>
<?php endforeach; ?>

<br>
