<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/22/15
 * Time: 11:19 PM
 */

    $lab = $this->lab_m->by_komoditi($this->session->userdata('komoditi'));

?>
    <li class="xn-title">
        Laboratorium
    </li>

<?php foreach($lab as $row):?>

    <li class="">
        <a href="<?php echo base_url('analisis/lab/' . $row->id_lab); ?>"><span class="xn-text"> <?php echo $row->nama; ?></span></a>
    </li>

<?php endforeach; ?>

