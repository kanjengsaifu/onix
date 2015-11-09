<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('analisis'); ?>">Analisis</a></li>
    <li class="active"><?php echo $analisis->nomor_analisis; ?></li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><a href="<?php echo base_url('analisis/lab/' . $analisis->id_lab); ?>"><i class="fa fa-arrow-left"></i></a> Detail Analisis</h2>
</div>
<!-- END PAGE TITLE -->

<!-- WIDGET -->
<div class="row">
    <div class="col-md-3">
        <div class="widget widget-success widget-no-subtitle">
            <div class="widget-big-int">
                <small class="num-count"><?php echo $analisis->nomor_analisis; ?></small>
            </div>
            <div class="widget-subtitle">Nomor Analisis</div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="widget widget-default widget-item-icon">
            <div class="widget-item-left">
                <i class="fa fa fa-dot-circle-o"></i>
            </div>
            <div class="widget-data">
                <div class="widget-int num-count"><?php echo $analisis->jumlah_conto; ?></div>
                <div class="widget-title">Conto</div>
                <div class="widget-subtitle">Jumlah Conto</div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="widget widget-default widget-item-icon">
            <div class="widget-item-left">
                <i class="fa fa-check"></i>
            </div>
            <div class="widget-data">
                <div class="widget-int num-count"><?php echo $count_conto_selesai; ?></div>
                <div class="widget-title">Conto</div>
                <div class="widget-subtitle">Jumlah Conto Selesai</div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="widget widget-default">
            <div class="widget-big-int plugin-clock">00:00</div>
            <div class="widget-subtitle"><?php echo getHari(date('w')).', '.tanggal_format_indonesia(now(TRUE)); ?></div>
        </div>
    </div>
</div>
<!-- END WIDGET -->

<?php if($button_terima_conto): ?>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <form action="<?php echo base_url('analisis/terima_analisis'); ?>" method="post">
                <input type="hidden" name="id" value="<?php echo $analisis->id; ?>">
                <button class="btn btn-warning btn-block btn-lg">Apakah Conto Sudah Diterima ?</button>
                <small>*Mohon untuk klik tombol diatas apabila sudah menerima conto</small>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
    <div class="h3"></div>
<?php endif; ?>

<?php if(!$button_mengolah_data_analisis): ?>
    <div class="row">
        <?php foreach($group_button_analisis as $button_analisis): ?>
            <div class="col-md-6">
                <?php if($button_analisis['status'] == 0): ?>
                    <form action="<?php echo base_url('analisis/mulai_analisis'); ?>" method="post">
                        <input type="hidden" name="id" value="<?php echo $analisis->id; ?>">
                        <input type="hidden" name="id_kegiatan" value="<?php echo $button_analisis['id_kegiatan']; ?>">
                        <button class="btn btn-warning btn-block btn-lg">Mulai <?php echo $button_analisis['kegiatan']; ?></button>
                    </form>
                <?php else: ?>
                    <button class="btn btn-warning btn-block btn-lg disabled"><?php echo $button_analisis['kegiatan']; ?></button>
                <?php endif; ?>
                <div class="h5"></div>
            </div>
        <?php endforeach; ?>
    </div>
<?php endif; ?>

<?php if($button_mengolah_data_analisis): ?>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <form action="<?php echo base_url('analisis/add_tracking'); ?>" method="post">
                <input type="hidden" name="id" value="<?php echo $analisis->id; ?>">
                <input type="hidden" name="id_kegiatan" value="8">
                <button class="btn btn-warning btn-block btn-lg">Apakah Anda Sudah mengolah data analisis ?</button>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
    <div class="h3"></div>
<?php endif; ?>

<?php if($button_selesai_analisis): ?>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <form action="<?php echo base_url('analisis/add_tracking'); ?>" method="post">
                <input type="hidden" name="id" value="<?php echo $analisis->id; ?>">
                <input type="hidden" name="id_kegiatan" value="12">
                <button class="btn btn-warning btn-block btn-lg">Apakah Anda Sudah Selesai menganalisis ?</button>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
    <div class="h3"></div>
<?php endif; ?>

<div class="row">
    <div class="col-xs-4">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <div class="panel-title">Metoda Analisis</div>
            </div>
            <div class="panel-body">
                <table class="table datatable_simple">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Nama Metoda Analisis</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no=1; foreach($parameter_analisis as $type_analisis): ?>
                        <tr>
                            <td><?php echo $no; ?>.</td>
                            <td><?php echo $type_analisis->nama; ?></td>
                        </tr>
                        <?php $no++; endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-xs-8">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <div class="panel-title">Conto</div>
                <ul class="panel-controls">
                    <?php if($button_tambah_conto): ?>
                        <li>
                            <a href="<?php echo base_url('conto/insert/' . $analisis->id); ?>"><i class="fa fa-plus"></i></a>
                        </li>
                    <?php endif; ?>
                </ul>
            </div>
            <div class="panel-body">
                <table class="table datatable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>No. Conto</th>
                        <th>Status</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php $no=1; foreach($conto as $row): ?>
                        <tr>
                            <td><?php echo $no++; ?>.</td>
                            <td><?php echo no_conto($row->nomor_conto); ?></td>
                            <td><?php echo status_label($row->is_selesai); ?></td>
                            <td>
                                <a href="<?php echo base_url('conto/detail/'.$row->id); ?>" class="btn btn-xs"><span class="glyphicon glyphicon-search"></span> DETAIL</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
            <div class="panel-footer">
                <?php if($analisis->is_selesai): ?>
                    <form action="<?php echo base_url('analisis/set_unselesai'); ?>" method="post" class="pull-right">
                        <div class="form-group">
                            <input type="hidden" name="id" value="<?php echo $analisis->id; ?>">
                            <button class="btn btn-warning">Ulang proses</button>
                            <br>
                            <sup class="text-info">*Set status analisis ke proses</sup>
                        </div>
                    </form>
                <?php else: ?>
                    <form action="<?php echo base_url('analisis/set_selesai'); ?>" method="post" class="pull-right">
                        <div class="form-group">
                            <input type="hidden" name="id" value="<?php echo $analisis->id; ?>">
                            <button class="btn btn-success">Selesai</button>
                            <br>
                            <sup class="text-info">*Set status analisis ke selesai</sup>
                        </div>
                    </form>
                <?php endif; ?>
            </div>
        </div>
    </div>
</div>


<?php if($button_identifikasi_parameter): ?>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <form action="<?php echo base_url('analisis/identifikasi_parameter'); ?>" method="post">
                <input type="hidden" name="id" value="<?php echo $analisis->id; ?>">
                <button class="btn btn-warning btn-block btn-lg">Apakah Anda sudah mengidentifikasi Parameter ?</button>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
    <div class="h3"></div>
<?php endif; ?>

<?php if($button_simpan_di_buku_induk): ?>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <form action="<?php echo base_url('analisis/simpan_di_buku_induk'); ?>" method="post">
                <input type="hidden" name="id" value="<?php echo $analisis->id; ?>">
                <button class="btn btn-warning btn-block btn-lg">Apakah Anda menyimpan data di buku induk ?</button>
                <small>*Dengan menklik tombol diatas, maka anda dapat memulai analisis</small>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
    <div class="h3"></div>
<?php endif; ?>



