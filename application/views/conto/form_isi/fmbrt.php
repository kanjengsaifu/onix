<?php if($conto->is_selesai == FALSE): ?>
    <a href="#modal-parameter" data-toggle="modal" class="btn btn-danger" id=""><div class="glyphicon glyphicon-plus"></div> Tambah Parameter</a>
        <div class="h3"></div>
<?php endif; ?>

    <table class="table">
        <thead>
        <tr>
            <th>No.</th>
            <th>Parameter</th>
            <th>Nilai</th>
            <th>Deskripsi</th>
            <th>Hapus</th>
        </tr>
        </thead>
        <tbody>
        <?php $no=1;  foreach($parameter as $param): ?>
        <tr id="<?php echo $param->id_parameter; ?>">
            <td><?php echo $no++; ?>. </td>
            <td>
                <?php echo nama_kimia($param->nama); ?>
            </td>
            <td>
                <?php if($conto->is_selesai == FALSE): ?>
                <button class="btn btn-success btn-sm" onclick="show_param('<?php echo $param->id_parameter; ?>','<?php echo $param->nama; ?>')"><i class="glyphicon glyphicon-edit"></i> nilai</button>
                <?php endif; ?>
                <input type="hidden" id="nilai_<?php echo $param->id_parameter; ?>" value="<?php echo $param->nilai; ?>">
                <div class="label label-info"><span id="t_nilai_<?php echo $param->id_parameter; ?>"><?php echo $param->nilai; ?></span></div>
            </td>
            <td>
                <?php if($conto->is_selesai == FALSE): ?>
                <button class="btn btn-success btn-sm" onclick="show_catatan('<?php echo $param->id_parameter; ?>','<?php echo $param->nama; ?>')"><i class="glyphicon glyphicon-edit"></i> catatan</button><br>
                <?php endif; ?>
                <span id="catatan_<?php echo $param->id_parameter; ?>"><?php echo $param->deskripsi; ?></span><br>
            </td>
            <td><button class="btn btn-danger btn-xs" onclick="hapus_parameter('<?php echo $param->id_parameter; ?>','<?php echo $param->nama; ?>')"><i class="glyphicon glyphicon-remove"></i> hapus</button></td>
        </tr>
            <?php endforeach; ?>
        </tbody>
    </table>