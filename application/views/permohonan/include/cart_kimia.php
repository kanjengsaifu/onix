<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 4/17/15
 * Time: 1:53 PM
 */

?>
<div class="panel-body">
    <div class="row">
        <div class="col-md-1"><?php echo $no; ?></div>
        <div class="col-md-5"><?php echo $row['nama']; ?> <?php echo !empty($row['type_analisis']) ? "(".$row['type_analisis'].")" : '' ?></div>
        <div class="col-md-6"> <div class="input-group">
                <span class="input-group-addon">Rp.</span>
                <input type="text" class="form-control" id="harga_parameter_<?php echo $row['id_type_analisis_parameter']; ?>" name="harga[]" value="<?php echo $row['harga_after']; ?>">
                <span class="input-group-btn">
                    <button class="btn btn-warning btn-update-harga-parameter" data-id="<?php echo $row['id_type_analisis_parameter']; ?>" data-rowid="<?php echo $key; ?>"><i class="fa fa-edit"></i></button>
                </span>
            </div>
            <button class="btn btn-xs btn-reset-harga-parameter" data-id="<?php echo $row['id_type_analisis_parameter']; ?>" data-rowid="<?php echo $key; ?>"><i class="fa fa-refresh"></i> reset harga ke <?php echo format_rupiah($row['harga']); ?></button>

        </div>
    </div>
</div>