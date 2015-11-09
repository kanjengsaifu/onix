<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class Preparasi
 *
 * Air panas tidak melakukan preparasi
 */
class Preparasi extends Preparasi_controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(array('preparasi_m', 'analisis_m', 'lab_m', 'type_analisis_m'));
    }

    public function index()
    {
        $preparasi = $this->preparasi_m->all();
        foreach($preparasi as $key => $row)
        {
            $analisis = $this->analisis_m->find($row->id_analisis);
            $preparasi[$key]->analisis = $analisis;
        }

        $data = array(
            'title'                 => 'Preparasi',
            'main_content'          => 'preparasi/preparasi_v',
            'preparasi'             => $preparasi
        );

        $this->load->view('template', $data);
    }

    public function detail($id_preparasi)
    {
        $preparasi = $this->preparasi_m->find($id_preparasi);
        $analisis  = $this->analisis_m->find($preparasi->id_analisis);
        $petugas = $this->petugas_m->find($preparasi->id_petugas);
        $lab = $this->lab_m->find($analisis->id_lab);

        $type_analisis = $this->analisis_m->type_analisis($preparasi->id_analisis);
        foreach($type_analisis as $key => $row)
        {
            $type_analisis_detail = $this->type_analisis_m->find($row->id_type_analisis);
            $type_analisis[$key]->nama_type_analisis = $type_analisis_detail->nama;
        }

        $preparasi->petugas = !$petugas ? '-' : $petugas->nama;
        $analisis->lab = $lab->nama;

        $data = array(
            'title'                 => 'Preparasi',
            'main_content'          => 'preparasi/detail_v',
            'preparasi'             => $preparasi,
            'analisis'              => $analisis,
            'type_analisis'         => $type_analisis
        );

        $this->load->view('template', $data);
    }

    public function update()
    {
        $this->load->library('form_validation');

        $this->form_validation->set_rules('jumlah_conto', 'Jumlah Conto', 'required|trim|xss_clean|integer');
        if($this->form_validation->run())
        {
            $this->preparasi_m->update($this->input->post());
        }

        redirect('preparasi/detail/'. $this->input->post('id'));
    }

    /**
     * Id tracking 2 Memasukan data preparasi di buku induk serta ke aplikasi pelayanan
     */
    public function update_status()
    {
        $this->preparasi_m->update_status($this->input->post());

        $id_kegiatan = $this->input->post('id_kegiatan');

        $tracking = new Tracking();
        $tracking->add_tracking($this->input->post('id_analisis'), $id_kegiatan);

        redirect('preparasi/detail/'. $this->input->post('id'));
    }

    /**
     * Id tracking 2 preparasi conto
     */
    public function update_to_proses()
    {
        $input = $this->input->post();
        $this->preparasi_m->update_to_proses($input['id']);
        $tracking = new Tracking();
        $tracking->add_tracking($input['id_analisis'], 3);
        redirect('preparasi/detail/'. $input['id']);
    }

    public function update_to_selesai()
    {
        $input = $this->input->post();
        $this->preparasi_m->update_to_selesai($input['id']);
        redirect('preparasi/detail/'. $input['id']);
    }

    function update_selesai_preparasi_analisis_type_analisis()
    {
        $input = $this->input->post();

        $update = $this->analisis_m->update_analisis_type_analisis_selesai_preparasi($input);

        if(!$update)
        {
            echo 0;
        }
        else
        {
            echo tanggal_format_indonesia($input['selesai_preparasi']);
        }
    }
}
