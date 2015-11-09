<div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <h2 >Type Analisis</h2>
        <?php foreach($type_analisis as $row_type_analisis): ?>
            <div>
                <input type="checkbox" value="<?php echo $row_type_analisis->id; ?>" <?php echo set_checkbox('param[]', $row_type_analisis->id); ?> name="param[]"> <?php echo $row_type_analisis->nama; ?>
            </div>
        <?php endforeach; ?>
    </div>
    <div class="col-md-4"></div>
</div>
