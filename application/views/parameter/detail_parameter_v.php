<?php
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 11/23/13
 * Time: 10:21 AM
 */
?>
<!-- START BREADCRUMB -->
<ul class="breadcrumb">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('parameter'); ?>">Parameter</a></li>
    <li class="active"><?php echo $parameter->nama; ?></li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
    <h2><span class="fa fa-flask"></span> Parameter <?php echo $parameter->nama; ?></h2>
</div>
<!-- END PAGE TITLE -->

<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-body">
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
                <form method="post" action="<?php echo base_url('parameter/update_metoda'); ?>">
                    <label for="harga">Metoda</label>
                    <div class="form-group">
                    <div class="row">
                        <?php
                            $i = 1;
                            foreach($metoda as $row):
                            $check = '';
                            if(in_array($row->id_metoda, $parameter->metoda_parameter_array))
                            {
                                $check = 'CHECKED';
                            }
                            ?>
                            <?php echo !($i % 4) == 0 ? "<div class='col-md-3'>" : ""; ?>
                            <input type="checkbox" name="metoda[]" value="<?php echo $row->id_metoda; ?>" <?php echo $check; ?>> <?php echo $row->nama; ?><br>
                            <?php echo !($i % 4) == 0 ? "</div>" : ""; $i++ ?>
                        <?php endforeach; ?>
                    </div>
                    <input type="hidden" name="id_parameter" value="<?php echo $parameter->id; ?>">
                    <button class="btn btn-warning">Update Metoda</button>
                </form>
            </div>
        </div>
    </div>
</div>


