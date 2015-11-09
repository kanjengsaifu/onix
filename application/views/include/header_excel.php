<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 5/21/15
 * Time: 11:24 AM
 */

$file = date('YmdHis').'_'.$conto->nomor_conto.'_'.$type_analisis->id_type_analisis.'.xls';
header("Content-type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=$file");
?>
<table>
    <thead>
    <tr>
        <th colspan="3"><?php echo strtoupper($type_analisis->nama); ?></th>
    </tr>
    </thead>
</table>
