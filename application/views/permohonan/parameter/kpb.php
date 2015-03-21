<div class="row">
    <div class="col-sm-4">
        <h2>Air</h2>
        <?php
            $kpbak = $this->parameter_m->by_type_analisis('kpbak');
            $kpbak_split = array_chunk($kpbak, 10);
            foreach($kpbak_split[0] as $param1):
                $metoda = $this->metoda_m->by_parameter($param1->id_parameter);
        ?>
                <div class="checkbox">
                    <input type="checkbox" name="param[]" <?php echo set_checkbox('param[]', $param1->id_parameter); ?> value="<?php echo $param1->id_parameter; ?>"> <?php echo nama_kimia($param1->nama); ?> <?php echo ($param1->deskripsi != '' ? '[ '.$param1->deskripsi.' ]' : ''); ?>
                    <br>
                    <select name="metoda[]" class="form-control">
                        <?php foreach($metoda as $row): ?>
                            <option value="<?php echo $param1->id_parameter.'-'.$row->id_metoda; ?>"><?php echo $row->nama; ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
        <?php endforeach; ?>
    </div>
    <div class="col-lg-4">
        <h2>&nbsp;</h2>
        <?php
        foreach($kpbak_split[1] as $param1):
            $metoda = $this->metoda_m->by_parameter($param1->id_parameter);
            ?>
            <div class="checkbox">
                <input type="checkbox" name="param[]" <?php echo set_checkbox('param[]', $param1->id_parameter); ?> value="<?php echo $param1->id_parameter; ?>"> <?php echo nama_kimia($param1->nama); ?> <?php echo ($param1->deskripsi != '' ? '[ '.$param1->deskripsi.' ]' : ''); ?>
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
        <h2>Isotop Air</h2>
        <?php
        $isotop = $this->parameter_m->by_type_analisis('kpbia');
        $isotop_split = array_chunk($isotop, 3);
        foreach($isotop_split[0] as $param2):
            $metoda = $this->metoda_m->by_parameter($param2->id_parameter);
            ?>
            <div class="checkbox">
                <input type="checkbox" name="param[]" <?php echo set_checkbox('param[]', $param2->id_parameter); ?> value="<?php echo $param2->id_parameter; ?>"> <?php echo nama_kimia($param2->nama); ?> <?php echo ($param2->deskripsi != '' ? '[ '.$param2->deskripsi.' ]' : ''); ?>
                <br>
                <select name="metoda[]" class="form-control">
                    <?php foreach($metoda as $row): ?>
                        <option value="<?php echo $param2->id_parameter.'|'.$row->id_metoda; ?>" <?php echo set_select('metoda[]', $param2->id_parameter.'|'.$row->id_metoda); ?>><?php echo $row->nama; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        <?php endforeach; ?>
    </div>
</div>
<div>
    <div class="col-sm-4">
        <h2>Tanah</h2>
        <?php
        $tanah = $this->parameter_m->by_type_analisis('kpbth');
        $tanah_split = array_chunk($tanah, 3);
        foreach($tanah_split[0] as $param4):
            $metoda = $this->metoda_m->by_parameter($param4->id_parameter);
            ?>
            <div class="checkbox">
                <input type="checkbox" name="param[]" <?php echo set_checkbox('param[]', $param4->id_parameter); ?> value="<?php echo $param4->id_parameter; ?>"> <?php echo nama_kimia($param4->nama); ?> <?php echo ($param4->deskripsi != '' ? '[ '.$param4->deskripsi.' ]' : ''); ?>
                <br>
                <select name="metoda[]" class="form-control">
                    <?php foreach($metoda as $row): ?>
                        <option value="<?php echo $param4->id_parameter.'|'.$row->id_metoda; ?>" <?php echo set_select('metoda[]', $param4->id_parameter.'|'.$row->id_metoda); ?>><?php echo $row->nama; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        <?php endforeach; ?>
    </div>

    <div class="col-sm-4">
        <h2>Udara Tanah</h2>
        <?php
        $udara = $this->parameter_m->by_type_analisis('kpbut');
        foreach($udara as $param3):
            $metoda = $this->metoda_m->by_parameter($param3->id_parameter);
            ?>
            <div class="checkbox">
                <input type="checkbox" name="param[]" <?php echo set_checkbox('param[]', $param3->id_parameter); ?> value="<?php echo $param3->id_parameter; ?>"> <?php echo nama_kimia($param3->nama); ?> <?php echo ($param3->deskripsi != '' ? '[ '.$param3->deskripsi.' ]' : ''); ?>
                <br>
                <select name="metoda[]" class="form-control">
                    <?php foreach($metoda as $row): ?>
                        <option value="<?php echo $param3->id_parameter.'|'.$row->id_metoda; ?>" <?php echo set_select('metoda[]', $param3->id_parameter.'|'.$row->id_metoda); ?>><?php echo $row->nama; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        <?php endforeach; ?>
    </div>
</div>
<div>
    <div class="col-sm-4">
        <h2>Gas</h2>
        <?php
        $gas = $this->parameter_m->by_type_analisis('kpbgs');
        $gas_split = array_chunk($gas, 11);
        foreach($gas_split[0] as $param5):
            $metoda = $this->metoda_m->by_parameter($param5->id_parameter);
            ?>
            <div class="checkbox">
                <input type="checkbox" name="param[]" <?php echo set_checkbox('param[]', $param5->id_parameter); ?> value="<?php echo $param5->id_parameter; ?>"> <?php echo nama_kimia($param5->nama); ?> <?php echo ($param5->deskripsi != '' ? '[ '.$param5->deskripsi.' ]' : ''); ?>
                <br>
                <select name="metoda[]" class="form-control">
                    <?php foreach($metoda as $row): ?>
                        <option value="<?php echo $param5->id_parameter.'|'.$row->id_metoda; ?>" <?php echo set_select('metoda[]', $param5->id_parameter.'|'.$row->id_metoda); ?>><?php echo $row->nama; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        <?php endforeach; ?>
    </div>
</div>