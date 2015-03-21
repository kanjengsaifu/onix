<!-- START PAGE SIDEBAR -->
<div class="page-sidebar page-sidebar-fixed scroll">
    <!-- START X-NAVIGATION -->
    <ul class="x-navigation x-navigation-custom">
        <li class="xn-title text-center">Pusat Sumber Daya Geologi</li>
        <li class="xn-profile">
            <a href="#" class="profile-mini">
                <img src="<?php echo base_url(IMAGES.'user/avatar.jpg'); ?>" alt="John Doe"/>
            </a>
            <div class="profile">
                <div class="profile-image">
                    <img src="<?php echo base_url(IMAGES.'user/avatar.jpg'); ?>" alt="John Doe"/>
                </div>
                <div class="profile-data">
                    <div class="profile-data-name"><?php echo $this->session->userdata('logged_name'); ?></div>
                    <div class="profile-data-title"></div>
                </div>
                <div class="profile-controls">
                    <a href="pages-profile.html" class="profile-control-left"><span class="fa fa-info"></span></a>
                    <a href="pages-messages.html" class="profile-control-right"><span class="fa fa-envelope"></span></a>
                </div>
            </div>
        </li>
        <li class="xn-openable <?php echo $this->uri->segment(1) == 'permohonan' ? ' active' : ''; ?>">
            <a href="#"><i class="fa fa-list"></i> <span class="xn-text">Permohonan</span></a>
            <ul>
                <li><a href="<?php echo base_url('permohonan'); ?>">List Permohonan</a></li>
                <li class="xn-title">Form Tugas Analisis</li>
                <li><a href="<?php echo base_url('permohonan/daftar/kml'); ?>">Kimia Logam</a></li>
                <li><a href="<?php echo base_url('permohonan/daftar/knl'); ?>">Kimia Bukan Logam</a></li>
                <li><a href="<?php echo base_url('permohonan/daftar/kpb'); ?>">Panas Bumi</a></li>
                <li><a href="<?php echo base_url('permohonan/daftar/kbb'); ?>">Kimia Batubara & Material Organik</a></li>
                <li><a href="<?php echo base_url('permohonan/daftar/kgb'); ?>">Kimia Gambut</a></li>
                <li><a href="<?php echo base_url('permohonan/daftar/fmb'); ?>">Fisika Mineral & Batubara</a></li>
            </ul>
        </li>
        <li class="xn-openable">
            <a href="#"><i class="fa fa-user"></i> <span class="xn-text"> Pemohon</span></a>
            <ul>
                <li><a href="<?php echo base_url('pemohon'); ?>">List Pemohon</a></li>
                <li class="divider"></li>
                <li><a href="<?php echo base_url('pemohon/daftar'); ?>">Tambah Pemohon</a></li>
            </ul>

        </li>
        <li class="xn-openable">
            <a href="#"><i class="fa fa-user-md"></i> <span class="xn-text">Petugas Analisis</span></a>
            <ul>
                <li><a href="<?php echo base_url('petugas'); ?>">List Petugas Analisis</a></li>
                <li class="divider"></li>
                <li><a href="<?php echo base_url('petugas/daftar'); ?>">Tambah Petugas Analisis</a></li>
            </ul>
        </li>
        <li>
            <a href="<?php echo base_url('type_analisis'); ?>"><i class="fa fa-flask"></i> <span class="xn-text"> Type Analisis</span></a>
        </li>
    </ul>
    <!-- END X-NAVIGATION -->
</div>
<!-- END PAGE SIDEBAR -->