<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/22/13
 * Time: 8:46 AM
 */
class Pemohon extends PS_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(array('pemohon_m'));
    }

    public function index()
    {
        $pemohon = $this->pemohon_m->all();

        $js = array(
        );

        $data = array(
            'title'         => 'Pemohon',
            'main_content'  => 'pemohon/pemohon_v',
            'js'            => $js,
            'pemohon'       => $pemohon
        );

        $this->load->view('template', $data);
    }

    /**
     * Creting Pemohon
     */
    public function create()
    {
        $this->load->library('form_validation');
        $type_pemohon = $this->pemohon_m->get_all_type_pemohon();

        if($this->form_validation->run())
        {
            $this->pemohon_m->insert($this->input->post());
            redirect('pemohon');

        }
        else
        {
            $js = array(
            );

            $data = array(
                'title'         => 'Daftar',
                'main_content'  => 'pemohon/t_pemohon_v',
                'js'            => $js,
                'type_pemohon'  => $type_pemohon
            );

            $this->load->view('template', $data);
        }
    }

    public function detail($id)
    {
        $pemohon = $this->pemohon_m->find($id);

        if($pemohon == FALSE)
        {
            redirect('pemohon');
            exit;
        }

        $this->load->library('form_validation');

        if($this->form_validation->run('pemohon/create'))
        {
            $this->pemohon_m->update();
            redirect('pemohon/detail/' . $this->input->post('id'));
        }

        $this->load->model('analisis_m');
        $type_pemohon = $this->pemohon_m->get_all_type_pemohon();
        $hasil_analisis = $this->analisis_m->by_id_pemohon($pemohon->id_pemohon);

        $data = array(
            'title'         => 'Ubah Data Pemohon',
            'main_content'  => 'pemohon/detail_pemohon_v',
            'pemohon'       => $pemohon,
            'type_pemohon'  => $type_pemohon,
            'hasil_analisis'=> $hasil_analisis

        );

        $this->load->view('template',$data);
    }
}
