<div class="row">
    <div class="col-sm-6">
        <strong>Analisis Proximat  (<i>Proximate Analysis</i>)</strong>
        <?php
        $ap = $this->parameter_m->by_type_analisis('kbbap');
        foreach($ap as $param1):
            ?>
            <div class="checkbox">
                <input type="checkbox" name="param[]" value="<?php echo $param1->id_parameter; ?>" <?php echo set_checkbox('param[]', $param1->id_parameter); ?>> <?php echo $param1->nama; ?> <?php echo ($param1->deskripsi != '' ? '[ '.$param1->deskripsi.' ]' : ''); ?> %
                <select name="basis[]" class="form-control">
                    <option value="<?php echo $param1->id_parameter.'|-'; ?>">pilih basis <?php echo nama_kimia($param1->nama); ?></option>
                    <option value="<?php echo $param1->id_parameter.'|ar'; ?>" <?php echo set_select('basis[]', $param1->id_parameter.'|ar'); ?>>ar</option>
                    <option value="<?php echo $param1->id_parameter.'|adb'; ?>" <?php echo set_select('basis[]', $param1->id_parameter.'|adb'); ?>>adb</option>
                    <option value="<?php echo $param1->id_parameter.'|daf'; ?>" <?php echo set_select('basis[]', $param1->id_parameter.'|daf'); ?>>daf</option>
                    <option value="<?php echo $param1->id_parameter.'|index'; ?>" <?php echo set_select('basis[]', $param1->id_parameter.'|index'); ?>>index</option>
                </select>
            </div>
            <?php endforeach; ?>
    </div>
    <div class="col-sm-6">
        <strong>Analisis Kimia  (<i>Chemical Analysis</i>)</strong>
        <?php
        $ak = $this->parameter_m->by_type_analisis('kbbak');
        foreach($ak as $param3):
            ?>
            <div class="checkbox">
                <input type="checkbox" name="param[]" value="<?php echo $param3->id_parameter; ?>" <?php echo set_checkbox('param[]', $param3->id_parameter); ?>> <?php echo $param3->nama; ?> <?php echo ($param3->deskripsi != '' ? '[ '.$param3->deskripsi.' ]' : ''); ?> %
            </div>
            <select name="basis[]" class="form-control">
                <option value="<?php echo $param3->id_parameter.'|-'; ?>">pilih basis <?php echo nama_kimia($param3->nama); ?></option>
                <option value="<?php echo $param3->id_parameter.'|ar'; ?>" <?php echo set_select('basis[]', $param3->id_parameter.'|ar'); ?>>ar</option>
                <option value="<?php echo $param3->id_parameter.'|adb'; ?>" <?php echo set_select('basis[]', $param3->id_parameter.'|adb'); ?>>adb</option>
                <option value="<?php echo $param3->id_parameter.'|daf'; ?>" <?php echo set_select('basis[]', $param3->id_parameter.'|daf'); ?>>daf</option>
                <option value="<?php echo $param3->id_parameter.'|index'; ?>" <?php echo set_select('basis[]', $param3->id_parameter.'|index'); ?>>index</option>
            </select>
            <?php endforeach; ?>
    </div>
</div>
<div class="row">
    <div class="col-sm-6">
        <strong>Analisis Ultimat (<i>Ultimate Analysis</i>)</strong>
        <?php
        $au = $this->parameter_m->by_type_analisis('kbbau');
        foreach($au as $param2):
            ?>
            <div class="checkbox">
                <input type="checkbox" name="param[]" value="<?php echo $param2->id_parameter; ?>" <?php echo set_checkbox('param[]', $param2->id_parameter); ?>> <?php echo $param2->nama; ?> <?php echo ($param2->deskripsi != '' ? '[ '.$param2->deskripsi.' ]' : ''); ?> <?php if(($param2->id_parameter <> 'KBBAU06') AND ($param2->id_parameter <> 'KBBAU07')) echo '%'; ?>
            </div>
            <select name="basis[]" class="form-control">
                <option value="<?php echo $param2->id_parameter.'|-'; ?>">pilih basis <?php echo nama_kimia($param2->nama); ?></option>
                <option value="<?php echo $param2->id_parameter.'|ar'; ?>" <?php echo set_select('basis[]', $param2->id_parameter.'|ar'); ?>>ar</option>
                <option value="<?php echo $param2->id_parameter.'|adb'; ?>" <?php echo set_select('basis[]', $param2->id_parameter.'|adb'); ?>>adb</option>
                <option value="<?php echo $param2->id_parameter.'|daf'; ?>" <?php echo set_select('basis[]', $param2->id_parameter.'|daf'); ?>>daf</option>
                <option value="<?php echo $param2->id_parameter.'|index'; ?>" <?php echo set_select('basis[]', $param2->id_parameter.'|index'); ?>>index</option>
            </select>
            <?php endforeach; ?>
    </div>
    <div class="col-sm-6">
        <strong>Analisis Sifat Fisik (<i>Physical Proterties Analysis</i>)</strong>
        <?php
        $asf = $this->parameter_m->by_type_analisis('kbbas');
        foreach($asf as $param4):
            ?>
            <div class="checkbox">
                <input type="checkbox" name="param[]" value="<?php echo $param4->id_parameter; ?>" <?php echo set_checkbox('param[]', $param4->id_parameter); ?>> <?php echo nama_kimia($param4->nama); ?> <?php echo ($param4->deskripsi != '' ? '[ '.$param4->deskripsi.' ]' : ''); ?>
            </div>
            <select name="basis[]" class="form-control">
                <option value="<?php echo $param4->id_parameter.'|-'; ?>">pilih basis <?php echo nama_kimia($param4->nama); ?></option>
                <option value="<?php echo $param4->id_parameter.'|ar'; ?>" <?php echo set_select('basis[]', $param4->id_parameter.'|ar'); ?>>ar</option>
                <option value="<?php echo $param4->id_parameter.'|adb'; ?>" <?php echo set_select('basis[]', $param4->id_parameter.'|adb'); ?>>adb</option>
                <option value="<?php echo $param4->id_parameter.'|daf'; ?>" <?php echo set_select('basis[]', $param4->id_parameter.'|daf'); ?>>daf</option>
                <option value="<?php echo $param4->id_parameter.'|index'; ?>" <?php echo set_select('basis[]', $param4->id_parameter.'|index'); ?>>index</option>
            </select>
        <?php endforeach; ?>
    </div>
</div>