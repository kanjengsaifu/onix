<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 11/23/13
 * Time: 9:58 AM
 */
class Type_analisis extends Admin_controller
{

    public function __construct()
    {
        parent::__construct();
        $model = array(
            'type_analisis_m',
            'parameter_m',
            'metoda_m',
            'prosedur_m',
            'lab_m'
        );
        $this->load->model($model);
    }

    public function index()
    {
        $type_analisis  = $this->type_analisis_m->all();

        $js = array(
            'datatables/jquery.dataTables.min'
        );

        $data = array(
            'title'         => 'Type Analisis',
            'main_content'  => 'type_analisis/type_analisis_v',
            'js'            => $js,
            'type_analisis' => $type_analisis
        );

        $this->load->view('template', $data);
    }

    public function detail($id_type_analisis)
    {
        $this->load->model('lab_m');

        // initialize
        $parameter = $this->parameter_m->all();
        $type_analisis = $this->type_analisis_m->find_by_id_type($id_type_analisis);
        $type_analisis_parameter = $this->type_analisis_m->parameter($type_analisis->id);
        $lab = $this->lab_m->find($type_analisis->id_lab);
        $type_analisis->laboratorium = $lab;

        $data = array(
            'title'         => $type_analisis->nama,
            'main_content'  => 'type_analisis/detail_type_analisis_v',
            'parameter'     => $parameter,
            'type_analisis' => $type_analisis,
            'type_analisis_parameter' => $type_analisis_parameter,
            'lab'           => $lab
        );

        $this->load->view('template', $data);
    }

    public function create()
    {
        $this->load->library('form_validation');

        if($this->form_validation->run())
        {
            $this->type_analisis_m->insert($this->input->post());
            redirect('type_analisis/detail/' . $this->input->post('id_type_analisis'));
        }
        else
        {

            $lab = $this->lab_m->all();
            $data = [
                'title'             => 'Tambah type Analisis',
                'main_content'      => 'type_analisis/t_type_analisis_v',
                'laboratorium'      => $lab
            ];

            $this->load->view('template', $data);
        }
    }

    public function insert_type_analisis_parameter()
    {
        $this->load->library('form_validation');

        if($this->form_validation->run())
        {
            $this->type_analisis_m->insert_parameter($this->input->post());
            redirect('type_analisis/detail/' . $this->input->post('id_type_analisis_kode'));
        }
        else
        {
            $this->detail($this->input->post('id_type_analisis_kode'));
        }
    }

    public function update_harga()
    {
        $this->load->library('form_validation');

        $this->form_validation->set_rules('harga', 'Harga Type Analisis', 'required|trim|integer|xss_clean');
        $this->form_validation->set_rules('id_type_analisis', 'ID Type Analisis', 'required|trim|xss_clean');

        if($this->form_validation->run())
        {
            $this->type_analisis_m->update_harga($this->input->post());
            set_flashdata('Berhasil Update Harga Type Analisis', 'success', 'fa fa-check');
        }
        else
        {
            set_flashdata(validation_errors());
        }

        redirect('type_analisis/detail/'.$this->input->post('id_type_analisis'));
    }



    function jumlah_harga()
    {
        $harga_param_minimal = 0;
        $parameter_dipakai = $this->input->post('param');
        $jumlah = $this->input->post('jumlah') == '' ? 0 : $this->input->post('jumlah');

        $harga_param = 0;

        if(empty($parameter_dipakai))
        {
            $harga_param = 0;
        }
        else
        {
//            foreach($parameter_dipakai as $param)
//            {
//                $detail_param = $this->parameter_m->detail_parameter($param);
//                $harga_param = $harga_param + $detail_param->harga;
//
//            }

            if(count($parameter_dipakai) <= 4)
            {
                $harga_param_minimal = format_rupiah(600000*$jumlah);
            }
            else
            {
                // parameter tidak di hitung
                $jumlah_param = count($parameter_dipakai);
                for($p = 0; $p <= ($jumlah_param - 5); $p++)
                {
                    $detail_param = $this->parameter_m->detail_parameter($parameter_dipakai[$p]);
                    $harga_param = $harga_param + $detail_param->harga;
                }

                $harga_param_minimal = 600000*$jumlah;

                //jika harga lebih kecil dari jumlah harga parameter minimal maka har
//                $harga_param_minimal = $harga_param + $harga_param_minimal;

                $total = ($harga_param*$jumlah) + $harga_param_minimal;

                $harga_param_minimal = $total;

                $harga_param_minimal = format_rupiah($harga_param_minimal);

            }

        }

        echo json_encode(array('harga' => $harga_param_minimal));
    }

    public function metoda_parameter($id_parameter)
    {
        $parameter = $this->parameter_m->detail_parameter($id_parameter);
        $id_lab = substr($id_parameter,0,3);

        $metoda = $this->metoda_m->metoda_by_lab($id_lab);
        $message = '';


        $this->form_validation->set_rules('metoda', 'Metoda', 'required');

        if($this->form_validation->run() !== FALSE)
        {
            $metoda = $this->input->post('metoda');
            $this->parameter_m->simpan_metoda($id_parameter, $metoda);
            redirect('parameter/type_analisis/'.$parameter->id_type);
        }
        else
        {

            // jika metoda sudah digunakan default checklis
            $metoda_digunakan = $this->parameter_m->metoda_digunakan($id_parameter);
            $metoda_parameter = array(); // hanya idnya saja
            foreach($metoda_digunakan as $metoda_row):
                array_push($metoda_parameter, $metoda_row->id_metoda);
            endforeach;

            $data = array(
                'title'         => 'Ubah Metoda',
                'main_content'  => 'metoda_parameter_v',
                'id_parameter'     => $parameter->id_parameter,
                'nama'          => $parameter->nama,
                'id_type'       => $parameter->id_type,
                'metoda'        => $metoda,
                'metoda_digunakan'       => $metoda_parameter
            );

            $this->load->view('template', $data);
        }

    }

    /**
     * @param $id
     */
    public function prosedur($id)
    {
        $this->load->library('form_validation');

        // initialize
        $type_analisis = $this->type_analisis_m->find_by_id_type($id);
        if(empty($type_analisis))
        {
            redirect('type_analisis');
        }

        $this->load->model(array('reference_m'));
        $reference['kegiatan'] = $this->reference_m->all('kegiatan');
        $reference['pelaksana'] = $this->reference_m->all('pelaksana');
        $reference['kelengkapan'] = $this->reference_m->all('kelengkapan');
        $reference['keluaran'] = $this->reference_m->all('keluaran');

        $id_prosedur = $this->prosedur_m->insert_prosedur($type_analisis->id);

        $prosedur = $this->prosedur_m->find_by_type_analisis($type_analisis->id);

        if(!empty($prosedur))
        {
            $prosedur->kegiatan = $this->prosedur_m->kegiatan($prosedur->id);
            foreach($prosedur->kegiatan as $key => $value)
            {
                $prosedur->kegiatan[$key]->kelengkapan = $this->prosedur_m->kelengkapan_prosedur_kegiatan($value->id);
            }
        }

        $js = [
          'moment/moment.min'
        ];

        $data = [
            'title'                 => 'Update Prosedur',
            'main_content'          => 'type_analisis/prosedur_type_analisis_v',
            'js'                    => $js,
            'type_analisis'         => $type_analisis,
            'prosedur'              => $prosedur,
            'reference'             => $reference
        ];

        $this->load->view('template', $data);
    }

    public function update_prosedur()
    {
        $this->load->library('form_validation');

        if($this->form_validation->run())
        {
            $this->prosedur_m->update_prosedur($this->input->post());
        }

        redirect('type_analisis/prosedur/' . $this->input->post('kode_type_analisis'));
    }

    public function insert_prosedur_kegiatan()
    {
        $this->load->library('form_validation');
        if($this->form_validation->run())
        {
            $insert_prosedur_kegiatan = $this->prosedur_m->insert_prosedur_kegiatan($this->input->post());

            if($insert_prosedur_kegiatan)
            {
                foreach($this->input->post('kelengkapan') as $kelengkapan)
                {
                    $input = [
                        'id_prosedur_kegiatan'  => $insert_prosedur_kegiatan,
                        'kelengkapan'           => $kelengkapan
                    ];
                    $this->prosedur_m->insert_kelengkapan_prosedur_kegiatan($input);
                }
            }
            redirect('type_analisis/prosedur/' . $this->input->post('kode_type_analisis'));
        }
        else
        {
            $this->prosedur($this->input->post('kode_type_analisis'));
        }
    }

    public function delete_prosedur_kegiatan()
    {
        $delete = $this->prosedur_m->delete_prosedur_kegiatan($this->input->post());

        echo $delete ? 1 : 0;
    }

    public function update_prosedur_kegiatan_order()
    {
        $this->prosedur_m->update_prosedur_kegiatan_order($this->input->post());
    }

    public function copy_from_default($id_type_analisis, $id_prosedur)
    {
        $this->prosedur_m->batch_copy_prosedur_kegiatan($id_prosedur, 4);
        redirect('type_analisis/prosedur/' . $id_type_analisis);
    }

    public function update_prosedur_khusus()
    {
        $update = $this->prosedur_m->update_prosedur_khusus($this->input->post());
        echo $update ? 1 : 0;
    }

    public function delete_type_analisis_parameter()
    {
        $kode_type_analisis = $this->input->post('kode_type_analisis');
        $this->type_analisis_m->delete_type_analisis_parameter($this->input->post('id'));
        redirect('type_analisis/detail/' . $kode_type_analisis);
    }

}
