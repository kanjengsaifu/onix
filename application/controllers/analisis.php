<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 9/18/13
 * Time: 8:27 PM
 */
class Analisis extends Petugas_controller
{

    public $have_metoda = array('kpb', 'knl');

    public function __construct()
    {
        parent::__construct();
        $this->load->model(array(
            'analisis_m',
            'type_analisis_m',
            'parameter_m',
            'metoda_m',
            'komoditi_m',
            'lab_m',
            'conto_m',
            'reference_m'
        ));
    }

    /**
     * Analisis
     */
    public function index()
    {
        $id_komoditi = $this->session->userdata('komoditi');
        $komoditi = $this->komoditi_m->find($id_komoditi);
        $lab = $this->lab_m->by_komoditi($id_komoditi);
        $jumlah_analisis_tersimpan = 0;

        foreach($lab as $key => $row)
        {
            $lab[$key]->jumlah_permohonan_selesai = 0;

            $permohonan = $this->analisis_m->by_laboratorium($row->id_lab);
            $lab[$key]->jumlah_permohonan = count($permohonan);
            $lab[$key]->jumlah_conto = $this->conto_m->count_conto_by_laboratorium($row->id_lab);

            foreach($permohonan as $row_selesai)
            {
                $lab[$key]->jumlah_permohonan_selesai += $row_selesai->is_selesai ? 1 : 0;
            }

            $jumlah_analisis_tersimpan += count($permohonan);
        }

        $data = array(
            'title'         => $komoditi->nama,
            'main_content'  => 'analisis/komoditi_v',
            'lab'           => $lab,
            'nama_komoditi' => $komoditi->nama,
            'jumlah_analisis_tersimpan'     => $jumlah_analisis_tersimpan
        );

        $this->load->view('template', $data);
    }

    /**
     * @param $id_lab
     */
    public function lab($id_lab)
    {
        $is_fisika = substr($id_lab,0,1) == 'f'? TRUE : FALSE;

        $lab = $this->lab_m->find($id_lab);
        $analisis = $this->analisis_m->by_laboratorium($id_lab);
        $permohonan_bulan_ini = $this->analisis_m->by_month(date('m'));

        $data = array(
            'title'         => $lab->nama,
            'main_content'  => 'analisis/analisis_v',
            'analisis'      => $analisis,
            'permohonan_bulan_ini'  => $permohonan_bulan_ini,
            'is_fisika'     => $is_fisika,
            'lab'           => $lab
        );

        $this->load->view('template', $data);
    }

    /**
     * @param $id
     */
    public function detail($id)
    {
        $this->load->model(['analisis_tracking_m', 'prosedur_m']);

        $analisis = $this->analisis_m->find($id);
        $conto = $this->conto_m->by_analisis($id);
        $count_conto_added = $this->conto_m->count_conto_added_by_analisis($id);
        $count_conto_selesai = $this->conto_m->count_conto_selesai_by_analisis($id);
        $last_track = $this->analisis_tracking_m->find($analisis->id_analisis_tracking);

        $all_metoda = '';

        // jika belum di preparasi
        if(empty($last_track))
        {
            $this->session->set_flashdata('error_message', 'Belum dapat melakukan Analisis '. $analisis->nomor_analisis);
            redirect('analisis/lab/' . $analisis->id_lab);
        }

        $button_tambah_conto = FALSE;
        $button_terima_conto = FALSE;
        $button_identifikasi_parameter = FALSE;
        $button_simpan_di_buku_induk = FALSE;
        $button_group_analisis = FALSE;
        $button_mengolah_data_analisis = FALSE;
        $button_selesai_analisis = FALSE;
        $array_type_analisis = [];
        $array_button_analisis = [];
        $array_button_analisis_selesai = [];

        if(!$analisis->is_selesai)
        {
            // if the analisis is not using preparasi
            if(!$analisis->preparasi)
            {
                $button_terima_conto = TRUE;

                if($last_track->id_kegiatan == 3 )
                {
                    $button_terima_conto = TRUE;
                }
            }

            // jika kegiatan sebelumnya menyerahkan conto dari preparasi
            if($last_track->id_kegiatan == 4)
            {
                $button_terima_conto = FALSE;
                $button_identifikasi_parameter = TRUE;
                $button_mengolah_data_analisis = FALSE;
            }

            // jika kegiatan sebelumnya mengidentifikasi parameter analisis
            if($last_track->id_kegiatan == 5)
            {
                $button_terima_conto = FALSE;
                $button_simpan_di_buku_induk = TRUE;
                $button_mengolah_data_analisis = FALSE;
            }

            // jika kegiatan sudah selesai simpan di buku induk
            if($last_track->id_kegiatan == 6)
            {
                $button_terima_conto = FALSE;
                $button_group_analisis = TRUE;
                $button_mengolah_data_analisis = FALSE;
            }

            if($count_conto_added == $analisis->jumlah_conto)
            {
                $button_tambah_conto = FALSE;
            }

            if($button_group_analisis)
            {
                $array_type_analisis = $this->analisis_m->type_analisis($analisis->id);

                foreach($array_type_analisis as $key => $row_type_analisis)
                {

                    $prosedur = $this->prosedur_m->find_by_type_analisis($row_type_analisis->id_type_analisis);
                    $prosedur_kegiatan = $this->prosedur_m->prosedur_khusus($prosedur->id);
                    $array_type_analisis[$key] = [
                        'id'            => $array_type_analisis[$key],
                        'kegiatan'      => $prosedur_kegiatan
                    ];

                    foreach($prosedur_kegiatan as $row_prosedur_kegiatan)
                    {
                        $status_button = $this->analisis_tracking_m->by_analisis_and_kegiatan($analisis->id, $row_prosedur_kegiatan->id_kegiatan) ? 1 : 0;

                        $button_analisis = [
                            'id_kegiatan'       => $row_prosedur_kegiatan->id_kegiatan,
                            'kegiatan'          => $row_prosedur_kegiatan->kegiatan,
                            'status'            => $status_button
                        ];

                        $array_button_analisis[] = $button_analisis;

                        if(!$status_button)
                        {
                            $array_button_analisis_selesai[] = $row_prosedur_kegiatan->id_kegiatan;
                        }
                    }
                }

                if(count($array_button_analisis_selesai) == 0)
                {
                    $button_mengolah_data_analisis = TRUE;
                }
            }

            if($last_track->id_kegiatan == 8)
            {
                $button_mengolah_data_analisis = FALSE;
            }

            if($last_track->id_kegiatan == 9)
            {
                $button_mengolah_data_analisis = FALSE;
                $button_selesai_analisis = TRUE;
            }

            $button_tambah_conto = TRUE;
            // if analisis by analis is selesai
            if($last_track->id_kegiatan == 12)
            {
                $button_tambah_conto = FALSE;
                $button_terima_conto = FALSE;
                $button_identifikasi_parameter = FALSE;
                $button_simpan_di_buku_induk = FALSE;
                $button_mengolah_data_analisis = FALSE;
                $button_selesai_analisis = FALSE;
            }
        }

        if($this->is_fisika($analisis->id_lab))
        {
            $page = 'fisika_v';
            $parameter_analisis = $this->analisis_m->type_analisis($id);
            foreach($parameter_analisis as $key => $row)
            {
                $type_analisis = $this->type_analisis_m->find($row->id_type_analisis);
                $parameter_analisis[$key]->nama = $type_analisis->nama;
                $array_type_analisis[] = $type_analisis->id;
            }
        }
        else
        {
            $page = 'kimia_v';
            $parameter_analisis = $this->analisis_m->parameter($id);
            $all_metoda = $this->metoda_m->all();
            foreach($parameter_analisis as $key => $row)
            {
                $parameter = $this->parameter_m->find_type_analisis_parameter($row->id_type_analisis_parameter);
                $metoda = $this->metoda_m->find($row->id_metoda);
                $parameter_analisis[$key]->nama = $parameter->nama_parameter;
                $parameter_analisis[$key]->metoda_nama = !$metoda ? '-' : $metoda->nama;
            }

        }

        $satuan = $this->reference_m->all('satuan');

        $data = array(
            'title'         =>  'Analisis | '.$analisis->nomor_analisis,
            'main_content'  =>  'analisis/lab_type/detail_'.$page,
            'analisis'      =>  $analisis,
            'conto'         =>  $conto,
            'satuan'        => $satuan,
            'parameter_analisis'        => $parameter_analisis,
            'count_conto_selesai'       => $count_conto_selesai,
            'count_conto_added'       => $count_conto_added,
            'button_tambah_conto'       => $button_tambah_conto,
            'button_terima_conto'       => $button_terima_conto,
            'button_identifikasi_parameter'       => $button_identifikasi_parameter,
            'button_mengolah_data_analisis'       => $button_mengolah_data_analisis,
            'button_simpan_di_buku_induk'         => $button_simpan_di_buku_induk,
            'button_selesai_analisis'             => $button_selesai_analisis,
            'group_button_analisis'               => $array_button_analisis,
            'all_metoda'                          => $all_metoda
        );

        $this->load->view('template', $data);
    }

    public function isi($id_analisis, $id_conto, $type_analisis=FALSE)
    {
        $this->load->helper('labs_helper');
        $parameter = $this->analisis_m->get_param_by_id_conto($id_conto, $type_analisis);
        $conto = $this->analisis_m->get_detail_conto($id_conto);

        $detail_conto_fisika = $this->analisis_m->get_detail_conto_fisika($id_conto);

        $is_fisika = substr($id_analisis, 5, 1) == 'f' ? TRUE : FALSE;

            $data = array(
            'title'         => no_conto($conto->id_conto),
            'main_content'  => 'analisis/isi_v',
            'conto'         => $conto,
            'parameter'     => $parameter,
            'id_analisis'   => $id_analisis,
            'is_fisika'     => $is_fisika,
            'type_analisis' => $type_analisis,
            'detail_conto_fisika'   => $detail_conto_fisika
        );

        $this->load->view('template_input', $data);
    }

    /**
     * List semua conto
     */

    public function listing($id_analisis)
    {
        $this->load->helper('labs');
        $listing = $this->analisis_m->get_conto_by_no_analisis($id_analisis);

        $parameter = $this->analisis_m->pakai_satuan($id_analisis);

        $analisis = $this->analisis_m->get_detail_analisis($id_analisis);

        $data = array(
            'title'         => $id_analisis,
            'main_content'  => 'analisis/listing_v',
            'listing'       => $listing,
            'parameter'     => $parameter,
            'kode_conto'    => $analisis->kode_conto,
            'nomor_analisis'=> $analisis->nomor_analisis,
            'id_analisis'   => $id_analisis
        );

        $this->load->view('template', $data);
    }

    public function tambah_conto()
    {
        $no_analisis = $this->input->post('no_analisis');
        $cek_jumlah_contoh = $this->analisis_m->cek_jumlah_conto($no_analisis);

        if($cek_jumlah_contoh == FALSE)
        {
            $simpan = $this->analisis_m->tambah_conto($no_analisis);
            if($simpan == TRUE)
            {
                $status = TRUE;
                $pesan = 'Berhasil tambah conto';
            }
            else
            {
                $status = FALSE;
                $pesan = 'Kesalahan dalam Server';
            }
        }
        else
        {
            $status = FALSE;
            $pesan = 'Gagal tambah conto';
        }

        $data = array(
            'status'    => $status,
            'pesan'     => $pesan
        );

        echo json_encode($data);
    }

    public function simpan_nilai()
    {
        $this->load->library('form_validation');

        $nama_parameter = $this->input->post('nama');

        $config = array(
            array(
                'field' => 'nilai',
                'label' => 'Nilai Parameter',
                'rules' => 'required|float'
            )
        );

        $this->form_validation->set_rules($config);

        if($this->form_validation->run() == FALSE)
        {
            $status = FALSE;
            $pesan = 'Silahkan isi Nilai dengan Benar';
        }
        else
        {
            $simpan = $this->analisis_m->simpan_nilai();
            if($simpan == TRUE)
            {
                $status = TRUE;
                $pesan = 'Berhasil isi nilai untuk parameter '.nama_kimia($nama_parameter);
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

    public function simpan_catatan()
    {
        $this->load->library('form_validation');

        $nama_parameter = $this->input->post('nama');

        $config = array(
            array(
                'field' => 'catatan',
                'label' => 'Nilai Parameter',
                'rules' => 'xss_clean'
            )
        );

        $this->form_validation->set_rules($config);

        if($this->form_validation->run() == FALSE)
        {
            $status = FALSE;
            $pesan = 'Silahkan isi Catatan dengan Benar';
        }
        else
        {
            $simpan = $this->analisis_m->simpan_catatan();
            if($simpan == TRUE)
            {
                $status = TRUE;
                $pesan = 'Berhasil isi catatan untuk parameter '.nama_kimia($nama_parameter);
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

    /*
     * Analisis Fisika
     */

    public function tambah_conto_fisika($type_analisis, $id_analisis)
    {
        $qtype_analisis = $this->type_analisis_m->detail_type_analisis($type_analisis);
        $data = array(
            'title'         => $id_analisis,
            'main_content'  => 'a_fisika/t_conto_fisika',
            'type_analisis' => $qtype_analisis
        );

        $this->load->view('template_input', $data);

    }

    public function tambah_parameter()
    {
        $this->load->library('form_validation');

        $config = array(
            array(
                'field' => 'id_param',
                'label' => 'Parameter',
                'rules' => 'required'
            )
        );

        $this->form_validation->set_rules($config);

        if($this->form_validation->run() == FALSE)
        {
            $status = FALSE;
            $pesan = 'Silahkan Pilih Parameter';
        }
        else
        {
            $id_conto = $this->input->post('id_conto');
            $id_parameter = $this->input->post('id_param');
            $cek_uji_param = $this->analisis_m->cek_uji_param($id_conto, $id_parameter);
            if($cek_uji_param == FALSE)
            {
                $simpan = $this->analisis_m->simpan_uji_parameter($id_conto, $id_parameter);
                if($simpan == TRUE)
                {
                    $status = TRUE;
                    $pesan = 'Berhasil Tambah Parameter';
                }
                else
                {
                    $status = FALSE;
                    $pesan = 'Kesalahan dalam Server';
                }
            }
            else
            {
                $status = FALSE;
                $pesan = 'Parameter Sudah Ada';
            }
        }

        $json = array(
            'status'    => $status,
            'pesan'     => $pesan
        );

        echo json_encode($json);
    }

    public function hapus_uji_param()
    {
        $this->load->library('form_validation');

        $config = array(
            array(
                'field' => 'id_param',
                'label' => 'Parameter',
                'rules' => 'required'
            )
        );

        $this->form_validation->set_rules($config);

        if($this->form_validation->run() == FALSE)
        {
            $status = FALSE;
            $pesan = 'Tidak Ada parameter dipilih';
        }
        else
        {
            $id_conto = $this->input->post('id_conto');
            $id_parameter = $this->input->post('id_param');
            $cek_uji_param = $this->analisis_m->cek_uji_param($id_conto, $id_parameter);
            if($cek_uji_param == TRUE)
            {
                $hapus = $this->analisis_m->hapus_uji_param($id_conto, $id_parameter);
                if($hapus == TRUE)
                {
                    $status = TRUE;
                    $pesan = 'Berhasil Hapus Uji Parameter';
                }
                else
                {
                    $status = FALSE;
                    $pesan = 'Kesalahan dalam Server';
                }
            }
            else
            {
                $status = FALSE;
                $pesan = 'Parameter Tidak Ada';
            }
        }

        $json = array(
            'status'    => $status,
            'pesan'     => $pesan
        );

        echo json_encode($json);
    }

    public function simpan_nama_batuan()
    {
        $this->load->library('form_validation');

        $config = array(
            array(
                'field' => 'nama_batuan',
                'label' => 'Nama Batuan',
                'rules' => 'xss_clean'
            )
        );

        $this->form_validation->set_rules($config);

        if($this->form_validation->run() == FALSE)
        {
            $status = FALSE;
            $pesan = 'Silahkan isi Nama Batuan dengan Benar';
        }
        else
        {
            $simpan = $this->analisis_m->simpan_nama_batuan();
            if($simpan == TRUE)
            {
                $status = TRUE;
                $pesan = 'Berhasil isi Nama Batuan';
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

    public function simpan_nilai_fisika()
    {
        $this->load->library('form_validation');

        $id = $this->input->post('id_detail');
        $nilai = $this->input->post('nilai');
        $type_analisis = $this->input->post('nama_type_analisis');
        $id_type_analisis = strtoupper($this->input->post('id_type_analisis'));

        $this->form_validation->set_rules('nilai', 'Nilai', 'required');

        if($this->form_validation->run() == FALSE)
        {
            $status = FALSE;
            $title = 'Gagal Simpan '.$type_analisis;
            $pesan = array(
                '',
                validation_errors()
            );

        }
        else
        {
            $simpan = $this->analisis_m->simpan_nilai_fisika();
            if(!$simpan)
            {
                $status = FALSE;
                $title = 'Gagal Simpan '.$type_analisis;
                $pesan = array(
                    '',
                    'Kesalahan Database Server'
                );
            }
            else
            {
                $status = TRUE;
                $title = 'Berhasil Simpan Nilai untuk '. $type_analisis;
                $pesan = array(
                    $nilai,
                    ''
                );
            }
        }

        $json = array(
            'id'    => $id,
            'type_analisis' => $id_type_analisis,
            'title' => $title,
            'pesan' => $pesan,
            'status'=> $status
        );

        echo json_encode($json);
    }

    public function simpan_deskirpsi_conto()
    {
        $this->load->library('form_validation');

        $config = array(
            array(
                'field' => 'deskripsi',
                'label' => 'Deskripsi Conto',
                'rules' => 'xss_clean'
            )
        );

        $this->form_validation->set_rules($config);

        if($this->form_validation->run() == FALSE)
        {
            $status = FALSE;
            $pesan = 'Silahkan isi Deskripsi Conto';
        }
        else
        {
            $simpan = $this->analisis_m->simpan_deskripsi_conto();
            if($simpan == TRUE)
            {
                $status = TRUE;
                $pesan[0] = 'Berhasil isi Deskripsi Conto';
            }
            else
            {
                $status = FALSE;
                $pesan[0] = 'Kesalahan dalam Server';
            }
        }

        $json = array(
            'status'    => $status,
            'pesan'     => $pesan
        );

        echo json_encode($json);
    }

    public function simpan_mikroskopis()
    {
        $this->load->library('form_validation');

        $config = array(
            array(
                'field' => 'deskripsi',
                'label' => 'Deskripsi Mikroskopis',
                'rules' => 'xss_clean'
            )
        );

        $this->form_validation->set_rules($config);

        if($this->form_validation->run() == FALSE)
        {
            $status = FALSE;
            $pesan = 'Silahkan isi Deskripsi Mikroskopis';
        }
        else
        {
            $simpan = $this->analisis_m->simpan_mikroskopis();
            $id_type_analisis = $this->input->post('id_type_analisis');
            $id_detail_conto_fisika = $this->input->post('id_proses');
            $type_analisis = $this->type_analisis_m->detail_type_analisis(strtoupper($id_type_analisis));
            if($simpan == TRUE)
            {
                $status = TRUE;
                $pesan[0] = 'Berhasil isi Deskripsi Mikroskopis';
                $pesan[1] = $type_analisis->nama;
                $pesan[2] = $id_detail_conto_fisika;
            }
            else
            {
                $status = FALSE;
                $pesan[0] = 'Kesalahan dalam Server';
                $pesan[1] = '';
                $pesan[2] = $id_detail_conto_fisika;
            }
        }

        $json = array(
            'status'    => $status,
            'pesan'     => $pesan
        );

        echo json_encode($json);
    }

    public function simpan_komposisi()
    {
        $this->load->library('form_validation');

        $config = array(
            array(
                'field' => 'komposisi',
                'label' => 'Komposisi Mineral',
                'rules' => 'xss_clean'
            )
        );

        $this->form_validation->set_rules($config);

        if($this->form_validation->run() == FALSE)
        {
            $status = FALSE;
            $pesan = 'Silahkan isi Deskripsi Mikroskopis';
        }
        else
        {
            $simpan = $this->analisis_m->simpan_komposisi();
            $id_type_analisis = $this->input->post('id_type_analisis');
            $id_detail_conto_fisika = $this->input->post('id_proses');
            $type_analisis = $this->type_analisis_m->detail_type_analisis(strtoupper($id_type_analisis));
            if($simpan == TRUE)
            {
                $status = TRUE;
                $pesan[0] = 'Berhasil isi Komposisi Mineral';
                $pesan[1] = $type_analisis->nama;
                $pesan[2] = $id_detail_conto_fisika;
            }
            else
            {
                $status = FALSE;
                $pesan[0] = 'Kesalahan dalam Server';
                $pesan[1] = '';
                $pesan[2] = $id_detail_conto_fisika;
            }
        }

        $json = array(
            'status'    => $status,
            'pesan'     => $pesan
        );

        echo json_encode($json);
    }

    public function simpan_gambar()
    {
        $no_foto = $this->input->post('no_foto');
        $id_detail_conto_fisika = $this->input->post('id_detail');
        $file_name = $this->input->post('id_proses').$id_detail_conto_fisika.$no_foto.'.jpg';
        $config = array(
            'upload_path'   => 'assets/img/foto_conto',
            'allowed_types' => 'jpg',
            'max_size'      => '1000',
//            'max_width'     => '1024',
//            'max_height'    => '768',
            'overwrite'     => TRUE,
            'file_name'     => $file_name
        );

        $this->load->library('upload', $config);
        if(!$this->upload->do_upload('foto'))
        {
            $pesan = array(
                'error'  => $this->upload->display_errors()
            );

            $status = FALSE;
        }
        else
        {
            $upload_data = $this->upload->data();

            // simpan ke database
            $this->analisis_m->simpan_fotomikrograf($id_detail_conto_fisika,$file_name,$no_foto);


            $pesan = array(
                'file'      => $file_name,
                'id_conto'  => no_conto($file_name),
                'id'        => $this->input->post('id_proses').$id_detail_conto_fisika.$no_foto

            );


            $status = TRUE;

        }
        $json = array(
            'status'    => $status,
            'pesan'     => $pesan
        );
        echo json_encode($json);
    }

    public function simpan_deskripsi_fotomikrograf()
    {
        $this->load->library('form_validation');

        $id = $this->input->post('id_proses');
        $no_deskripsi = $this->input->post('no_deskripsi');
        $nama_fisika = $this->input->post('nama_fisika');

        $config = array(
            array(
                'field' => 'fotomikrograf',
                'label' => 'Fotomikrograf',
                'rules' => 'required|xss_clean'
            )

        );

        $this->form_validation->set_rules($config);

        if($this->form_validation->run() == FALSE)
        {
            $status = FALSE;
            $pesan = 'Silahkan isi Fotomikrografi';
        }
        else
        {
            $simpan = $this->analisis_m->simpan_deskripsi_fotomikrograf();
            if($simpan == TRUE)
            {
                $status = TRUE;
                $pesan = 'Berhasil isi fotomikrografi '.$nama_fisika.' - '.$no_deskripsi;
            }
            else
            {
                $status = FALSE;
                $pesan = 'Kesalahan dalam Server';
            }
        }

        $json = array(
            'status'    => $status,
            'pesan'     => $pesan,
            'id'        => $id
        );

        echo json_encode($json);
    }

    public function cek_gambar_conto($id_conto)
    {
        $this->load->helper('file');

        $file = get_file_info('assets/img/foto_conto/'.$id_conto.'.jpg');

        if(!$file)
            return FALSE;
        else
            return TRUE;
    }

    public function simpan_berat()
    {
        $this->load->library('form_validation');

        $config = array(
            array(
                'field' => 'berat',
                'label' => 'berat',
                'rules' => 'xss_clean|integer'
            )
        );

        $this->form_validation->set_rules($config);

        if($this->form_validation->run() == FALSE)
        {
            $status = FALSE;
            $pesan = 'Silahkan isi Berat dengan Benar';
        }
        else
        {
            $simpan = $this->analisis_m->simpan_berat();
            if($simpan == TRUE)
            {
                $status = TRUE;
                $pesan = 'Berhasil isi jumlah berat';
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

    public function fisika($type_analisis, $id_analisis)
    {
        $data = array(
            'title'         => $type_analisis,
            'main_content'  => 'a_fisika/'.$type_analisis
        );

        $this->load->view('template', $data);
    }

    /*
     * End Analisis Fisika
     */

    public function selesai_analisis()
    {
        $id_analisis = $this->input->post('id_analisis');


        $simpan = $this->analisis_m->selesai_analisis($id_analisis);
        if($simpan == TRUE)
        {
            $status = TRUE;
            $pesan = 'Selesai Analisis';
        }
        else
        {
            $status = FALSE;
            $pesan = 'Kesalahan dalam Server';
        }

        $json = array(
            'status'    => $status,
            'pesan'     => $pesan
        );

        echo json_encode($json);
    }

    public function selesai_analisis_conto()
    {
        $id_analisis = $this->input->post('id_analisis');
        $id_conto = $this->input->post('id_conto');
        $id_type = $this->input->post('id_type');

        $is_fisika = substr($id_analisis, 5, 1) == 'f' ? TRUE : FALSE;

        if($id_conto != FALSE)
        {
            $simpan = $this->analisis_m->selesai_analisis_conto($id_conto);
            if($simpan == TRUE)
            {
                $status = TRUE;
                $pesan = 'Selesai';
            }
            else
            {
                $status = FALSE;
                $pesan = 'Kesalahan dalam Server';
            }
        }
        else
        {
            $status = FALSE;
            $pesan = 'Kesalahan dalam Server';
        }

        $json = array(
            'status'    => $status,
            'pesan'     => $pesan,
            'is_fisika' => $is_fisika
        );

        echo json_encode($json);
    }

    public function reproses_analisis()
    {
        $id_analisis = $this->input->post('id_analisis');

        if($id_analisis != FALSE)
        {
            $simpan = $this->analisis_m->selesai_analisis($id_analisis, TRUE);
            if($simpan == TRUE)
            {
                $status = TRUE;
                $pesan = 'Ulangi Proses';
            }
            else
            {
                $status = FALSE;
                $pesan = 'Kesalahan dalam Server';
            }
        }
        else
        {
            $status = FALSE;
            $pesan = 'Kesalahan dalam Server';
        }

        $json = array(
            'status'    => $status,
            'pesan'     => $pesan
        );

        echo json_encode($json);
    }

    public function reproses()
    {
        $id_conto = $this->input->post('id_conto');

        if($id_conto != FALSE)
        {
            $simpan = $this->analisis_m->selesai_analisis_conto($id_conto, TRUE);
            if($simpan == TRUE)
            {
                $status = TRUE;
                $pesan = 'Selesai';
            }
            else
            {
                $status = FALSE;
                $pesan = 'Kesalahan dalam Server';
            }
        }
        else
        {
            $status = FALSE;
            $pesan = 'Kesalahan dalam Server';
        }

        $json = array(
            'status'    => $status,
            'pesan'     => $pesan
        );

        echo json_encode($json);
    }

    /*
     * Analisis per Type
     */

    /**
     * Update Parameter Satuan in Analisis Parameter
     */
    public function update_parameter_satuan()
    {
        $input = $this->input->post();
        $analisis_parameter = (array) $this->analisis_m->find_parameter($input['id']);
        $analisis_parameter['satuan'] = $this->input->post('satuan');

        $this->analisis_m->update_parameter($analisis_parameter);
        echo $this->input->post('satuan') == 'null' ? 0 : $this->input->post('satuan');
    }

    /**
     * Update Parameter Metoda in Analisis Parameter
     */
    public function update_parameter_metoda()
    {
        $input = $this->input->post();
        $analisis_parameter = (array) $this->analisis_m->find_parameter($input['id']);
        $analisis_parameter['id_metoda'] = $this->input->post('id_metoda');
        $metoda = $this->metoda_m->find($this->input->post('id_metoda'));

        $this->analisis_m->update_parameter($analisis_parameter);

        echo !$metoda ? 0 : $metoda->nama;
    }

    public function update_parameter_basis()
    {
        $input = $this->input->post();
        $analisis_parameter = (array) $this->analisis_m->find_parameter($input['id']);
        $analisis_parameter['basis'] = $this->input->post('basis');

        $this->analisis_m->update_parameter($analisis_parameter);

        echo $analisis_parameter['basis'];
    }

    public function preview_conto($id_analisis)
    {
        $analisis = $this->analisis_m->find($id_analisis);
        if($this->is_fisika($analisis->id_lab))
        {
            $this->_preview_conto_fisika($analisis);
        }
        else
        {
            $this->_preview_conto_kimia($analisis);
        }

    }

    private function _preview_conto_fisika($analisis)
    {
        $conto = $this->conto_m->by_analisis($analisis->id);

        foreach($conto as $key => $row_conto)
        {
            $conto[$key]->detail_parameter = $this->conto_m->parameter($row_conto->id);
        }

        $data = [
            'title'             => 'Preview Conto',
            'main_content'      => 'analisis/preview_conto/fisika_v',
            'analisis'          => $analisis,
            'conto'             => $conto
        ];

        $this->load->view('template', $data);
    }

    private function _preview_conto_kimia($analisis)
    {
        $conto = $this->conto_m->by_analisis($analisis->id);

        $analisis_parameter = $this->analisis_m->parameter($analisis->id);

        foreach($analisis_parameter as $key => $row_parameter)
        {
            $parameter = $this->parameter_m->find_type_analisis_parameter($row_parameter->id_type_analisis_parameter);
            $analisis_parameter[$key]->nama_parameter = $parameter->nama_parameter;
        }

        foreach($conto as $key => $row_conto)
        {
            $conto[$key]->detail_parameter = $this->conto_m->parameter($row_conto->id);
        }

        $data = [
            'title'             => 'Preview Conto',
            'main_content'      => 'analisis/preview_conto/kimia_v',
            'analisis'          => $analisis,
            'parameter'         => $analisis_parameter,
            'conto'             => $conto
        ];

        $this->load->view('template', $data);
    }

    public function terima_analisis()
    {
        $tracking = new Tracking();
        $tracking->add_tracking($this->input->post('id'), 4);

        redirect('analisis/detail/' . $this->input->post('id'));
    }

    public function identifikasi_parameter()
    {
        $tracking = new Tracking();
        $tracking->add_tracking($this->input->post('id'), 5);

        redirect('analisis/detail/' . $this->input->post('id'));
    }

    public function simpan_di_buku_induk()
    {
        $tracking = new Tracking();
        $tracking->add_tracking($this->input->post('id'), 6);

        redirect('analisis/detail/' . $this->input->post('id'));
    }

    public function mulai_analisis()
    {
        $tracking = new Tracking();
        $tracking->add_tracking_khusus($this->input->post('id'), $this->input->post('id_kegiatan'));

        redirect('analisis/detail/' . $this->input->post('id'));
    }

    private function _add_tracking($id_analisis, $id_kegiatan)
    {
        $tracking = new Tracking();
        $tracking->add_tracking($id_analisis, $id_kegiatan);
    }

    public function add_tracking()
    {
        $id_analisis = $this->input->post('id');
        $id_kegiatan = $this->input->post('id_kegiatan');

        $this->_add_tracking($id_analisis, $id_kegiatan);
        redirect('analisis/detail/' . $this->input->post('id'));
    }

    public function set_selesai()
    {
        $input = $this->input->post();
        $input['value'] = TRUE;
        $this->analisis_m->set_selesai($input);

        redirect('analisis/detail/' . $this->input->post('id'));
    }

    public function set_unselesai()
    {
        $input = $this->input->post();
        $input['value'] = FALSE;
        $this->analisis_m->set_selesai($input);

        redirect('analisis/detail/' . $this->input->post('id'));
    }
}
