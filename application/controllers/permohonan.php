<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/18/13
 * Time: 5:59 AM
 */
class Permohonan extends PS_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model(
            array(
                'parameter_m',
                'pemohon_m',
                'analisis_m',
                'lab_m',
                'type_analisis_m',
                'lokasi_m',
                'metoda_m',
                'type_pemohon_m',
            )
        );
    }

    /**
     * get value from basis or metoda where there is parameter on it
     * @param array $parameter_option
     * @param array $parameter_input
     * @return array|bool|null
     */
    private function _parameter_option($parameter_option = array(), $parameter_input = array())
    {
        $parameter_option_array = array();

        if(!is_array($parameter_option))
        {
            return FALSE;
        }

        foreach($parameter_option as $row)
        {
            $explode = explode('|', $row);

            if(in_array($explode[0], $parameter_input))
            {
                $parameter_option_array[] = $row;
            }
        }

        return count($parameter_option_array) == 0 ? NULL : $parameter_option_array;
    }

    /**
     * @param $parameter
     * @param $parameter_metoda
     * @param $parameter_basis
     * @return array
     */
    private function _set_parameter_array($parameter, $parameter_metoda, $parameter_basis)
    {
        $parameter_array = array();

        foreach($parameter as $key => $row)
        {
            $parameter = $this->parameter_m->find($row);
            $array = array(
                'id_parameter'      => $parameter->id_parameter,
                'nama'              => $parameter->nama,
                'harga'             => $parameter->harga,
                'harga_after'       => $parameter->harga,
                'metoda'            => null,
                'basis'             => null
            );

            // metoda
            if(is_array($parameter_metoda))
            {
                $explode_metoda = explode('|', $parameter_metoda[$key]);
                $metoda = $this->metoda_m->find($explode_metoda[1]);
                $metoda = (array) $metoda;
                $array['metoda'] = $metoda;
            }

            // basis
            if(is_array($parameter_basis))
            {
                $explode_basis = explode('|', $parameter_basis[$key]);
                $basis = $explode_basis[1];
                $array['basis'] = $basis;
            }

            $parameter_array[] = $array;
        }

        return $parameter_array;
    }

    /**
     * @param $parameter
     * @return array
     */
    private function _set_type_analisis_array($parameter)
    {
        $type_analisis_array = array();

        foreach($parameter as $row)
        {
            $type_analisis = $this->type_analisis_m->find_by_id_type($row);
            $array = array(
                'id_parameter'      => $type_analisis->id_type_analisis,
                'nama'              => $type_analisis->nama,
                'harga'             => $type_analisis->harga,
                'harga_after'       => $type_analisis->harga
            );

            $type_analisis_array[] = $array;
        }

        return $type_analisis_array;
    }

    /**
     *  Adding to Session Permohonan
     */
    private function _set_session_permohonan()
    {
        $data = array(
            'id_pemohon'                => $this->session->userdata('pemohon')->id_pemohon,
            'type_pemohon'              => $this->session->userdata('pemohon')->id_type_pemohon,
            'id_lab'                    => $this->input->post('id_lab'),
            'id_komoditi'               => $this->input->post('id_komoditi'),
            'tanggal_terima'            => $this->input->post('tanggal_terima'),
            'jenis_conto'               => $this->input->post('jenis_contoh'),
            'jumlah_conto'              => $this->input->post('jumlah_contoh'),
            'kode_conto'                => $this->input->post('kode_conto'),
            'provinsi'                  => $this->input->post('provinsi'),
            'lokasi'                    => $this->input->post('lokasi'),
            'preparasi'                 => $this->input->post('preparasi'),
        );

        // initialize parameter with method or basis
        $parameter_metoda = $this->_parameter_option($this->input->post('metoda'), $this->input->post('param'));
        $parameter_basis = $this->_parameter_option($this->input->post('basis'), $this->input->post('param'));

        if($this->is_fisika($data['id_lab']))
        {
            $parameter_array = $this->_set_type_analisis_array($this->input->post('param'));
        }
        else
        {
            $parameter_array = $this->_set_parameter_array($this->input->post('param'), $parameter_metoda, $parameter_basis);
        }

        $data['parameter'] = $parameter_array;
        $nama_lokasi = $this->lokasi_m->detail_by_kabupaten($this->input->post('lokasi'), TRUE);
        $data['nama_lokasi']   = $nama_lokasi;

        $data = (object) $data;

        $this->session->set_userdata('permohonan', $data);
    }

    /**
     * if value is FALSE redirect to base
     * @param $value
     */
    private function _check_value($value)
    {
        if($value == FALSE)
        {
            redirect(base_url());
            exit;
        }
    }

    /**
     *  Permohonan
     */
    public function index()
    {
        $permohonan = $this->analisis_m->all();

        $js = array(
            'datatables/jquery.dataTables.min'
        );

        $data = array(
            'title'         => 'Permohonan',
            'main_content'  => 'permohonan/permohonan_v',
            'js'            => $js,
            'permohonan'    => $permohonan
        );

        $this->load->view('template',$data);
    }

    /**
     * @param $id_lab
     */
    public function daftar($id_lab)
    {
        $this->load->library('form_validation');

        if($this->form_validation->run('permohonan/tambah'))
        {
            $this->_set_session_permohonan();
            redirect('permohonan/preview');
        }
        else
        {
            $this->load->model('analisis_m');

            $lab = $this->lab_m->find($id_lab);
            $this->_check_value($lab);

            $this->session->set_userdata('lab_pemohon', $id_lab);
            if(!$this->session->userdata('pemohon'))
            {
                redirect('permohonan/pemohon');
            }

            $pemohon = $this->session->userdata('pemohon');
            $provinsi = $this->lokasi_m->all_provinsi();
            $type_pemohon = $this->pemohon_m->get_all_type_pemohon();
            $no_urut = $this->analisis_m->get_last_no_urut($lab->id_komoditi);
            $page = 'daftar_permohonan_v';

            $data = array(
                'title'         => 'Daftar Permohonan',
                'main_content'  => 'permohonan/' . $page,
                'type_pemohon'  => $type_pemohon,
                'no_urut'       => $no_urut,
                'is_fisika'     => $this->is_fisika($id_lab),
                'pemohon'       => $pemohon,
                'provinsi'      => $provinsi,
                'lab'           => $lab
            );

            $this->load->view('template',$data);
        }
    }

    /**
     *  Inserting Analisis
     */
    public function insert()
    {
        if($this->session->userdata('permohonan'))
        {
            $this->load->model(array('analisis_m'));

            $input = (array) $this->session->userdata('permohonan');
            $input['biaya'] = $this->total_harga();
            $input['nomor_analisis'] = $this->analisis_m->new_nomor_analisis_by_type_pemohon($input['type_pemohon']);

            $insert = $this->analisis_m->insert($input);

            if($insert)
            {
                $permohonan = $this->analisis_m->find($insert);

                // loop parameter or type analisis
                foreach($input['parameter'] as $row)
                {
                    $basis = !empty($row['basis']) ? $row['basis'] : NULL;
                    $metoda = !empty($row['metoda']) ? $row['metoda']['id_metoda'] : NULL;

                    $input_parameter = array(
                        'id_analisis'       => $insert,
                        'id_parameter'      => $row['id_parameter'],
                        'basis'             => $basis,
                        'id_metoda'         => $metoda,
                        'harga'             => $row['harga_after']
                    );

                    if($this->is_fisika($input['id_lab']))
                    {
                        $this->analisis_m->insert_type_analisis($input_parameter);
                    }
                    else
                    {
                        $this->analisis_m->insert_parameter($input_parameter);
                    }
                }

                // clearing input session
                $this->session->unset_userdata('pemohon');
                $this->session->unset_userdata('permohonan');

                $data = array(
                    'title'         => 'Permohonan Sukses',
                    'main_content'  => 'permohonan/success_v',
                    'id_analisis'   => $insert,
                    'nomor_analisis'=> $permohonan->nomor_analisis
                );

                $this->load->view('template', $data);
            }
            else
            {
                redirect('permohonan');
            }
        }
        else
        {
            redirect('permohonan');
        }
    }

    /**
     * @param $id_analisis
     */
    public function detail($id_analisis)
    {
        $this->load->model(array('analisis_m'));

        $analisis = $this->analisis_m->find($id_analisis);
        $pemohon = $this->pemohon_m->find($analisis->id_pemohon);
        $type_pemohon = $this->type_pemohon_m->find($pemohon->id_type_pemohon);
        $analisis->nama_lokasi = $this->lokasi_m->detail_by_kabupaten($analisis->lokasi, TRUE);
        $conto = $this->analisis_m->get_conto_by_no_analisis($id_analisis);

        $is_fisika = $this->is_fisika($analisis->id_lab);

        if($this->_is_pihak_luar($pemohon->id_type_pemohon))
        {
            $pemohon->nama_sertifikat = $pemohon->nama;
        }
        else
        {
            $pemohon->nama_sertifikat = 'Kp. '.$type_pemohon->nama;
            $pemohon->alamat = 'PSDG';
        }

        $data = array(
            'title'             => $analisis->nomor_analisis,
            'main_content'      => 'permohonan/detail_v',
            'id_analisis'       => $id_analisis,
            'analisis'          => $analisis,
            'pemohon'           => $pemohon,
            'is_fisika'         => $is_fisika,
            'conto'             => $conto
        );

        $this->load->view('template_input',$data);
    }

    public function detail_conto($id_analisis, $id_conto)
    {
        $conto = $this->analisis_m->get_param_by_id_conto($id_conto);
        $is_fisika = substr($id_analisis, 5, 1) == 'f' ? TRUE : FALSE;
        $list_analisis = $this->analisis_m->pakai_type_analisis($id_analisis);
        $status = $this->analisis_m->get_status($id_analisis);

        $hasil_analisis = $this->analisis_m->get_detail_analisis($id_analisis);

        // detail conto fisika
        $detail_conto_fisika = $this->analisis_m->get_detail_conto_fisika($id_conto);


        $detail_conto = $this->analisis_m->get_detail_conto($id_conto);
        $all_conto = $this->analisis_m->get_conto_by_no_analisis($id_analisis);
        $data = array(
            'id_analisis'   => $id_analisis,
            'nomor_analisis'   => $hasil_analisis->nomor_analisis,
            'title'         => strtoupper($id_conto),
            'main_content'  => 'permohonan/detail_conto',
            'id_conto'      => $id_conto,
            'no_conto'      => $detail_conto->id_conto,
            'conto'         => $conto,
            'is_fisika'     => $is_fisika,
            'list_analisis' => $list_analisis,
            'status'        => $status,
            'all_conto'     => $all_conto,
            'detail_conto'  => $detail_conto,
            'detail_conto_fisika' => $detail_conto_fisika

        );

        $this->load->view('template', $data);
    }

    /**
     * Preview permohonan Data
     * if Fisika the parameter must be type analisis
     * eles the parameter contain a metoda
     */
    public function preview()
    {
        $this->load->model(array('lab_m', 'analisis_m'));

        $permohonan = $this->session->userdata('permohonan');
        if(!$permohonan)
        {
            redirect('permohonan/daftar/' . $this->session->userdata('lab_pemohon'));
        }

        $pemohon = $this->session->userdata('pemohon');

        $nomor_analisis = $this->analisis_m->new_nomor_analisis_by_type_pemohon($pemohon->id_type_pemohon);

        $lab = $this->lab_m->find($permohonan->id_lab);

        $data = array(
            'title'         => 'Preview Permohonan',
            'main_content'  => 'permohonan/preview_v',
            'pemohon'       => $pemohon,
            'permohonan'    => $permohonan,
            'lab'           => $lab,
            'nomor_analisis'=> $nomor_analisis,
            'parameter'     => $permohonan->parameter
        );

        $this->load->view('template', $data);
    }

    /**
     * @param $id
     */
    public function update($id)
    {
        $this->load->model(array('analisis_m'));

        $this->load->library('form_validation');

        $analisis  = $this->analisis_m->find($id);
        $pemohon = $this->pemohon_m->find($analisis->id_pemohon);
        $lokasi = $this->lokasi_m->detail_by_kabupaten($analisis->lokasi);
        $analisis->nama_lokasi = $this->lokasi_m->detail_by_kabupaten($analisis->lokasi, TRUE);

        // init select lokasi
        $provinsi = $this->lokasi_m->all_provinsi();
        $kabupaten = $this->lokasi_m->kabupaten_by_provinsi($lokasi->provinsi->id_provinsi);

        $data = array(
            'title'             => 'Update Permohonan',
            'main_content'      => 'permohonan/update_v',
            'id_analisis'       => $id,
            'analisis'          => $analisis,
            'pemohon'           => $pemohon,
            'provinsi'          => $provinsi,
            'kabupaten'         => $kabupaten,
            'lokasi'            => $lokasi
        );

        if($this->form_validation->run( 'permohonan/update' ))
        {
            $input = $this->input->post();
            $this->analisis_m->update($input);
            redirect('permohonan/detail/' . $id);
        }
        else
        {
            $this->load->view('template', $data);
        }
    }

    /**
     *  Choose Pemohon
     */
    public function pemohon()
    {
        $pemohon = $this->pemohon_m->all();

        $js = array(
            'datatables/jquery.dataTables.min',
            'smartwizard/jquery.smartWizard-2.0.min'
        );

        $data = array(
            'title'         => "Pilih Pemohon",
            'main_content'  => 'permohonan/set_pemohon_v',
            'js'            => $js,
            'pemohon'       => $pemohon
        );

        $this->load->view('template', $data);
    }

    /**
     * @param $id_pemohon
     */
    public function set_pemohon($id_pemohon)
    {
        $pemohon = $this->pemohon_m->find($id_pemohon);
        $this->load->model('type_pemohon_m');
        $type_pemohon = $this->type_pemohon_m->find($pemohon->id_type_pemohon);

        $pemohon->type_pemohon = $type_pemohon;

        if(!$pemohon)
        {
            redirect('permohonan/pemohon');
        }

        $this->session->set_userdata('pemohon', $pemohon);

        redirect('permohonan/daftar/' . $this->session->userdata('lab_pemohon'));
    }

    /**
     * @return int
     */
    private function total_harga()
    {
        $total = 0;

        foreach($this->session->userdata('permohonan')->parameter as $row)
        {
            $total += $row['harga_after'];
        }

        return $total;
    }

    /**
     * Updating parameter price from Permohonan Session
     */
    public function update_harga_parameter_permohonan()
    {
        $total = 0;

        $permohonan = $this->session->userdata('permohonan');
        $permohonan->parameter[$this->input->post('rowid')]['harga_after'] = $this->input->post('harga');
        $this->session->set_userdata('permohonan', $permohonan);

        $json = array(
            'total'         => format_rupiah($this->total_harga()),
            'harga'         => $this->input->post('harga')
        );

        echo json_encode($json);
    }

    /**
     * Reseting parameter price from Permohonan Session
     */
    public function reset_harga_parameter_permohonan()
    {
        $total = 0;

        $permohonan = $this->session->userdata('permohonan');
        $permohonan->parameter[$this->input->post('rowid')]['harga_after'] = $permohonan->parameter[$this->input->post('rowid')]['harga'];
        $this->session->set_userdata('permohonan', $permohonan);

        $json = array(
            'total'         => format_rupiah($this->total_harga()),
            'harga'         => $permohonan->parameter[$this->input->post('rowid')]['harga_after']
        );

        echo json_encode($json);
    }

    /**
     *  Clearing Permohonan Session
     */
    public function reset()
    {
        $this->session->unset_userdata('pemohon');
        $this->session->unset_userdata('permohonan');
        redirect('permohonan/daftar/' . $this->session->userdata('lab_pemohon'));
    }

}
