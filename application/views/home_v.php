        <div class="row">
            <div class="col-lg-6">
                <div id="carousel-example-generic" class="carousel slide">

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="<?php echo base_url(IMAGES.'slider/dalam-lab.jpg'); ?>">
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="<?php echo base_url(IMAGES.'slider/gedungb.png'); ?>" >
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                    <img src="<?php echo base_url(IMAGES.'slider/binocular.png'); ?>">
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="<?php echo base_url(IMAGES.'slider/kimia4.jpg'); ?>" >
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="<?php echo base_url(IMAGES.'slider/kimia8.jpg'); ?>" >
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="<?php echo base_url(IMAGES.'slider/kimia9.jpg'); ?>" >
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="<?php echo base_url(IMAGES.'slider/organik.jpg'); ?>" >
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="<?php echo base_url(IMAGES.'slider/rock.jpg'); ?>" >
                        <div class="carousel-caption">
                        </div>
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                    <span class="icon-prev"></span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                    <span class="icon-next"></span>
                </a>
            </div>
            </div>
            <div class="col-lg-6">
                <div class="jumbotron">
                    <h3 class="text-center home-text"> “Menjadi Institusi Yang Handal Dalam Pengungkapan Potensi Sumber Daya Geologi Untuk Peningkatan Investasi Sektor ESDM Guna Menunjang Percepatan Pembangunan Nasional”</h3>
                    <?php if(!$this->tinyauth->logged_in()): ?>
                        <a href="<?php echo base_url('login'); ?>" class="btn btn-success btn-lg btn-block">Login <i class="glyphicon glyphicon-log-in"></i> </a>
                    <?php endif; ?>
                </div>

            </div>
        </div>



