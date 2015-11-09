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
    'pemohon/create' => array(
        array(
            'field' => 'type_pemohon',
            'label' => 'Type Pemohon',
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
    'petugas/create'   => array(
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
            'field' => 'id_komoditi',
            'label' => 'Komoditi',
            'rules' => 'required|trim'
        ),
        array(
            'field' => 'bagian',
            'label' => 'Bagian',
            'rules' => 'trim'
        ),
    ),
    'petugas/detail'   => array(
        array(
            'field' => 'nama',
            'label' => 'Nama',
            'rules' => 'required|trim'
        ),
        array(
            'field' => 'id_komoditi',
            'label' => 'Komoditi',
            'rules' => 'required|trim'
        ),
        array(
            'field' => 'bagian',
            'label' => 'Bagian',
            'rules' => 'trim'
        ),
    ),
    'parameter/create'      => array(
        array(
            'field' => 'nama',
            'label' => 'Nama Parameter',
            'rules' => $base_validation."|is_unique[parameter.nama]"
        ),
        array(
            'field' => 'harga',
            'label' => 'Harga Parameter',
            'rules' => 'trim|xss_clean|integer'
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
            'label' => 'Pemohon',
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
            'field' => 'provinsi',
            'label' => 'Provinsi',
            'rules' => 'required'
        ),
        array(
            'field' => 'lokasi',
            'label' => 'Lokasi',
            'rules' => 'required'
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
            'field' => 'tanggal_terima',
            'label' => 'Tanggal Conto Diterima',
            'rules' => 'required'
        ),
        array(
            'field' => 'alamat',
            'label' => 'Alamat',
            'rules' => 'trim|required'
        )
    ),
    'type_analisis/create' => [
        [
            'field' => 'id_lab',
            'label' => 'Laboratorium',
            'rules' => $base_validation
        ],
        [
            'field' => 'id_type_analisis',
            'label' => 'ID type Analisis',
            'rules' => $base_validation.'|max_length[5]|is_unique[type_analisis.id_type_analisis]'
        ],
        [
            'field' => 'nama',
            'label' => 'Nama',
            'rules' => $base_validation
        ],
        [
            'field' => 'harga',
            'label' => 'Harga',
            'rules' => $base_validation.'|integer'
        ],
        [
            'field' => 'deskripsi',
            'label' => 'Deskripsi',
            'rules' => 'trim|xss_clean'
        ]
    ],
    'type_analisis/insert_type_analisis_parameter' => [
        [
            'field' => 'id_parameter',
            'label' => 'Parameter',
            'rules' => $base_validation
        ],
        [
            'field' => 'harga',
            'label' => 'Harga',
            'rules' => 'trim|xss_clean|integer'
        ],
        [
            'field' => 'satuan',
            'label' => 'Satuan',
            'rules' => 'trim|xss_clean'
        ],
    ],
    'type_analisis/update_prosedur' => [
        [
            'field' => 'keterangan_total_waktu',
            'label' => 'Keterangan total waktu',
            'rules' => 'xss_clean'
        ],
        [
            'field' => 'keterangan_prosedur',
            'label' => 'Keterangan Prosedur',
            'rules' => 'xss_clean'
        ],
        [
            'field' => 'keterangan',
            'label' => 'Keterangan',
            'rules' => 'xss_clean'
        ]
    ],
    'type_analisis/insert_prosedur_kegiatan' => [
        [
            'field' => 'kegiatan',
            'label' => 'Kegiatan',
            'rules' => 'required'
        ],
        [
            'field' => 'pelaksana',
            'label' => 'Pelaksana',
            'rules' => 'required'
        ],
        [
            'field' => 'kelengkapan',
            'label' => 'Kelengkapan',
            'rules' => 'required'
        ],
        [
            'field' => 'keluaran',
            'label' => 'Keluaran',
            'rules' => 'required'
        ],
        [
            'field' => 'is_perhari',
            'label' => 'Perhari',
            'rules' => 'xss_clean'
        ],
        [
            'field' => 'waktu',
            'label' => 'Waktu',
            'rules' => 'number'
        ],
        [
            'field' => 'hari',
            'label' => 'hari',
            'rules' => 'number'
        ],
        [
            'field' => 'jumlah_conto',
            'label' => 'Jumlah Conto',
            'rules' => 'number'
        ],
        [
            'field' => 'keterangan',
            'label' => 'Keterangan',
            'rules' => 'xss_clean'
        ],
        [
            'field' => 'prosedur_khusus',
            'label' => 'Prosedur Khusus',
            'rules' => 'xss_clean'
        ]
    ],
    'message/send' => [
        [
            'field' => 'checkall',
            'label' => 'checkall',
            'rules' => 'xss_clean'
        ],
        [
            'field' => 'to',
            'label' => 'Penerima',
            'rules' => 'required|xss_clean'
        ],
        [
            'field' => 'message',
            'label' => 'Message',
            'rules' => $base_validation
        ],
        [
            'field' => 'subject',
            'label' => 'Subject',
            'rules' => 'xss_clean'
        ]
    ],
    'lokasi/insert_provinsi' => [
        [
            'field' => 'nama',
            'label' => 'Nama Provinsi',
            'rules' => $base_validation.'|is_unique[provinsi.nama]'
        ]
    ],
    'lokasi/insert_kabupaten' => [
        [
            'field' => 'id_provinsi',
            'label' => 'Provinsi',
            'rules' => 'required|xss_clean'
        ],
        [
            'field' => 'nama',
            'label' => 'Nama Kabupaten',
            'rules' => $base_validation.'|is_unique[provinsi.nama]'
        ]
    ],
    'lokasi/update_provinsi' => [
        [
            'field' => 'nama',
            'label' => 'Nama Provinsi',
            'rules' => $base_validation.'|is_unique[provinsi.nama]'
        ]
    ],
    'lokasi/update_kabupaten' => [
        [
            'field' => 'id_provinsi',
            'label' => 'Provinsi',
            'rules' => 'required|xss_clean'
        ],
        [
            'field' => 'nama',
            'label' => 'Nama Kabupaten',
            'rules' => $base_validation.'|is_unique[provinsi.nama]'
        ]
    ],
    'metoda/create' => [
        [
            'field' => 'nama',
            'label' => 'Nama Metoda',
            'rules' => $base_validation.'|is_unique[metoda.nama]'
        ],
        [
            'field' => 'id_lab',
            'label' => 'Laboratorium',
            'rules' => $base_validation
        ]
    ]
);