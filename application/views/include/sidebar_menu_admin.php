<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/22/15
 * Time: 11:19 PM
 */

?>

<li class="xn-openable">
    <a href="#"><i class="fa fa-edit"></i> <span class="xn-text">Permohonan</span></a>
    <ul>
        <li><a href="<?php echo base_url('permohonan'); ?>">List Permohonan</a></li>
        <li><a href="<?php echo base_url('permohonan/search'); ?>">Pencarian</a></li>
        <li class="xn-title">Form Tugas Analisis</li>
        <li><a href="<?php echo base_url('permohonan/daftar/kml'); ?>">Kimia Logam</a></li>
        <li><a href="<?php echo base_url('permohonan/daftar/knl'); ?>">Kimia Bukan Logam</a></li>
        <li><a href="<?php echo base_url('permohonan/daftar/kpb'); ?>">Panas Bumi</a></li>
        <li><a href="<?php echo base_url('permohonan/daftar/kbb'); ?>">Kimia Batubara & Material Organik</a></li>
        <li><a href="<?php echo base_url('permohonan/daftar/kgb'); ?>">Kimia Gambut</a></li>
        <li><a href="<?php echo base_url('permohonan/daftar/fmb'); ?>">Fisika Mineral & Batubara</a></li>
    </ul>
</li>
<li class="xn-openable <?php set_active_class($this->uri->segment(1), 'pemohon'); ?>">
    <a href="#"><i class="fa fa-users"></i> <span class="xn-text"> Pemohon</span></a>
    <ul>
        <li><a href="<?php echo base_url('pemohon'); ?>">List Pemohon</a></li>
        <li class="divider"></li>
        <li><a href="<?php echo base_url('pemohon/create'); ?>">Tambah Pemohon</a></li>
    </ul>

</li>
<li class="xn-openable <?php set_active_class($this->uri->segment(1), 'petugas'); ?>">
    <a href="#"><i class="fa fa-user"></i> <span class="xn-text">Petugas</span></a>
    <ul>
        <li><a href="<?php echo base_url('petugas'); ?>">List Petugas</a></li>
        <li class="divider"></li>
        <li><a href="<?php echo base_url('petugas/create'); ?>">Tambah Petugas</a></li>
    </ul>
</li>
<li class="<?php set_active_class($this->uri->segment(1), 'type_analisis'); ?>">
    <a href="<?php echo base_url('type_analisis'); ?>"><i class="fa fa-flask"></i> <span class="xn-text"> Tipe Analisis</span></a>
</li>
<li class="<?php set_active_class($this->uri->segment(1), 'parameter'); ?>">
    <a href="<?php echo base_url('parameter'); ?>"><i class="fa fa-flask"></i> <span class="xn-text"> Parameter</span></a>
</li>
<li class="<?php set_active_class($this->uri->segment(1), 'metoda'); ?>">
    <a href="<?php echo base_url('metoda'); ?>"><i class="fa fa-fire"></i> <span class="xn-text"> Metoda</span></a>
</li>
<li class="<?php set_active_class($this->uri->segment(1), 'lokasi'); ?>">
    <a href="<?php echo base_url('lokasi'); ?>"><i class="fa fa-location-arrow"></i> <span class="xn-text"> Lokasi</span></a>
</li>
<li class="<?php set_active_class($this->uri->segment(1), 'reference'); ?>">
    <a href="<?php echo base_url('reference'); ?>"><i class="fa fa-leaf"></i> <span class="xn-text"> Reference</span></a>
</li>
<!--<li class="--><?php //set_active_class($this->uri->segment(1), 'pengaturan'); ?><!--">-->
<!--    <a href="--><?php //echo base_url('pengaturan'); ?><!--"><i class="fa fa-gear"></i> <span class="xn-text"> Pengaturan</span></a>-->
<!--</li>-->