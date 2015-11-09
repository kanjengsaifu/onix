<div class="row">
    <div class="col-sm-3">
        <h2>ICP</h2>
        <?php
            $icp = $this->parameter_m->by_type_analisis('kmlcp');
            foreach($icp as $param2):
            ?>
            <div>
                <input type="checkbox" class="icheckbox"  class="icheckbox" name="param[]" value="<?php echo $param2->id_parameter; ?>" <?php echo set_checkbox('param[]', $param2->id_parameter); ?>> <?php echo $param2->nama; ?> <?php echo ($param2->deskripsi != '' ? '[ '.$param2->deskripsi.' ]' : ''); ?>
            </div>
        <?php endforeach; ?>
    </div>

    <div class="col-sm-3">
        <h2>AAS</h2>
        <?php
        $aas = $this->parameter_m->by_type_analisis('kmlaa');
        foreach($aas as $param1):
            ?>
            <div>
                <input type="checkbox" class="icheckbox"  name="param[]" value="<?php echo $param1->id_parameter; ?>" <?php echo set_checkbox('param[]', $param1->id_parameter); ?>> <?php echo $param1->nama; ?> <?php echo ($param1->deskripsi != '' ? '[ '.$param1->deskripsi.' ]' : ''); ?>
            </div>
            <?php endforeach; ?>

        <h2>AU</h2>
        <?php
        $au = $this->parameter_m->by_type_analisis('kmlau');
        foreach($au as $param5):
            ?>
            <div>
                <input type="checkbox" class="icheckbox"  name="param[]" value="<?php echo $param5->id_parameter; ?>" <?php echo set_checkbox('param[]', $param5->id_parameter); ?>> <?php echo $param5->nama; ?> <?php echo ($param5->deskripsi != '' ? '[ '.$param5->deskripsi.' ]' : ''); ?>
            </div>
        <?php endforeach; ?>
    </div>

    <div class="col-sm-3">
        <h2>MP</h2>
        <?php
        $mp = $this->parameter_m->by_type_analisis('kmlmp');
        foreach($mp as $param4):
            ?>
            <div>
                <input type="checkbox" class="icheckbox"  name="param[]" value="<?php echo $param4->id_parameter; ?>" <?php echo set_checkbox('param[]', $param4->id_parameter); ?>> <?php echo $param4->nama; ?> <?php echo ($param4->deskripsi != '' ? '[ '.$param4->deskripsi.' ]' : ''); ?>
            </div>
            <?php endforeach; ?>
    </div>

    <div class="col-sm-3">
        <h2>KOLORIMETRI</h2>
        <?php
        $kol = $this->parameter_m->by_type_analisis('kmlkl');
        foreach($kol as $param3):
            ?>
            <div>
                <input type="checkbox" class="icheckbox"  name="param[]" value="<?php echo $param3->id_parameter; ?>" <?php echo set_checkbox('param[]', $param3->id_parameter); ?>  > <?php echo $param3->nama; ?> <?php echo ($param3->deskripsi != '' ? '[ '.$param3->deskripsi.' ]' : ''); ?>
            </div>
            <?php endforeach; ?>
    </div>
</div>