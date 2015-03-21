<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/1/13
 * Time: 7:57 AM
 */
class Cetak extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->library('fpdf');
        $this->load->model(array('parameter_m','hasil_analisis_m','type_analisis_,m'));
        if($this->tinyauth->logged_in())
            return TRUE;
        else
            redirect(base_url());
    }

    public function index()
    {

    }

    public function kimia($no_analisis)
    {

    }

    public function petrografi_batuan()
    {

    }

    public function analisa_butir($no_analisis)
    {

    }



}
