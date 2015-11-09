<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class PS_Controller extends CI_Controller
{
    public $is_fisika = FALSE;

    public function __construct()
    {
        parent::__construct();
        require_once(APPPATH . 'libraries/prosedur.php');

        if($this->tinyauth->logged_in())
        {
            return TRUE;
        }
        else
        {
            redirect(base_url());
        }
    }

    protected function is_fisika($id_lab)
    {
        return substr($id_lab, 0, 1) == 'f' ? TRUE : FALSE;
    }

    protected function _is_pihak_luar($id_type_pemohon)
    {
        $array_pihak_luar = array('06', 07);

        return in_array($id_type_pemohon, $array_pihak_luar);
    }
}

/**
 * Class Admin_controller
 */
class Admin_controller extends PS_Controller
{
    public function __construct()
    {
        parent::__construct();

        if(!in_array($this->session->userdata('komoditi'), ['tu', 'pw']))
        {
            redirect(base_url());
        }
    }
}

class Petugas_controller extends PS_Controller
{
    public function __construct()
    {
        parent::__construct();

        $komoditi = array(
            'bb',
            'lg',
            'nl',
            'pb'
        );

        if(!in_array($this->session->userdata('komoditi'), $komoditi))
        {
            redirect(base_url());
        }
    }
}

class Preparasi_controller extends PS_Controller
{
    public function __construct()
    {

        parent::__construct();
        $this->load->model(array('preparasi_m'));

        if(!$this->session->userdata('komoditi') == 'pp')
        {
            redirect(base_url());
        }
    }
}
