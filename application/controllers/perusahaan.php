<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/22/13
 * Time: 8:46 AM
 */
class Perusahaan extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(array('perusahaan_m'));
    }

    public function index()
    {
        $perusahaan = $this->perusahaan_m->get_all();
        $data = array(
            'title'         => 'Perusahaan',
            'main_content'  => 'perusahaan/perusahaan_v',
            'perusahaan'    => $perusahaan
        );

        $this->load->view('template_input', $data);
    }

    public function ubah($id_p)
    {
        $this->load->library('form_validation');

        $config = array(
            array(
                'field' => 'id',
                'label' => 'ID Perusahaan',
                'rules' => 'required|trim|exact_length[4]'
            ),
            array(
                'field' => 'nama',
                'label' => 'Nama Perusahaan',
                'rules' => 'required|trim|max_length[50]'
            ),
            array(
                'field' => 'alamat',
                'label' => 'Alamat',
                'rules' => 'required|trim'
            ),
            array(
                'field' => 'telepon',
                'label' => 'Nomor Telepon',
                'rules' => 'required|trim|integer'
            ),
            array(
                'field' => 'email',
                'label' => 'Email',
                'rules' => 'required|trim|valid_email'
            ),
        );

        $this->form_validation->set_rules($config);

        if($this->form_validation->run() == FALSE)
        {
            $p = $this->perusahaan_m->get_detail_p($id_p);

            if($p == FALSE)
                redirect('pemohon/perusahaan');

            $data = array(
                'title'         => 'Ubah Data Perusahaan',
                'main_content'  => 'perusahaan/u_perusahaan_v',
                'id_p'          => $id_p,
                'p'              => $p,
                'id_pemohon'    => $p->id_pemohon
            );

            $this->load->view('template_input',$data);
        }
        else
        {
            $simpan = $this->perusahaan_m->ubah();
            if($simpan == TRUE)
                redirect('perusahaan');
        }
    }
}
