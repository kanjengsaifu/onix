<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/17/13
 * Time: 5:36 PM
 */
class Petugas extends Admin_controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(array('petugas_m', 'komoditi_m'));
    }

    public function index()
    {
        $petugas = $this->petugas_m->all(TRUE);

        $petugas_count_logged_in = $this->petugas_m->count_is_login();

        $js = array(

        );

        $data = array(
            'title'                         => 'Petugas',
            'main_content'                  => 'petugas/petugas_v',
            'js'                            => $js,
            'petugas'                       => $petugas,
            'petugas_count_logged_in'       => $petugas_count_logged_in
        );

        $this->load->view('template', $data);
    }

    public function create()
    {
        $this->load->library('form_validation');

        if($this->form_validation->run())
        {
            $this->petugas_m->insert($this->input->post());
            redirect('petugas');
        }
        else
        {
            $this->load->model('komoditi_m');
            $komoditi = $this->komoditi_m->get_all();

            $js = array(
            );

            $data = array(
                'title'         => 'Tambah Data Petugas',
                'main_content'  => 'petugas/t_petugas_v',
                'js'            => $js,
                'komoditi'      => $komoditi
            );

            $this->load->view('template', $data);
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

        $komoditi_petugas = $this->komoditi_m->find($petugas->id_komoditi);
        $petugas->komoditi = $komoditi_petugas->nama;

        $main_content =  $this->tinyauth->is_admin() ? 'detail_petugas_v' : 'preview_petugas_v';

        $data = array(
            'title'         => 'Ubah Data Petugas',
            'main_content'  => 'petugas/' . $main_content,
            'petugas'       => $petugas,
            'komoditi'      => $komoditi
        );

        $this->load->view('template', $data);

    }

    public function my_profile()
    {
        $id_petugas = $this->session->userdata('logged_id');
        $petugas = $this->petugas_m->find($id_petugas);

        $this->load->library('form_validation');

        $this->form_validation->set_rules('telepon', 'Telepon', 'required|trim|number');
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');
        if($this->form_validation->run())
        {
            $input = (array) $petugas;
            $input['telepon'] = $this->input->post('telepon');
            $input['email'] = $this->input->post('email');
            $this->petugas_m->update($input);
        }

        $komoditi = $this->komoditi_m->find($petugas->id_komoditi);
        $petugas->komoditi = $komoditi->nama;

        $data = [
            'title'         => 'Petugas | '.$petugas->nama,
            'main_content'  => 'petugas/my_profile_v',
            'petugas'       => $petugas
        ];

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

    public function reset_password()
    {
        $reset_password = $this->petugas_m->reset_password($this->input->post('id'));

        if(!$reset_password)
        {
            echo 0;
        }
        else
        {
            echo $reset_password;
        }
    }


}
