<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class PS_Controller extends CI_Controller
{

    public $is_fisika = FALSE;

    public function __construct()
    {
        parent::__construct();

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
