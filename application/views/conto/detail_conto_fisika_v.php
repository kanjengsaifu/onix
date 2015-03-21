<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/7/13
 * Time: 11:51 AM
 */
?>
<a href="<?php echo base_url('analisis/detail/'. $analisis->id); ?>" class="btn btn-xs btn-primary pull-left" data-toggle="tooltip" data-placement="bottom" title="Kembali Ke Detail Analisis"><i class="fa fa-chevron-left"></i> Kembali</a>

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
        <?php

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
            ?>
            <h1>Analisis Fisika <small><?php echo no_conto($conto->nomor_conto); ?></small></h1>
            <?php
                foreach($analisis_type_analisis as $row):
                    $nilai = json_decode($row->nilai);
            ?>
                <div class="alert alert-success">
                    <strong><?php echo $row->nama; ?></strong>
                    <a href="<?php echo base_url('conto/analisis/'. $conto->id . '/' . $row->id_type_analisis); ?>" class="btn btn-xs btn-warning pull-right" data-toggle="tooltip" data-placement="bottom" title="Analisis <?php echo $row->nama; ?>"><i class="fa fa-edit"></i> Analisis</a>
                </div>
                <!-- Analisa deskripsi -->
                <?php if(in_array(strtoupper($row->id_type_analisis), $type_analisis_deskripsi)): ?>
                    <label class="control-label">Deskripsi Mikroskopis</label>
                    <p><?php echo $row->d_mikroskopis; ?></p>
                    <br>
                    <label class="control-label">Komposisi Mineral</label>
                    <p><?php echo $row->komposisi; ?></p>

                    <div class="row">
                        <div class="col-xs-6">
                            <div id="foto-<?php echo $row->id.$row->id.'1'; ?>">
                                <?php
                                // cek ke directory
                                $ada_foto1 = ada_foto($row->foto_1);
                                ?>
                                <?php if($ada_foto1 == TRUE){ ?>
                                    <img src="<?php echo base_url('assets/img/foto_conto/'.$row->foto_1); ?>" class="img-responsive"  onclick="show_gambar('<?php echo base_url('assets/img/foto_conto/'.$row->foto_1); ?>', '<?php echo $row->deskripsi_1; ?>')">
                                <?php }else{ ?>
                                    <strong>Belum Ada Foto</strong>
                                <?php }; ?>
                            </div>
                            <p><?php echo $row->deskripsi_1; ?></p>
                        </div>
                        <div class="col-xs-6">
                            <div id="foto-<?php echo $row->id.$row->id.'2'; ?>">
                                <?php
                                // cek ke directory
                                $ada_foto2 = ada_foto($row->foto_2);
                                ?>
                                <?php if($ada_foto2 == TRUE){ ?>
                                    <img src="<?php echo base_url('assets/img/foto_conto/'.$row->foto_2); ?>" class="img-responsive"  onclick="show_gambar('<?php echo base_url('assets/img/foto_conto/'.$row->foto_2); ?>', '<?php echo $row->deskripsi_2; ?>')">
                                <?php }else{ ?>
                                    <strong>Belum Ada Foto</strong>
                                <?php }; ?>
                            </div>
                            <p><?php echo $row->deskripsi_2; ?></p>
                        </div>
                    </div>
                    <!-- Pengisian berat Jenis dan derajat kemagnetan -->
                    <?php elseif(in_array(strtoupper($row->id_type_analisis), $type_analisis_nilai)): ?>
                        <div class="row">
                            <div class="col-xs-5">
                                <h3><?php echo count($nilai) == 0 ? '' : $nilai[0]; ?> <small>%</small></h3>
                            </div>
                        </div>
                    <!-- Analisis Retort -->
                    <?php elseif(strtoupper($row->id_type_analisis) == 'FMBRT'): ?>
                        <div class="row">
                            <div class="col-xs-6">
                                <strong>Kandungan Air</strong>
                                <h3><?php $nilai_k_air = count($nilai) == 0 ? '-' : $nilai->k_air; echo empty($nilai_k_air) ? '-' : $nilai_k_air; ?></h3>
                                <strong>Kandungan Minyak</strong>
                                <h3><?php $nilai_k_minyak = count($nilai) == 0 ? '-' : $nilai->k_minyak; echo empty($nilai_k_minyak) ? '-' : $nilai_k_minyak; ?></h3>
                            </div>
                            <div class="col-xs-6">
                                <strong>Specific Gravity Batuan</strong>
                                <h3><?php $nilai_sg_batuan = count($nilai) == 0 ? '-' : $nilai->sg_batuan; echo empty($nilai_sg_batuan) ? '-' : $nilai_sg_batuan; ?></h3>
                                <strong>Specific Gravity Minyak</strong>
                                <h3><?php $nilai_sg_minyak = count($nilai) == 0 ? '-' : $nilai->sg_minyak; echo empty($nilai_sg_minyak) ? '-' : $nilai_sg_minyak; ?></h3>
                            </div>
                        </div>
                    <!-- Pengisian Kuat Tekan -->
                    <?php elseif(strtoupper($row->id_type_analisis) == 'FMBUF'): ?>
                        <div class="row">
                            <div class="col-xs-6">
                                <strong>Kuat tekan (kg/cm<sup>2</sup>)</strong>
                                <h3><?php echo count($nilai) == 0 ? '' : $nilai[0]; ?></h3>
                            </div>
                            <div class="col-xs-6">
                                <strong>Berat jenis (gr/cm<sup>3</sup>)</strong>
                                <h3><?php echo count($nilai) == 0 ? '' : $nilai[1]; ?></h3>
                            </div>
                        </div>
                    <!-- Pengisian XRD -->
                    <?php elseif(strtoupper($row->id_type_analisis) == 'FMBXR'): ?>
                        <h1><?php echo count($nilai) == 0 ? '' : $nilai[0] ; ?></h1>
                    <!-- Pengisian SRA Source Rock Analyzer -->
                    <?php elseif(strtoupper($row->id_type_analisis) == 'FMBSR'): ?>
                        <div class="row">
                            <div class="col-xs-2">
                                <strong>S1(mg/g)</strong>
                                <div id="nilai-<?php echo $row->id; ?>-s1"><?php echo count($nilai) == 0 ? '' : $nilai[0][0]; ?></div>
                            </div>
                            <div class="col-xs-2">
                                <strong>S2(mg/g)</strong>
                                <div id="nilai-<?php echo $row->id; ?>-s2"><?php echo count($nilai) == 0 ? '' : $nilai[0][1]; ?></div>
                            </div>
                            <div class="col-xs-2">
                                <strong>S3(mg/g)</strong>
                                <div id="nilai-<?php echo $row->id; ?>-s3"><?php echo count($nilai) == 0 ? '' : $nilai[0][2]; ?></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-2">
                                <strong>TOC</strong>
                                <div id="nilai-<?php echo $row->id; ?>-toc"><?php echo count($nilai) == 0 ? '' : $nilai[1]; ?></div>
                            </div>
                            <div class="col-xs-2">
                                <strong>T Max</strong>
                                <div id="nilai-<?php echo $row->id; ?>-tmax"><?php echo count($nilai) == 0 ? '' : $nilai[2]; ?></div>
                            </div>
                            <div class="col-xs-2">
                                <strong>HI</strong>
                                <div id="nilai-<?php echo $row->id; ?>-hi"><?php echo count($nilai) == 0 ? '' : $nilai[3]; ?></div>
                            </div>
                            <div class="col-xs-2">
                                <strong>OI</strong>
                                <div id="nilai-<?php echo $row->id; ?>-oi"><?php echo count($nilai) == 0 ? '' : $nilai[4]; ?></div>
                            </div>
                        </div>
                    <!-- Pengisian Petrografi Batuan Maseral -->
                    <?php elseif(strtoupper($row->id_type_analisis) == 'FMBMR'): ?>
                            <div class="row">
                                <div class="col-xs-3">
                                    <strong>Litologi</strong>
                                    <div class="form-group">
                                        <?php
                                        $select_v = count($nilai) == 0 ? '' : $nilai[0];
                                        switch($select_v)
                                        {
                                            case "BB":
                                                $litologi = 'Batubara';
                                                break;
                                            case "CSH":
                                                $litologi = 'Coaly Shale';
                                                break;
                                            case "SB":
                                                $litologi = 'Serpih Bitumen';
                                                break;
                                            case "SC":
                                                $litologi = 'Shaly Coal';
                                                break;
                                            default:
                                                $litologi = '';
                                                break;
                                        }
                                        ?>
                                        <div class="form-control-static"><?php echo $litologi; ?></div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <strong>Mean Reflektan Virinit (% Rv random)</strong>
                                    <div class="form-control-static"><?php echo count($nilai) == 0 ? '' : $nilai[1]; ?></div>
                                </div>
                                <div class="col-xs-3">
                                    <strong>Kisaran (%)</strong>
                                    <div class="form-control-static"><?php echo count($nilai) == 0 ? '' : $nilai[2]; ?></div>
                                </div>
                                <div class="col-xs-2">
                                    <strong>Standar deviasi</strong>
                                    <div class="form-control-static"><?php echo count($nilai) == 0 ? '' : $nilai[3]; ?></div>
                                </div>
                                <div class="col-xs-1">
                                    <strong>N</strong>
                                    <div class="form-control-static"><?php echo count($nilai) == 0 ? '' : $nilai[4]; ?></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-2">
                                    <label>V</label>
                                    <h3><?php echo count($nilai) == 0 ? '' : $nilai[5]; ?>%</h3>
                                </div>
                                <div class="col-xs-2">
                                    <label>I</label>
                                    <h3><?php echo count($nilai) == 0 ? '' : $nilai[6]; ?>%</h3>
                                </div>
                                <div class="col-xs-2">
                                    <label>L</label>
                                    <h3><?php echo count($nilai) == 0 ? '' : $nilai[7]; ?>%</h3>
                                </div>
                                <div class="col-xs-2">
                                    <label>CLAY</label>
                                    <h3><?php echo count($nilai) == 0 ? '' : $nilai[8]; ?>%</h3>
                                </div>
                                <div class="col-xs-2">
                                    <label>OX B</label>
                                    <h3><?php echo count($nilai) == 0 ? '' : $nilai[9]; ?>%</h3>
                                </div>
                                <div class="col-xs-2">
                                    <label>PY</label>
                                    <h3><?php echo count($nilai) == 0 ? '' : $nilai[10]; ?>%</h3>
                                </div>
                            </div>
                            <br>

                            <label>Komentar</label>
                            <p><?php echo $row->d_mikroskopis; ?></p>
                    <?php endif; ?>
            <?php endforeach; ?>
    </div>
</div>
