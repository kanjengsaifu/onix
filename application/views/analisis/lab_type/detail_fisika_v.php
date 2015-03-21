<a href="<?php echo base_url('analisis/lab/'.$analisis->id_lab); ?>" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-chevron-left"></span> Kembali</a>
<br>
<br>
<div class="row">
    <div class="col-sm-3">
        <div class="alert alert-info"><div class="info-data"><?php echo $analisis->nomor_analisis; ?></div><span class="glyphicon glyphicon-list info-icon"></span> Nomor Analisis</div>
        <input type="hidden" id="id_analisis" value="<?php echo $analisis->id; ?>">
    </div>
    <div class="col-sm-2">
        <div class="alert alert-info"><div class="info-data"><?php echo $analisis->jumlah_conto; ?></div>Jumlah Conto</div>
    </div>
    <div class="col-sm-2">
        <div class="alert alert-info"><div class="info-data"><?php echo $count_conto_selesai; ?> conto</div>Jumlah Teranalisis</div>
    </div>
    <div class="col-sm-3">
        <div class="alert alert-info"><div class="info-data"><?php echo $analisis->jenis_conto; ?></div>Jenis Conto</div>
    </div>
    <div class="col-sm-2">
        <?php echo status_infobox($analisis->is_selesai); ?>
    </div>
</div>

<div class="row">
    <div class="col-xs-4">
        <table class="table table-data-simple">
            <thead>
            <tr>
                <th>#</th>
                <th>Metoda Analisis</th>
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
    <div class="col-xs-8">
        <?php if($button_tambah_conto): ?>
            <form action="<?php echo base_url('conto/insert'); ?>" class="pull-left" method="post">
                <button class="btn btn-primary" name="id" value="<?php echo $analisis->id; ?>"><i class="glyphicon glyphicon-plus"></i> Tambah Conto</button>
            </form>
        <?php endif; ?>

        <a href="<?php echo base_url('analisis/listing/' . $analisis->id); ?>" class="btn btn-info pull-right"><span class="glyphicon glyphicon-search"></span> Preview</a>

        <div class="h3"></div>

        <table class="table table-data">
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
                        <button class="btn btn-danger btn-xs" onclick="reproses('<?php echo $row->id; ?>','<?php echo no_conto($row->id); ?>')"><span class="glyphicon glyphicon-refresh"></span> proses ulang</button>
                    </td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>


