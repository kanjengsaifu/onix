<!--    <div id="top-image">-->
<!--        <div id="logo-container" class="container">-->
<!--            <a href="--><?php //echo base_url(); ?><!--"><img class="logo" src="--><?php //echo base_url(IMAGES.'logo.png'); ?><!--"></a>-->
<!--            <div class="brand"><b>BADAN GEOLOGI</b></div>-->
<!--            <div class="brand-lt"><b>PUSAT SUMBER DAYA GEOLOGI</b></div>-->
<!--        </div>-->
<!--    </div>-->
    <?php if($this->tinyauth->logged_in()): ?>
    <div id="nav-wrapper">
        <div class="navbar navbar-static-top navbar-inverse" id="nav">
            <div class="container">
                <ul class="nav navbar-nav">
                    <?php if($this->tinyauth->is_admin() OR $this->tinyauth->is_kepala()): ?>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Permohonan <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="<?php echo base_url('permohonan'); ?>">List Permohonan</a></li>
                            <?php if($this->tinyauth->is_admin()): ?>
                            <li class="divider"></li>
                            <li class="dropdown-header">Daftar Baru Permohonan</li>
                            <li><a href="<?php echo base_url('permohonan/daftar/kml'); ?>">Form Tugas Analisis Kimia Logam</a></li>
                            <li><a href="<?php echo base_url('permohonan/daftar/knl'); ?>">Form Tugas Analisis Kimia Bukan Logam</a></li>
                            <li><a href="<?php echo base_url('permohonan/daftar/kpb'); ?>">Form Tugas Analisis Panas Bumi</a></li>
                            <li><a href="<?php echo base_url('permohonan/daftar/kbb'); ?>">Form Tugas Analisis Kimia Batubara & Material Organik</a></li>
                            <li><a href="<?php echo base_url('permohonan/daftar/kgb'); ?>">Form Tugas Analisis Kimia Gambut</a></li>
                            <li><a href="<?php echo base_url('permohonan/daftar/fmb'); ?>">Form Tugas Analisis Fisika Mineral & Batubara</a></li>
                            <?php endif; ?>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pemohon <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="<?php echo base_url('pemohon'); ?>">List Pemohon</a></li>
                            <?php if($this->tinyauth->is_admin()): ?>
                            <li class="divider"></li>
                            <li><a href="<?php echo base_url('pemohon/daftar'); ?>">Tambah Pemohon</a></li>
                            <?php endif; ?>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Petugas Analisis <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="<?php echo base_url('petugas'); ?>">List Petugas Analisis</a></li>
                            <?php if($this->tinyauth->is_admin()): ?>
                            <li class="divider"></li>
                            <li><a href="<?php echo base_url('petugas/daftar'); ?>">Tambah Petugas Analisis</a></li>
                            <?php endif; ?>
                        </ul>
                    </li>
                    <li>
                        <a href="<?php echo base_url('type_analisis'); ?>">Type Analisis</b></a>
                    </li>
                    <?php elseif($this->session->userdata('user_type') == '1'): ?>
                    <li class="dropdown">
                        <a href="<?php echo base_url('permohonan'); ?>">Permohonan</a>
                    </li>
                    <?php endif ?>
                    <?php if($this->session->userdata('user_type') == '2' && !$this->tinyauth->is_admin()&& !$this->tinyauth->is_kepala()): ?>
                    <li>
                        <a href="<?php echo base_url('analisis'); ?>">Analisis</a>
                    </li>
                    <?php endif; ?>
                </ul>
                <ul class="nav navbar-nav pull-right">
                    <?php if(!$this->tinyauth->is_admin() && !$this->tinyauth->is_kepala()): ?>
                    <li>
<!--                        <a href="ymsgr:SendIM?tu_psdg">-->
<!--                            <img border=0 src="http://opi.yahoo.com/online?u=tu_psdg&m=g&t=1">-->
<!--                        </a>-->
                    </li>
                    <?php endif; ?>
                    <li><a href="#">Selamat Datang!, <?php echo nama_login(); ?></a></li>
                    <li><a href="<?php echo base_url('home/logout'); ?>">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
<?php endif; ?>
