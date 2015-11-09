<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/22/15
 * Time: 11:19 PM
 */

    $preparasi = $this->preparasi_m->by_petugas($this->session->userdata('logged_id'));

?>
    <li class="xn-title">
        Preparasi
    </li>
    <li>
        <a href="<?php echo base_url('preparasi'); ?>"><i class="fa fa-gears"></i> <span class="xn-text">List Preparasi</span></a>
    </li>
    <li>
        <a href="<?php echo base_url('preparasi'); ?>">List Preparasi</a>
    </li>
    <li class="xn-openable active">
        <a href="#"><i class="fa fa-edit"></i> <span class="xn-text"> Preparasi Aktif</span></a>
        <ul>
            <?php foreach($preparasi as $row): ?>

                <li class="">
                    <a href="<?php echo base_url('preparasi/detail/' . $row->id); ?>"><span class="xn-text"> <?php echo $row->nomor_analisis; ?></span></a>
                </li>

            <?php endforeach; ?>
        </ul>

    </li>
