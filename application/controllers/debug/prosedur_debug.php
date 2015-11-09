<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Prosedur_debug extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        require_once(APPPATH . 'libraries/prosedur.php');
    }

    public function index()
    {
        $jumlah_conto = 50;
        $array_prosedur = [4, 5];

        $estimasi = new Estimasi([$array_prosedur, $jumlah_conto]);
        dump($estimasi->time());
        dump($estimasi->toString());

    }
}
