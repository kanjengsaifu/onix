<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/18/13
 * Time: 5:06 PM
 */
class K_penelitian extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('k_penelitian_m');
        if($this->tinyauth->logged_in())
            return TRUE;
        else
            redirect(base_url());
    }

    public function index()
    {
        $kp = $this->k_penelitian_m->get_all();

        $data = array(
            'title'         => 'Kelompok Penelitian',
            'main_content'  => 'k_penelitian/k_penelitian_v',
            'kp'            => $kp
        );

        $this->load->view('template', $data);
    }

    public function daftar()
    {
        $this->load->library('form_validation');
        $config = array();


        $this->form_validation->set_rules($config);

        if($this->form_validation->run() == FALSE)
        {
            $data = array(
                'title'         => 'Daftar Kelompok Penelitian',
                'main_content'  => 'k_penelitian/t_k_penelitian_v'
            );

            $this->load->view('template_input',$data);
        }
        else
        {
            $simpan = $this->k_penelitian_m->simpan();
            if($simpan == TRUE)
                redirect('k_penelitian');
        }
    }

    public function ubah($id_kp)
    {
        $this->load->library('form_validation');

        $config = array(
            array(
                'field'     => 'id_kp',
                'label'     => 'ID Kelompok Penelitian',
                'rules'     => 'required|trim|max_length[4]'
            ),
            array(
                'field'     => 'nama',
                'label'     => 'ID Kelompok Penelitian',
                'rules'     => 'required|trim'
            )
        );

        $this->form_validation->set_rules($config);

        if($this->form_validation->run() == FALSE)
        {
            $kp = $this->k_penelitian_m->get_detail_kp($id_kp);

            if($kp == FALSE)
                redirect('pemohon/k_penelitian');

            $data = array(
                'title'         => 'Ubah Data Kelompok Penelitian',
                'main_content'  => 'k_penelitian/u_k_penelitian_v',
                'id_kp'         => $id_kp,
                'nama'          => $kp->nama,
                'id_pemohon'    => $kp->id_pemohon
            );

            $this->load->view('template_input',$data);
        }
        else
        {
            $simpan = $this->k_penelitian_m->ubah();
            if($simpan == TRUE)
                redirect('k_penelitian');
        }
    }

    public function hapus()
    {
        $this->load->library('form_validation');
        $config = array(
            array(
                'field' => 'id_kp',
                'label' => 'ID Kelompok Penelitian',
                'rules' => 'required|trim'
            )
        );
        $this->form_validation->set_rules($config);

        $this->form_validation->set_rules($config);

        if($this->form_validation->run() == FALSE)
        {
            $status = FALSE;
            $pesan = 'Tidak Id Kelompok Penelitian';
        }
        else
        {
            $id_kp = $this->input->post('id_kp');
            $hapus = $this->k_penelitian_m->hapus($id_kp);
            if($hapus == TRUE)
            {
                $status = TRUE;
                $pesan = 'Berhasil Hapus Kelompok Penelitian';
            }
            else
            {
                $status = FALSE;
                $pesan = 'Kesalahan dalam Server';
            }
        }

        $json = array(
            'status'    => $status,
            'pesan'     => $pesan
        );

        echo json_encode($json);
    }

}
