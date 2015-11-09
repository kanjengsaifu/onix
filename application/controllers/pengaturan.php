<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Pengaturan extends Petugas_controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(['reference_m']);
    }

    public function komposisi_mineral_fmbab()
    {
        $template = $this->reference_m->find('template', 'komposisi_mineral_fmbab');

        echo $template->json;
    }

    public function komposisi_mineral_fmbma()
    {
        $template = $this->reference_m->find('template', 'komposisi_mineral_fmbma');

        echo $template->json;
    }
}
