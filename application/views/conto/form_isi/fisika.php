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
        'FMBPB',
        'FMBIM'
    );
    // ambil type dipakai
    foreach($detail_conto_fisika as $detail_conto):
        $nilai = json_decode($detail_conto->nilai);
?>
    <h3 class="alert alert-warning"><strong><?php echo $detail_conto->type_analisis; ?></strong></h3>
        <!-- Pengisian Berat Jenis dan Derajat Kemagnetan -->
        <?php if(in_array(strtoupper($detail_conto->id_type_analisis), $type_analisis_nilai)): ?>
            <div class="row">
                <div class="col-xs-5">
                    <form class="form-nilai-fisika" method="post" action="<?php echo base_url('analisis/simpan_nilai_fisika'); ?>">
                        <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
                        <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
                        <div class="input-group">
                            <input type="text" name="nilai[]" class="form-control" placeholder="Simpan Nilai <?php echo $detail_conto->type_analisis; ?>">
                            <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
                            <span class="input-group-btn">
                                <button class="btn btn-success" type="submit">Simpan Nilai</button>
                            </span>
                            <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-nilai"><?php echo count($nilai) == 0 ? '' : $nilai[0]; ?></span>
                            <span class="input-group-addon">gr/cm<sup>3</sup></span>
                            <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
                        </div><!-- /input-group -->
                    </form>
                </div>
            </div>
        <!-- Pengisian Deskripsi Mikrografi -->
        <?php elseif(in_array(strtoupper($detail_conto->id_type_analisis), $type_analisis_deskripsi)): ?>
            <form class="form-group form-simpan-mikroskopis" method="post" action="<?php echo base_url('analisis/simpan_mikroskopis'); ?>">
                <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
                <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
                <label class="control-label">Deskripsi <?php echo $detail_conto->id_type_analisis == 'fmbpb' ? 'Petrografi' : 'Mikroskopis'; ?> </label>
                <span id="label-for-<?php echo $detail_conto->id; ?>-mikroskopis">
                    <?php if(!empty($detail_conto->d_mikroskopis)): ?>
                        <span class="label label-success"><i class="glyphicon glyphicon-ok"></i></span>
                    <?php endif; ?>
                </span>
                <textarea name="deskripsi" class="form-control"><?php echo $detail_conto->d_mikroskopis; ?></textarea>
                <sup>*Deskripsi Mikroskopik</sup>
                <br>
                <button class="btn btn-primary" id="btn-simpan-mikroskopis">Simpan Deskripsi</button>
            </form>

            <form class="form-group form-simpan-komposisi" method="post" action="<?php echo base_url('analisis/simpan_komposisi'); ?>">
                <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
                <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
                <label class="control-label">Komposisi Mineral</label>
                    <span id="label-for-<?php echo $detail_conto->id; ?>-komposisi">
                        <?php if(!empty($detail_conto->komposisi)): ?>
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
        <form class="form-nilai-fisika" method="post" action="<?php echo base_url('analisis/simpan_nilai_fisika'); ?>">
            <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
            <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
            <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
            <div class="row">
                <div class="col-xs-6">
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="Kandungan Air">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>k-air"><?php echo count($nilai) == 0 ? '' : $nilai->k_air; ?></span>
                        <span class="input-group-btn">
                    </div><!-- /input-group -->
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="Kandungan Minyak">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>k-minyak"><?php echo count($nilai) == 0 ? '' : $nilai->k_minyak; ?></span>
                        <span class="input-group-btn">
                    </div><!-- /input-group -->
                    <sup>*Isi salah satu, air atau minyak</sup><br>
                    <button class="btn btn-success" type="submit">Simpan Nilai Analisis Retort</button>
                </div>
                <div class="col-xs-6">
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="Specific Gravity Batuan">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>sg-batuan"><?php echo count($nilai) == 0 ? '' : $nilai->sg_batuan; ?></span>
                        <span class="input-group-btn">
                    </div><!-- /input-group -->
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="Specific Gravity Minyak">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>sg-minyak"><?php echo count($nilai) == 0 ? '' : $nilai->sg_minyak; ?></span>
                        <span class="input-group-btn">
                    </div><!-- /input-group -->
                    <sup>*Isi salah satu, batuan atau minyak</sup><br>
                </div>
            </div>
        </form>
        <!-- Pengisian Kuat Tekan -->
        <?php elseif(strtoupper($detail_conto->id_type_analisis) == 'FMBUF'): ?>
            <form class="form-nilai-fisika" method="post" action="<?php echo base_url('analisis/simpan_nilai_fisika'); ?>">
                <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
                <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
                <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
                <div class="row">
                    <div class="col-xs-6">
                        <strong>Kuat tekan (kg/cm<sup>2</sup>)</strong>
                        <div class="input-group">
                            <input type="text" name="nilai[]" class="form-control" placeholder="Simpan Nilai <?php echo $detail_conto->type_analisis; ?>">
                            <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-kuat-tekan"><?php echo count($nilai) == 0 ? '' : $nilai[0]; ?></span>
                        </div><!-- /input-group -->
                        <strong>Berat jenis (gr/cm<sup>3</sup>)</strong>
                        <div class="input-group">
                            <input type="text" name="nilai[]" class="form-control" placeholder="Simpan Nilai <?php echo $detail_conto->type_analisis; ?>">
                            <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-berat-jenis"><?php echo count($nilai) == 0 ? '' : $nilai[1]; ?></span>
                        </div><!-- /input-group -->
                        <br>
                        <button class="btn btn-success" type="submit">Simpan Nilai Kuat Tekan dan Berat Jenis</button>
                    </div>
                </div>
            </form>
        <!-- Pengisian XRD -->
        <?php elseif(strtoupper($detail_conto->id_type_analisis) == 'FMBXR'): ?>
        <form class="form-nilai-fisika" method="post" action="<?php echo base_url('analisis/simpan_nilai_fisika'); ?>">
            <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
            <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
            <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
            <div class="row">
                <div class="col-xs-6">
                    <strong>Nama Mineral</strong>
                    <div class="input-group">
                        <input type="text" name="nilai" class="form-control" placeholder="Nama Mineral">
                        <span class="input-group-btn">
                            <button class="btn btn-success" type="submit">Simpan Nama Mineral</button>
                        </span>
                    </div><!-- /input-group -->
                    <br>
                    <span id="nilai-<?php echo $detail_conto->id; ?>-xr"><?php echo count($nilai) == 0 ? '' : $nilai[0] ; ?></span>
                </div>
            </div>
        </form>
        <!-- Pengisian SRA Source Rock Analyzer -->
        <?php elseif(strtoupper($detail_conto->id_type_analisis) == 'FMBSR'): ?>
        <form class="form-nilai-fisika" method="post" action="<?php echo base_url('analisis/simpan_nilai_fisika'); ?>">
            <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
            <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
            <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
            <div class="row">
                <div class="col-xs-4">
                    <strong>S1(mg/g)</strong>
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="S1">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-s1"><?php echo count($nilai) == 0 ? '' : $nilai[0][0]; ?></span>
                    </div>
                </div>
                <div class="col-xs-4">
                    <strong>S2(mg/g)</strong>
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="S2">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-s2"><?php echo count($nilai) == 0 ? '' : $nilai[0][1]; ?></span>
                    </div>
                </div>
                <div class="col-xs-4">
                    <strong>S3(mg/g)</strong>
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="S3">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-s3"><?php echo count($nilai) == 0 ? '' : $nilai[0][2]; ?></span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-3">
                    <strong>TOC</strong>
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="TOC">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-toc"><?php echo count($nilai) == 0 ? '' : $nilai[1]; ?></span>
                    </div>
                </div>
                <div class="col-xs-3">
                    <strong>T Max</strong>
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="T Max">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-tmax"><?php echo count($nilai) == 0 ? '' : $nilai[2]; ?></span>
                    </div>
                </div>
                <div class="col-xs-3">
                    <strong>HI</strong>
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="HI">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-hi"><?php echo count($nilai) == 0 ? '' : $nilai[3]; ?></span>
                    </div>
                </div>
                <div class="col-xs-3">
                    <strong>OI</strong>
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="OI">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-oi"><?php echo count($nilai) == 0 ? '' : $nilai[4]; ?></span>
                    </div>
                </div>
            </div>
            <br>
            <button class="btn btn-success" type="submit">Simpan SRA</button>
        </form>

        <form method="post" class="form-deskripsi-conto" action="<?php echo base_url('analisis/simpan_deskirpsi_conto'); ?>">
            <?php
                $komentar_sra = $this->hasil_analisis_m->get_komentar_sra($id_analisis);
            ?>
            <input type="hidden" name="id_conto" value="<?php echo $komentar_sra->id; ?>">
            <div class="form-group">
                <label>Komentar</label>
                <textarea name="deskripsi" class="form-control"><?php echo $komentar_sra->deskripsi; ?></textarea>
                <sup>*Komentar untuk keseluruhan conto</sup>
            </div>
            <button class="btn btn-primary">Simpan Komentar</button>
        </form>
        <!-- Pengisian Maseral -->
        <?php elseif(strtoupper($detail_conto->id_type_analisis) == 'FMBMR'): ?>
        <form class="form-nilai-fisika" method="post" action="<?php echo base_url('analisis/simpan_nilai_fisika'); ?>">
            <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
            <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
            <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
            <div class="row">
                <div class="col-xs-3">
                    <strong>Litologi</strong>
                    <div class="form-group">
                        <?php
                            $select_v = count($nilai) == 0 ? '' : $nilai[1];
                        ?>
                        <select name="nilai[]" class="form-control" id="mrv">
                            <option value="BB" <?php $select_v == 'BB' ? 'SELECTED' : ''; ?>>Batubara</option>
                            <option value="CSH" <?php $select_v == 'CSA' ? 'SELECTED' : ''; ?>>Coaly Shale</option>
                            <option value="SB" <?php $select_v == 'SB' ? 'SELECTED' : ''; ?>>Serpih Bitumen</option>
                            <option value="SHC" <?php $select_v == 'SC' ? 'SELECTED' : ''; ?>>Shaly Coal</option>
                        </select>
                    </div>
                </div>
                <div class="col-xs-3">
                    <strong>Mean Reflektan Virinit (% Rv random)</strong>
                    <input type="text" class="form-control" name="nilai[]" id="mrv" value="<?php echo count($nilai) == 0 ? '' : $nilai[1]; ?>" required>
                </div>
                <div class="col-xs-3">
                    <strong>Kisaran (%)</strong>
                    <input type="text" class="form-control" name="nilai[]" id="kisaran" value="<?php echo count($nilai) == 0 ? '' : $nilai[2]; ?>" required>
                </div>
                <div class="col-xs-2">
                    <strong>Standar deviasi</strong>
                    <input type="text" class="form-control" name="nilai[]" id="sd" value="<?php echo count($nilai) == 0 ? '' : $nilai[3]; ?>" required>
                </div>
                <div class="col-xs-1">
                    <strong>N</strong>
                    <input type="text" class="form-control" name="nilai[]" id="n" value="<?php echo count($nilai) == 0 ? '' : $nilai[4]; ?>" required>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">V</span>
                        <input type="text" class="form-control" name="nilai[]" id="v"  value="<?php echo count($nilai) == 0 ? '' : $nilai[5]; ?>" required>
                        <span class="input-group-addon">%</span>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">I</span>
                        <input type="text" class="form-control" name="nilai[]" id="i" value="<?php echo count($nilai) == 0 ? '' : $nilai[6]; ?>" required>
                        <span class="input-group-addon">%</span>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">L</span>
                        <input type="text" class="form-control" name="nilai[]" id="l" value="<?php echo count($nilai) == 0 ? '' : $nilai[7]; ?>" required>
                        <span class="input-group-addon">%</span>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">CLAY</span>
                        <input type="text" class="form-control" name="nilai[]" id="clay" value="<?php echo count($nilai) == 0 ? '' : $nilai[8]; ?>" required>
                        <span class="input-group-addon">%</span>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">OX B</span>
                        <input type="text" class="form-control" name="nilai[]" id="oxb" value="<?php echo count($nilai) == 0 ? '' : $nilai[9]; ?>" required>
                        <span class="input-group-addon">%</span>
                    </div>
                </div>
                <div class="col-xs-2">
                    <div class="input-group">
                        <span class="input-group-addon">PY</span>
                        <input type="text" class="form-control" name="nilai[]" id="py" value="<?php echo count($nilai) == 0 ? '' : $nilai[10]; ?>" required>
                        <span class="input-group-addon">%</span>
                    </div>
                </div>
            </div>
            <br>
            <button class="btn btn-success" type="submit">Simpan Nilai Komposisi Maseral dan Reflektan</button>
        </form>

        <form action="<?php echo base_url('analisis/simpan_mikroskopis'); ?>" method="post" class="form-simpan-mikroskopis">
            <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
            <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
            <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
            <div class="form-group">
                <label>Komentar</label>
                <textarea name="deskripsi" class="form-control"><?php echo $detail_conto->d_mikroskopis; ?></textarea>
            </div>
            <br>
            <button class="btn btn-success" type="submit">Simpan Komentar Komposisi Maseral dan Reflektan</button>
        </form>
        <!-- Pengisian SEM -->
        <?php elseif(strtoupper($detail_conto->id_type_analisis) == "FMBSE"): ?>
        <form class="form-nilai-fisika" method="post" action="<?php echo base_url('analisis/simpan_nilai_fisika'); ?>">
            <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
            <input type="hidden" name="id_detail" value="<?php echo $detail_conto->id; ?>">
            <input type="hidden" name="nama_type_analisis" value="<?php echo $detail_conto->type_analisis; ?>">
            <h3>Element</h3>
            <div class="row">
                <div class="col-xs-4">
                    <strong>OK</strong>
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-okwt"><?php echo count($nilai) == 0 ? '' : $nilai[0]; ?></span>
                        <span class="input-group-addon">Wt%</span>
                    </div><!-- /input-group -->
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-okat"><?php echo count($nilai) == 0 ? '' : $nilai[1]; ?></span>
                        <span class="input-group-addon">At%</span>
                    </div><!-- /input-group -->
                </div>
                <div class="col-xs-4">
                    <strong>Mgk</strong>
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-mgkwt"><?php echo count($nilai) == 0 ? '' : $nilai[2]; ?></span>
                        <span class="input-group-addon">Wt%</span>
                    </div><!-- /input-group -->
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-mgkat"><?php echo count($nilai) == 0 ? '' : $nilai[3]; ?></span>
                        <span class="input-group-addon">At%</span>
                    </div><!-- /input-group -->
                </div>
                <div class="col-xs-4">
                    <strong>Matrix</strong>
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-matwt"><?php echo count($nilai) == 0 ? '' : $nilai[4]; ?></span>
                        <span class="input-group-addon">Wt%</span>
                    </div><!-- /input-group -->
                    <div class="input-group">
                        <input type="text" name="nilai[]" class="form-control" placeholder="">
                        <span class="input-group-addon" id="nilai-<?php echo $detail_conto->id; ?>-matat"><?php echo count($nilai) == 0 ? '' : $nilai[5]; ?></span>
                        <span class="input-group-addon">At%</span>
                    </div><!-- /input-group -->
                </div>
            </div>
            <button class="btn btn-success">Simpan Nilai</button>
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
        <!-- Pengisian Analisis Ayak -->
        <?php elseif(strtoupper($detail_conto->id_type_analisis) == "FMBMA"): ?>
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
                        <strong>Belum Ada Gambar Diagram Balok Sebaran besar butir</strong>
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
                    <button type="submit" class="btn btn-primary" data-id="<?php echo $detail_conto->id; ?>" id="btn-simpan-gambar">Simpan Gambar</button>
                </form>


            </div>

            <div class="col-xs-6">
                <form action="<?php echo base_url('analisis/simpan_deskripsi_fotomikrograf'); ?>" method="post" class="form-fotomikro">
                    <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
                    <input type="hidden" name="no_deskripsi" value="1">
                    <input type="hidden" name="nama_fisika" value="<?php echo $detail_conto->type_analisis; ?>">
                    <div class="form-group">
                        <label for='fotomikrografi' class="control-label">Deskripsi Mikroskopis<?php echo $detail_conto->type_analisis; ?> : </label>
                        <textarea id="fotomikrografi" name="fotomikrograf" class="form-control"><?php echo $detail_conto->deskripsi_1; ?></textarea>
                        <div class="fotomikrografi-text"></div>
                    </div>
                    <button class="btn btn-primary" id="btn-simpan-fotomikro">Simpan Deskripsi</button>
                </form>
            </div>
        </div>

        <form class="form-group form-simpan-komposisi" method="post" action="<?php echo base_url('analisis/simpan_komposisi'); ?>">
            <input type="hidden" name="id_proses" value="<?php echo $detail_conto->id; ?>">
            <input type="hidden" name="id_type_analisis" value="<?php echo $detail_conto->id_type_analisis; ?>">
            <label class="control-label">Komposisi Mineral Ayak</label>
                    <span id="label-for-<?php echo $detail_conto->id; ?>-komposisi">
                        <?php if(!empty($detail_conto->komposisi)): ?>
                            <span class="label label-success"><i class="glyphicon glyphicon-ok"></i></span>
                        <?php endif; ?>
                    </span>

            <textarea name="komposisi" class="form-control"><?php echo $detail_conto->komposisi; ?></textarea>
            <br>
            <button class="btn btn-primary" id="btn-simpan-komposisi">Simpan Komposisi</button>
        </form>
    <?php endif; ?>
<hr>
<?php endforeach; ?>

<br>
