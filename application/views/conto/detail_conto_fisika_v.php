<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="#">Analisis</a></li>
    <li><a href="<?php echo base_url('analisis/detail/'. $analisis->id); ?>"><?php echo $analisis->nomor_analisis; ?></a></li>
    <li class="active">Conto Fisika | <?php echo $conto->nomor_conto; ?></li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-gears"></span> Detail Conto</h2>
</div>
<!-- END PAGE TITLE -->

<div class="row">
    <div class="col-md-4">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Conto</h3>
            </div>
            <div class="panel-body list-group">
                <div class="list-group-item">
                    <div class="">Status
                        <div class="pull-right"><?php echo status_label($conto->is_selesai); ?></div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="">Nomor Analisis
                        <div class="pull-right"><strong><?php echo $analisis->nomor_analisis; ?></strong></div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="">No Conto
                        <div class="pull-right"><strong><?php echo no_conto($conto->nomor_conto); ?></strong></div>
                    </div>
                </div>
                <div class="list-group-item">
                    <div class="">Kode Conto
                        <div class="pull-right"><strong><?php echo $conto->kode_conto; ?></strong></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-8">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Analisis Fisika</h3>
            </div>
            <div class="panel-body list-group">
            <?php
            foreach($conto_detail_fisika as $row):
                ?>
                <div class="list-group-item">
                    <strong><?php echo $row->type_analisis; ?></strong>
                    <a href="<?php echo base_url('conto/analisis/'. $conto->id .'/' . $row->id); ?>" class="btn btn-xs btn-warning pull-right" data-toggle="tooltip" data-placement="bottom" title="Analisis <?php echo $row->type_analisis; ?>"><i class="fa fa-edit"></i> Analisis</a>
                </div>
                <?php endforeach; ?>
            </div>
        </div>

        <div class="pull-right">
            <?php if($conto->is_selesai): ?>
                <form action="<?php echo base_url('conto/set_unselesai'); ?>" method="post">
                    <input type="hidden" name="id" value="<?php echo $conto->id; ?>">
                    <button class="btn btn-warning btn-xs" id="btn-ubah-conto">kembali proses</button>
                </form>
            <?php else: ?>
            <form action="<?php echo base_url('conto/set_selesai'); ?>" method="post">
                <input type="hidden" name="id" value="<?php echo $conto->id; ?>">
                <button class="btn btn-success btn-xs" id="btn-selesai-conto">selesai</button>
            </form>
            <?php endif; ?>
        </div>
    </div>
</div>