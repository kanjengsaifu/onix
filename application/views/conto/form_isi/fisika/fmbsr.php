<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/26/15
 * Time: 3:35 PM
 * Analisis SRA Source Rock Analyzer
 */

?>

<table class="table">
    <thead>
    <tr>
        <th>S1 (mg/g)</th>
        <th>S2 (mg/g)</th>
        <th>S3 (mg/g)</th>
        <th>TOC (%)</th>
        <th>T max (<sup>o</sup>C)</th>
        <th>HI</th>
        <th>OI</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><input type="text" name="s1" class="form-control" value="<?php echo !$is_empty_nilai ? $nilai['s1'] : 0; ?>"></td>
        <td><input type="text" name="s2" class="form-control" value="<?php echo !$is_empty_nilai ? $nilai['s2'] : 0; ?>"></td>
        <td><input type="text" name="s3" class="form-control" value="<?php echo !$is_empty_nilai ? $nilai['s3'] : 0; ?>"></td>
        <td><input type="text" name="toc" class="form-control" value="<?php echo !$is_empty_nilai ? $nilai['toc'] : 0; ?>"></td>
        <td><input type="text" name="tmax" class="form-control" value="<?php echo !$is_empty_nilai ? $nilai['tmax'] : 0; ?>"></td>
        <td><input type="text" name="hi" class="form-control" value="<?php echo !$is_empty_nilai ? $nilai['hi'] : 0; ?>"></td>
        <td><input type="text" name="oi" class="form-control" value="<?php echo !$is_empty_nilai ? $nilai['oi'] : 0; ?>"></td>
    </tr>
    </tbody>
</table>