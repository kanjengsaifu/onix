<div class="row">
    <div class="col-sm-6">
        <h2>Analisis Gambut</h2>
        <?php
        $kimia = $this->parameter_m->by_type_analisis('kmkgb');
        $kimia_split = array_chunk($kimia,5);
        foreach($kimia_split[0] as $param1):
            ?>
            <div class="check">
                <input type="checkbox" class="icheckbox" name="param[]" value="<?php echo $param1->id_parameter; ?>" <?php echo set_checkbox('param[]', $param1->id_parameter); ?> id="param"> <?php echo nama_kimia($param1->nama); ?> <?php echo ($param1->deskripsi != '' ? '[ '.$param1->deskripsi.' ]' : ''); ?>
            </div>
        <?php endforeach; ?>
    </div>
    <div class="col-sm-6">
        <h2>&nbsp</h2>
        <?php
        foreach($kimia_split[1] as $param1):
            ?>
            <div class="check">
                <input type="checkbox" class="icheckbox" name="param[]" value="<?php echo $param1->id_parameter; ?>" <?php echo set_checkbox('param[]', $param1->id_parameter); ?> id="param"> <?php echo  nama_kimia($param1->nama); ?> <?php echo ($param1->deskripsi != '' ? '[ '.$param1->deskripsi.' ]' : ''); ?>
            </div>
        <?php endforeach; ?>
    </div>
</div>