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
        <th>Kode Conto</th>
        <th>Tanggal Proses</th>
        <th>Status</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <?php $no=1; foreach($conto as $row): ?>
        <tr>
            <td><?php echo $no; ?></td>
            <td><?php echo $row->nomor_conto; ?></td>
            <td><?php echo $analisis->kode_conto.'-'.str_pad($no, 3, 0, STR_PAD_LEFT); ?></td>
            <td><?php echo tanggal_format_indonesia($row->tanggal_proses, TRUE); ?></td>
            <td><?php echo status_label($row->is_selesai); ?></td>
            <td>
                <?php if($row->is_selesai == FALSE): ?>
                    <a href="<?php echo base_url('conto/detail/'.$row->id); ?>" class="btn btn-xs"><span class="glyphicon glyphicon-pencil"></span> ANALISIS</a>
                <?php else: ?>
                    <a href="<?php echo base_url('analisis/'.$row->id); ?>" class="btn btn-info btn-xs"><span class="glyphicon glyphicon-search"></span> lihat analisis</a>
                    <button class="btn btn-link btn-xs" onclick="reproses('<?php echo $row->id; ?>','<?php echo no_conto($row->id_conto); ?>')"><span class="glyphicon glyphicon-refresh"></span> proses ulang</button>
                <?php endif; ?>
            </td>
        </tr>
        <?php $no++; endforeach; ?>
    </tbody>
</table>

<table class="table table-data-simple">
    <thead>
    <tr>
        <th>#</th>
        <th>Parameter</th>
        <th>Satuan</th>
        <th>Basis</th>
        <th>Metoda</th>
    </tr>
    </thead>
    <tbody>
    <?php $no=1; foreach($parameter_analisis as $analisis_parameter): ?>
        <tr>
            <td><?php echo $no; ?></td>
            <td><?php echo $analisis_parameter->nama; ?></td>
            <td>
                <form class="input-group input-group-sm form-update-analisis-parameter-satuan">
                    <select name="satuan[]" class="form-control">
                        <option value="null">-Pilih Satuan-</option>
                        <option <?php set_select_value('%', $analisis_parameter->satuan); ?>>%</option>
                        <option <?php set_select_value('‰', $analisis_parameter->satuan); ?>>‰</option>
                        <option <?php set_select_value('‰ mol', $analisis_parameter->satuan); ?>>% mol</option>
                        <option <?php set_select_value('umhos/cm', $analisis_parameter->satuan); ?>>umhos/cm</option>
                        <option <?php set_select_value('ppm (mg/L)', $analisis_parameter->satuan); ?>>ppm (mg/L)</option>
                        <option <?php set_select_value('ppm', $analisis_parameter->satuan); ?>>ppm</option>
                        <option <?php set_select_value('ppb', $analisis_parameter->satuan); ?>>ppb</option>
                        <option <?php set_select_value('ppt', $analisis_parameter->satuan); ?>>ppt</option>
                        <option <?php set_select_value('g/cm3', $analisis_parameter->satuan); ?>>g/cm3</option>
                        <option <?php set_select_value('meg%', $analisis_parameter->satuan); ?>>meg%</option>
                        <option <?php set_select_value('cal/gr', $analisis_parameter->satuan); ?>>cal/gr</option>
                        <option <?php set_select_value('°C', $analisis_parameter->satuan); ?>>°C</option>
                    </select>
                    <span class="input-group-btn">
                        <input type="hidden" value="<?php echo $analisis_parameter->id; ?>" name="id">
                        <button class="btn btn-warning"><i class="fa fa-edit"></i></button>
                    </span>
                </form>
                <sup class="">Satuan: <span id="satuan_<?php echo $analisis_parameter->id; ?>"><?php echo $analisis_parameter->satuan; ?></span></sup>
            </td>
            <td><?php echo $analisis_parameter->basis; ?></td>
            <td><?php echo $analisis_parameter->metoda; ?></td>
        </tr>
    <?php $no++; endforeach; ?>
    </tbody>
</table>