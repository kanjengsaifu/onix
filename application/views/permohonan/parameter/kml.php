<div class="row">
    <div class="col-sm-2">
        <h2>ICP</h2>
        <?php
            $icp = $this->parameter_m->by_type_analisis('kmlcp');
            $icp_split = array_chunk($icp, 10);
            foreach($icp_split[0] as $param2):
            ?>
            <div>
                <input type="checkbox" name="param[]" value="<?php echo $param2->id_parameter; ?>" <?php echo set_checkbox('param[]', $param2->id_parameter); ?> onclick="refresh_harga()" id="param"> <?php echo $param2->nama; ?> <?php echo ($param2->deskripsi != '' ? '[ '.$param2->deskripsi.' ]' : ''); ?>
            </div>
        <?php endforeach; ?>
    </div>
    <div class="col-sm-2">
        <h2>&nbsp</h2>
        <?php
        foreach($icp_split[1] as $param2):
            ?>
            <div>
                <input type="checkbox" name="param[]" value="<?php echo $param2->id_parameter; ?>" <?php echo set_checkbox('param[]', $param2->id_parameter); ?> onclick="refresh_harga()" > <?php echo $param2->nama; ?> <?php echo ($param2->deskripsi != '' ? '[ '.$param2->deskripsi.' ]' : ''); ?>                </div>
            <?php endforeach; ?>
    </div>

    <div class="col-sm-2">
        <h2>AAS</h2>
        <?php
        $aas = $this->parameter_m->by_type_analisis('kmlaa');
        $aas_split = array_chunk($aas, 10);
        foreach($aas_split[0] as $param1):
            ?>
            <div>
                <input type="checkbox" name="param[]" value="<?php echo $param1->id_parameter; ?>" <?php echo set_checkbox('param[]', $param1->id_parameter); ?> onclick="refresh_harga()" > <?php echo $param1->nama; ?> <?php echo ($param1->deskripsi != '' ? '[ '.$param1->deskripsi.' ]' : ''); ?>                </div>
            <?php endforeach; ?>
    </div>
    <div class="col-sm-3">
        <h2>&nbsp</h2>
        <?php
        foreach($aas_split[1] as $param1):
            ?>
            <div>
                <input type="checkbox" name="param[]" value="<?php echo $param1->id_parameter; ?>" <?php echo set_checkbox('param[]', $param1->id_parameter); ?> onclick="refresh_harga()" > <?php echo $param1->nama; ?> <?php echo ($param1->deskripsi != '' ? '[ '.$param1->deskripsi.' ]' : ''); ?>                </div>
            <?php endforeach; ?>
    </div>

    <div class="col-sm-2">
        <h2>MP</h2>
        <?php
        $mp = $this->parameter_m->by_type_analisis('kmlmp');
        foreach($mp as $param4):
            ?>
            <div>
                <input type="checkbox" name="param[]" value="<?php echo $param4->id_parameter; ?>" <?php echo set_checkbox('param[]', $param4->id_parameter); ?> onclick="refresh_harga()" > <?php echo $param4->nama; ?> <?php echo ($param4->deskripsi != '' ? '[ '.$param4->deskripsi.' ]' : ''); ?>                </div>
            <?php endforeach; ?>
    </div>

    <div class="col-sm-12">
        <h2>KOLORIMETRI</h2>
        <?php
        $kol = $this->parameter_m->by_type_analisis('kmlkl');
        foreach($kol as $param3):
            ?>
            <div>
                <input type="checkbox" name="param[]" value="<?php echo $param3->id_parameter; ?>" <?php echo set_checkbox('param[]', $param3->id_parameter); ?> onclick="refresh_harga()" > <?php echo $param3->nama; ?> <?php echo ($param3->deskripsi != '' ? '[ '.$param3->deskripsi.' ]' : ''); ?>                </div>
            <?php endforeach; ?>
    </div>
</div>