<div class="row">
    <?php foreach($type_analisis as $row_type_analisis): ?>
        <div class="col-md-3">
            <h2><?php echo $row_type_analisis->nama; ?></h2>
            <input type="checkbox" class="parameter-checkall" value="<?php echo $row_type_analisis->id; ?>" autocomplete="off"> Pilih Semua
            <?php foreach($row_type_analisis->parameter as $parameter): ?>
                <div class="parameter-item" data-type="<?php echo $row_type_analisis->id; ?>" >
                    <input class="parameter-checkbox-<?php echo $row_type_analisis->id; ?>" type="checkbox" name="param[]" value="<?php echo $parameter->id; ?>" <?php echo set_checkbox('param[]', $parameter->id); ?>> <?php echo $parameter->nama_parameter; ?>
                </div>
            <?php endforeach; ?>
        </div>
    <?php endforeach; ?>
</div>
