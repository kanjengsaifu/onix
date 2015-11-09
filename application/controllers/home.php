<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/18/13
 * Time: 2:55 AM
 */
class Home extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        if($this->tinyauth->logged_in())
        {
            $this->tinyauth->redirect_page();
        }

        $data = array(
            'title'             => 'Laboratorium Pusat Sumber Daya Geologi',
            'main_content'      => 'home_v'
        );

        $this->load->view('home_v', $data);
    }

    public function search()
    {
        $this->load->model(['analisis_m', 'lokasi_m', 'pemohon_m', 'analisis_tracking_m', 'reference_m', 'lab_m']);
        $nomor_analisis = $_GET['search_analisis'];
        $estimasi_selesai = '';
        $tanggal_estimasi_selesai = '';

        $analisis = $this->analisis_m->find_by_nomor_analisis($nomor_analisis);
        if(!$analisis)
        {
            $analisis = FALSE;
        }
        else
        {
            $analisis->nama_lokasi = $this->lokasi_m->detail_by_kabupaten($analisis->lokasi, TRUE);
            $analisis->pemohon = $this->pemohon_m->find($analisis->id_pemohon);
            $last_track = $this->analisis_tracking_m->find($analisis->id_analisis_tracking);
            $analisis->kegiatan = $this->reference_m->find_by_table_id('kegiatan', $last_track->id_kegiatan);
            $laboratorium = $this->lab_m->find($analisis->id_lab);
            $analisis->laboratorium = $laboratorium->nama;
            $estimasi_selesai = ceil($analisis->estimasi_time/ (60 * 60 * 24));
            $tanggal_estimasi_selesai = strtotime($analisis->created_date. ' +'.$estimasi_selesai.' days');
            $tanggal_estimasi_selesai = date('Y-m-d', $tanggal_estimasi_selesai);
        }

        $data = [
            'title'             => 'Cari Permohonan',
            'main_content'      => 'search_v',
            'permohonan'        => $analisis,
            'nomor_analisis'    => $nomor_analisis,
            'estimasi_selesai'  => $estimasi_selesai,
            'tanggal_estimasi_selesai' => $tanggal_estimasi_selesai
        ];

        $this->load->view('search_v', $data);
    }

    public function logout()
    {
        $this->tinyauth->logout();
    }

}
