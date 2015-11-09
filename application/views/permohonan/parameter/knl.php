<h2>Analisis Kimia</h2>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-4">
        <?php
        $kimia = $this->parameter_m->by_type_analisis('knlkm');
        $kimia_split = array_chunk($kimia,10);
        foreach($kimia_split[0] as $param1):
            $metoda = $this->metoda_m->by_parameter($param1->id_parameter);
            ?>
            <div class="check">
                <input type="checkbox" class="icheckbox" name="param[]" value="<?php echo $param1->id_parameter; ?>" <?php echo set_checkbox('param[]', $param1->id_parameter); ?> onclick="refresh_harga()" id="param"> <?php echo nama_kimia($param1->nama); ?> <?php echo ($param1->deskripsi != '' ? '[ '.$param1->deskripsi.' ]' : ''); ?>
            </div>
        <?php endforeach; ?>
    </div>
    <div class="col-md-4">
        <?php
        foreach($kimia_split[1] as $param1):
            $metoda = $this->metoda_m->by_parameter($param1->id_parameter);
            ?>
                <div class="check">
                    <input type="checkbox" class="icheckbox" name="param[]" value="<?php echo $param1->id_parameter; ?>" <?php echo set_checkbox('param[]', $param1->id_parameter); ?> onclick="refresh_harga()" id="param"> <?php echo  nama_kimia($param1->nama); ?> <?php echo ($param1->deskripsi != '' ? '[ '.$param1->deskripsi.' ]' : ''); ?>
                </div>
            <?php endforeach; ?>
    </div>
    <div class="col-md-4">
        <?php
            foreach($kimia_split[2] as $param1):
            $metoda = $this->metoda_m->by_parameter($param1->id_parameter);
            ?>
                <div class="check">
                    <input type="checkbox" class="icheckbox" name="param[]" value="<?php echo $param1->id_parameter; ?>" <?php echo set_checkbox('param[]', $param1->id_parameter); ?> onclick="refresh_harga()" id="param"> <?php echo  nama_kimia($param1->nama); ?> <?php echo ($param1->deskripsi != '' ? '[ '.$param1->deskripsi.' ]' : ''); ?>
                </div>
            <?php endforeach; ?>
    </div>
</div>

<div class="h3"></div>

<h2>Analisis Fisika</h2>
<div class="clearfix"></div>
<div class="row">
    <div class="col-sm-6">
            <?php
            $fisika = $this->parameter_m->by_type_analisis('knlfs');
            $fisika_split = array_chunk($fisika,6);
            foreach($fisika_split[0] as $param2):
                $metoda = $this->metoda_m->by_parameter($param2->id_parameter);
            ?>
        <div class="check">
           <input type="checkbox" class="icheckbox" name="param[]" value="<?php echo $param2->id_parameter; ?>" <?php echo set_checkbox('param[]', $param2->id_parameter); ?> onclick="refresh_harga()" id="param"> <?php echo $param2->nama; ?> <?php echo ($param2->deskripsi != '' ? '[ '.$param2->deskripsi.' ]' : ''); ?>
        </div>
            <?php endforeach; ?>
    </div>

    <div class="col-sm-6">
    <?php
        foreach($fisika_split[1] as $param2):
            $metoda = $this->metoda_m->by_parameter($param2->id_parameter);
    ?>
        <div class="check">
            <input type="checkbox" class="icheckbox" name="param[]" value="<?php echo $param2->id_parameter; ?>" <?php echo set_checkbox('param[]', $param2->id_parameter); ?> onclick="refresh_harga()" id="param"> <?php echo $param2->nama; ?> <?php echo ($param2->deskripsi != '' ? '[ '.$param2->deskripsi.' ]' : ''); ?>
        </div>
        <?php endforeach; ?>
    </div>
</div>