<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/25/13
 * Time: 11:06 AM
 */
class Fisika extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(array('hasil_analisis_m','type_analisis_m','parameter_m'));
        if($this->tinyauth->logged_in())
            return TRUE;
        else
            redirect(base_url());
    }

    public function detail($id_analisis)
    {
        $analisis = $this->hasil_analisis_m->get_detail_analisis($id_analisis);
        $conto = $this->hasil_analisis_m->get_proses_by_id_analisis($id_analisis);
        $cek_selesai = $this->hasil_analisis_m->cek_selesai($id_analisis);
        $jumlah_teranalisis = $this->hasil_analisis_m->get_jumlah_teranalisis($id_analisis);

        $btn_tambah = $this->hasil_analisis_m->cek_jumlah_conto($id_analisis) == FALSE ? TRUE : FALSE;

//        $qtype_analisis = $this->type_analisis_m->detail_type_analisis($type_analisis);

        $type_analisis = $this->hasil_analisis_m->pakai_type_analisis($id_analisis);


        $data = array(
            'title'         =>  strtoupper($id_analisis),
            'main_content'  =>  'analisis/fisika_v',
            'no_analisis'   =>  $id_analisis,
            'nomor_analisis'   =>  $analisis->nomor_analisis,
            'jumlah_conto'  =>  $analisis->jumlah_contoh,
            'tgl_mulai'     =>  $analisis->tanggal_terima,
            'jumlah_selesai'=>  $jumlah_teranalisis,
            'conto'         =>  $conto,
            'tambah'        =>  $btn_tambah,
            'is_selesai'    =>  $cek_selesai,
            'type_analisis' =>  $type_analisis,
            'id_lab'        => $analisis->id_lab
        );
        $this->load->view('template_input', $data);
    }

    public function tambah_conto($id_analisis)
    {
//        $this->load->library('form_validation');
//        $config = array(
//            array(
//                'field' => 'nama_batuan',
//                'label' => 'Nama Batuan',
//                'rules' => 'required|trim'
//            ),
//            array(
//                'field' => 'berat',
//                'label' => 'berat',
//                'rules' => 'required|numeric'
//            ),
//            array(
//                'field' => 'deskripsi',
//                'label' => 'Deskripsi',
//                'rules' => 'xss_clean'
//            )
//        );
//
//        $this->form_validation->set_rules($config);
//        if($this->form_validation->run() == FALSE)
//        {
//            $qtype_analisis = $this->type_analisis_m->detail_type_analisis($type_analisis);
//            $komposisi = $this->parameter_m->get_param_by_type($type_analisis);
//
//            $data = array(
//                'title'         => 'tambah conto',
//                'main_content'  => 'a_fisika/t_conto_fisika',
//                'type_analisis' => $qtype_analisis,
//                'no_analisis'   => $id_analisis,
//                'komposisi'     => $komposisi
//            );
//
//            $this->load->view('template_input', $data);
//        }
//        else
//        {
//            /*
//             * Cek jumlah dulu
//             */


            $simpan = $this->hasil_analisis_m->tambah_conto_fisika($id_analisis);
            redirect('fisika/detail/'.$id_analisis);


//        }
//
    }


}
