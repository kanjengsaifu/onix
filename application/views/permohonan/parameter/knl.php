    <div class="col-sm-4">
        <h2>Analisis Kimia</h2>
        <?php
        $kimia = $this->parameter_m->by_type_analisis('knlkm');
        $kimia_split = array_chunk($kimia,10);
        foreach($kimia_split[0] as $param1):
            $metoda = $this->metoda_m->by_parameter($param1->id_parameter);
            ?>
            <div class="checkbox">
                <input type="checkbox" name="param[]" value="<?php echo $param1->id_parameter; ?>" <?php echo set_checkbox('param[]', $param1->id_parameter); ?> onclick="refresh_harga()" id="param"> <?php echo nama_kimia($param1->nama); ?> <?php echo ($param1->deskripsi != '' ? '[ '.$param1->deskripsi.' ]' : ''); ?>
                <br>
                <select name="metoda[]" class="form-control">
                    <?php foreach($metoda as $row): ?>
                        <option value="<?php echo $param1->id_parameter.'|'.$row->id_metoda; ?>" <?php echo set_select('metoda[]', $param1->id_parameter.'|'.$row->id_metoda); ?>><?php echo $row->nama; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>

        <?php endforeach; ?>
    </div>
    <div class="col-sm-4">
        <h2>&nbsp</h2>
        <?php
        foreach($kimia_split[1] as $param1):
            $metoda = $this->metoda_m->by_parameter($param1->id_parameter);
            ?>
            <div class="checkbox">
                <input type="checkbox" name="param[]" value="<?php echo $param1->id_parameter; ?>" <?php echo set_checkbox('param[]', $param1->id_parameter); ?> onclick="refresh_harga()" id="param"> <?php echo  nama_kimia($param1->nama); ?> <?php echo ($param1->deskripsi != '' ? '[ '.$param1->deskripsi.' ]' : ''); ?>
                <br>
                <select name="metoda[]" class="form-control">
                    <?php foreach($metoda as $row): ?>
                        <option value="<?php echo $param1->id_parameter.'|'.$row->id_metoda; ?>" <?php echo set_select('metoda[]', $param1->id_parameter.'|'.$row->id_metoda); ?>><?php echo $row->nama; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        <?php endforeach; ?>
    </div>
    <div class="col-sm-4">
        <h2>&nbsp</h2>
        <?php
        foreach($kimia_split[2] as $param1):
            $metoda = $this->metoda_m->by_parameter($param1->id_parameter);
            ?>
            <div class="checkbox">
                <input type="checkbox" name="param[]" value="<?php echo $param1->id_parameter; ?>" <?php echo set_checkbox('param[]', $param1->id_parameter); ?> onclick="refresh_harga()" id="param"> <?php echo  nama_kimia($param1->nama); ?> <?php echo ($param1->deskripsi != '' ? '[ '.$param1->deskripsi.' ]' : ''); ?>
                <br>
                <select name="metoda[]" class="form-control">
                    <?php foreach($metoda as $row): ?>
                        <option value="<?php echo $param1->id_parameter.'|'.$row->id_metoda; ?>" <?php echo set_select('metoda[]', $param1->id_parameter.'|'.$row->id_metoda); ?>><?php echo $row->nama; ?></option>
                    <?php endforeach; ?>
                </select></div>
        <?php endforeach; ?>
    </div>

    <div class="col-sm-5">
        <h2>Analisis Fisika</h2>
            <?php
            $fisika = $this->parameter_m->by_type_analisis('knlfs');
            $fisika_split = array_chunk($fisika,6);
            foreach($fisika_split[0] as $param2):
                $metoda = $this->metoda_m->by_parameter($param2->id_parameter);
            ?>
           <div class="checkbox">
           <input type="checkbox" name="param[]" value="<?php echo $param2->id_parameter; ?>" <?php echo set_checkbox('param[]', $param2->id_parameter); ?> onclick="refresh_harga()" id="param"> <?php echo $param2->nama; ?> <?php echo ($param2->deskripsi != '' ? '[ '.$param2->deskripsi.' ]' : ''); ?>
               <br>
               <select name="metoda[]" class="form-control">
                   <?php foreach($metoda as $row): ?>
                       <option value="<?php echo $param2->id_parameter.'|'.$row->id_metoda; ?>" <?php echo set_select('metoda[]', $param2->id_parameter.'|'.$row->id_metoda); ?>><?php echo $row->nama; ?></option>
                   <?php endforeach; ?>
               </select>
           </div>
        <?php endforeach; ?>
    </div>

    <div class="col-sm-5">
        <h2>&nbsp</h2>
    <?php
        foreach($fisika_split[1] as $param2):
            $metoda = $this->metoda_m->by_parameter($param2->id_parameter);
    ?>
            <div class="checkbox">
                <input type="checkbox" name="param[]" value="<?php echo $param2->id_parameter; ?>" <?php echo set_checkbox('param[]', $param2->id_parameter); ?> onclick="refresh_harga()" id="param"> <?php echo $param2->nama; ?> <?php echo ($param2->deskripsi != '' ? '[ '.$param2->deskripsi.' ]' : ''); ?>
                <br>
                <select name="metoda[]" class="form-control">
                    <?php foreach($metoda as $row): ?>
                        <option value="<?php echo $param2->id_parameter.'|'.$row->id_metoda; ?>" <?php echo set_select('metoda[]', $param2->id_parameter.'|'.$row->id_metoda); ?>><?php echo $row->nama; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <?php endforeach; ?>
    </div>