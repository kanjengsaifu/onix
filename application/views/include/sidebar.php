<!-- START PAGE SIDEBAR -->
<div class="page-sidebar page-sidebar-fixed scroll">
    <!-- START X-NAVIGATION -->
    <ul class="x-navigation x-navigation-custom">
        <li class="xn-title text-center">Pusat Sumber Daya Geologi</li>
        <li class="xn-profile">
            <a href="#" class="profile-mini">
                <img src="<?php echo base_url(IMAGES.'logo.png'); ?>" alt="Psdg"/>
            </a>
            <div class="profile">
                <div class="profile-image">
                    <img src="<?php echo base_url(IMAGES.'logo.png'); ?>" alt="Psdg"/>
                </div>
                <div class="profile-data">
                    <div class="profile-data-name"><?php echo $this->session->userdata('logged_name'); ?></div>
                    <div class="profile-data-title"></div>
                </div>
                <div class="profile-controls">
                    <a href="<?php echo base_url('petugas/my_profile'); ?>" class="profile-control-left"><span class="fa fa-info"></span></a>
                    <a href="<?php echo base_url('message'); ?>" class="profile-control-right"><span class="fa fa-envelope"></span>
                        <?php
                            $inbox = $this->message_m->count_unread_by_message_to($this->session->userdata('logged_id'));
                            if( $inbox != 0):
                        ?>
                            <span class="label label-success"><?php echo $inbox; ?></span>
                        <?php endif; ?>
                    </a>
                </div>
            </div>
        </li>

        <?php

            $sidebar_menu = 'admin';

            $komoditi = array(
                'bb',
                'lg',
                'nl',
                'pb'
            );

            if(in_array($this->session->userdata('komoditi'), $komoditi))
            {
                $sidebar_menu = 'petugas';
            }
            elseif($this->session->userdata('komoditi') == 'pp')
            {
                $sidebar_menu = 'preparasi';
            }
            elseif($this->session->userdata('komoditi') == 'pw')
            {
                $sidebar_menu = 'previewer';
            }

            $this->load->view('include/sidebar_menu_' . $sidebar_menu);

        ?>

    </ul>
    <!-- END X-NAVIGATION -->
</div>
<!-- END PAGE SIDEBAR -->