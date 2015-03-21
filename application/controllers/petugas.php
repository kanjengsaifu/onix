<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/17/13
 * Time: 5:36 PM
 */
class Petugas extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(array('petugas_m'));
    }

    public function index()
    {
        $petugas = $this->petugas_m->all();

        $js = array(
            'datatables/jquery.dataTables.min'
        );

        $data = array(
            'title'         => 'Petugas',
            'main_content'  => 'petugas/petugas_v',
            'js'            => $js,
            'petugas'       => $petugas
        );

        $this->load->view('template', $data);
    }

    public function add()
    {
        $this->load->library('form_validation');

        if($this->form_validation->run() == FALSE)
        {
            $this->load->model('komoditi_m');
            $komoditi = $this->komoditi_m->get_all();

            $data = array(
                'title'         => 'Tambah Data Petugas',
                'main_content'  => 'petugas/t_petugas_v',
                'komoditi'      => $komoditi
            );

            $this->load->view('template', $data);
        }
        else
        {
            $simpan = $this->petugas_m->insert($this->input->post());
            $status = 'GAGAL';
            if($simpan == TRUE)
                $status = 'Berhasil';

            redirect('petugas?status='.$status);
        }
    }

    public function detail($id_petugas)
    {
        $petugas = $this->petugas_m->find($id_petugas);
        if($petugas == FALSE)
        {
            redirect('petugas');
            exit;
        }

        $this->load->library('form_validation');

        if($this->form_validation->run('petugas/detail'))
        {
            $this->petugas_m->update($this->input->post());
        }

        $this->load->model('komoditi_m');

        $komoditi = $this->komoditi_m->get_all();

        $data = array(
            'title'         => 'Ubah Data Petugas',
            'main_content'  => 'petugas/detail_petugas_v',
            'petugas'       => $petugas,
            'komoditi'      => $komoditi
        );

        $this->load->view('template', $data);

    }

    public function delete()
    {
        $status = FALSE;
        $hapus = $this->petugas_m->delete($this->input->post('id'));
        if($hapus === TRUE)
            $status = TRUE;

        $json = array(
            'status'    => $status
        );

        echo json_encode($json);
    }


}
