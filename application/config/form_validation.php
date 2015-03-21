<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/16/15
 * Time: 12:43 AM
 */

$base_validation = 'required|trim|xss_clean';

$config = array(
    'login' => array(
        array(
            'field' => 'username',
            'label' => 'Username',
            'rules' => 'trim|required|xss_clean'
        ),
        array(
            'field' => 'password',
            'label' => 'Password',
            'rules' => 'trim|required'
        )
    ),
    'pemohon' => array(
        array(
            'field' => 'id',
            'label' => 'ID Pemohon',
            'rules' => 'required|trim'
        ),
        array(
            'field' => 'nama',
            'label' => 'Nama Pemohon',
            'rules' => 'required|trim|max_length[50]'
        ),
        array(
            'field' => 'nama_sertifikat',
            'label' => 'Nama di Sertifikat',
            'rules' => 'required|trim|max_length[50]'
        ),
        array(
            'field' => 'alamat',
            'label' => 'Alamat Pemohon',
            'rules' => 'required|trim'
        ),
        array(
            'field' => 'deskripsi',
            'label' => 'deskripsi',
            'rules' => 'trim'
        )
    ),
    'petugas/daftar'   => array(
        array(
            'field' => 'nip',
            'label' => 'Nomor Induk Pegawai',
            'rules' => 'required|trim|max_length[20]|is_unique[petugas.nip]'
        ),
        array(
            'field' => 'telepon',
            'label' => 'Nomor Telepon',
            'rules' => 'required|trim|numeric'
        ),
        array(
            'field' => 'email',
            'label' => 'Email',
            'rules' => 'required|trim|valid_email'
        ),
        array(
            'field' => 'nama',
            'label' => 'Nama',
            'rules' => 'required|trim'
        ),
        array(
            'field' => 'komoditi',
            'label' => 'Komoditi',
            'rules' => 'required|trim'
        ),
    ),
    'petugas/detail'   => array(
        array(
            'field' => 'nama',
            'label' => 'Nama',
            'rules' => 'required|trim'
        ),
        array(
            'field' => 'telepon',
            'label' => 'Nomor Telepon',
            'rules' => 'required|trim|numeric'
        ),
        array(
            'field' => 'email',
            'label' => 'Email',
            'rules' => 'required|trim|valid_email'
        ),
        array(
            'field' => 'komoditi',
            'label' => 'Komoditi',
            'rules' => 'required|trim'
        ),
    ),
    'parameter/tambah'      => array(
        array(
            'field' => 'id_parameter',
            'label' => 'ID Parameter',
            'rules' => 'required|max_length[7]|is_unique[parameter.id_parameter]'
        ),
        array(
            'field' => 'nama',
            'label' => 'Nama Parameter',
            'rules' => $base_validation
        ),
        array(
            'field' => 'harga',
            'label' => 'Harga Analisis Parameter',
            'rules' => 'integer'
        ),
        array(
            'field' => 'satuan',
            'label' => 'Satuan Analisis Parameter',
            'rules' => 'trim|xss_clean'
        ),
        array(
            'field' => 'deskripsi',
            'label' => 'Deskripsi',
            'rules' => 'trim|xss_clean'
        )
    ),
    'permohonan/tambah' => array(
        array(
            'field' => 'id_pemohon',
            'label' => 'Nama Perusahaan',
            'rules' => 'required'
        ),
        array(
            'field' => 'jenis_contoh',
            'label' => 'Jenis Conto',
            'rules' => 'required|trim|max_lenght[30]'
        ),
        array(
            'field' => 'jumlah_contoh',
            'label' => 'Jumlah Conto',
            'rules' => 'required|numeric'
        ),
        array(
            'field' => 'lokasi',
            'label' => 'Lokasi',
            'rules' => 'required'
        ),
        array(
            'field' => 'kode_conto',
            'label' => 'Kode Conto',
            'rules' => 'required|trim|max_length[5]'
        ),
        array(
            'field' => 'tanggal_terima',
            'label' => 'Tanggal Conto Diterima',
            'rules' => 'required'
        ),
        array(
            'field' => 'preparasi',
            'label' => 'Preparasi',
            'rules' => 'xss_clean'
        ),
        array(
            'field' => 'param[]',
            'label' => 'Parameter / Type Analisis',
            'rules' => 'trim|required'
        ),
        array(
            'field' => 'metoda[]',
            'label' => 'Metoda',
            'rules' => 'xss_clean'
        ),
        array(
            'field' => 'basis[]',
            'label' => 'Basis',
            'rules' => 'xss_clean'
        )
    ),
    'permohonan/update' => array(
        array(
            'field' => 'jenis_conto',
            'label' => 'Jenis Conto',
            'rules' => 'required|trim|max_lenght[30]'
        ),
        array(
            'field' => 'lokasi',
            'label' => 'Lokasi',
            'rules' => 'required'
        ),
        array(
            'field' => 'kode_conto',
            'label' => 'Kode Conto',
            'rules' => 'required|trim|max_length[5]'
        ),
        array(
            'field' => 'tanggal_terima',
            'label' => 'Tanggal Conto Diterima',
            'rules' => 'required'
        ),
        array(
            'field' => 'alamat',
            'label' => 'Alamat',
            'rules' => 'trim|required'
        )
    )
);