<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 11/23/13
 * Time: 10:21 AM
 */

flashdata();

?>
<h3>Parameter <?php echo $parameter->nama; ?></h3>
<a href="<?php echo base_url('type_analisis/detail/' . $type_analisis->id_type_analisis); ?>" class="btn btn-primary"><i class="fa fa-chevron-left"></i> Kembali</a>
<hr>
<div class="row">
    <div class="col-xs-6">
        <form method="post" action="<?php echo base_url('parameter/update_metoda'); ?>" class="form-center">
            <div class="form-group">
                <label for="harga">Metoda</label>
                <br>
                <?php
                foreach($metoda as $row):
                    $check = '';
                    if(in_array($row->id_metoda, $parameter->metoda_parameter_array))
                        $check = 'CHECKED';
                    ?>
                    <input type="checkbox" name="metoda[]" value="<?php echo $row->id_metoda; ?>" <?php echo $check; ?>> <?php echo $row->nama; ?><br>
                <?php endforeach; ?>
            </div>
            <input type="hidden" name="id_parameter" value="<?php echo $parameter->id_parameter; ?>">
            <button class="btn btn-warning">Update Metoda</button>
        </form>
    </div>
    <div class="col-xs-6">
        <form method="post" action="<?php echo base_url('parameter/update_harga'); ?>" class="form-center">
            <div class="form-group">
                <label for="harga">Harga</label>
                <div class="input-group">
                    <span class="input-group-addon">Rp.</span>
                    <input type="text" name="harga" value="<?php echo $parameter->harga; ?>" class="form-control" id="harga">
                </div>
            </div>
            <input type="hidden" name="id_parameter" value="<?php echo $parameter->id_parameter; ?>">
            <button class="btn btn-warning">Update Harga</button>
        </form>
    </div>
</div>
