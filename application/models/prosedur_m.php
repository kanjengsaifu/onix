<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Prosedur_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function find($id)
    {
        return $this->db->where('id', $id)->get('prosedur')->row();
    }

    public function find_by_type_analisis($id_type_analisis)
    {
        return $this->db->where('id_type_analisis', $id_type_analisis)->get('prosedur')->row();
    }

    /**
     * Jika prosedur kosong maka tambah prosedur
     * @param $id
     * @return bool|CI_DB_active_record
     */
    public function insert_prosedur($id)
    {
        $prosedur = $this->find_by_type_analisis($id);

        $data = [
            'id_type_analisis'      => $id,
            'created_date'          => now()
        ];

        $insert = empty($prosedur) ? $this->db->insert('prosedur', $data) : FALSE;

        if($insert)
        {
            $insert = $this->db->insert_id();
        }

        return $insert;
    }

    public function update_prosedur($input)
    {
        $data = [
            'keterangan_total_waktu'        => $input['keterangan_total_waktu'],
            'keterangan_prosedur'           => $input['keterangan_prosedur'],
            'keterangan'                    => $input['keterangan']
        ];

        return $this->db->where('id', $input['id'])->update('prosedur', $data);
    }

    public function kegiatan($id_prosedur)
    {
        return $this->db->select('prosedur_kegiatan.*, ref_kegiatan.deskripsi as kegiatan, ref_keluaran.deskripsi as keluaran, ref_pelaksana.deskripsi as pelaksana')
            ->where('id_prosedur', $id_prosedur)
            ->join('ref_kegiatan', 'prosedur_kegiatan.id_kegiatan=ref_kegiatan.id')
            ->join('ref_pelaksana', 'prosedur_kegiatan.id_pelaksana=ref_pelaksana.id')
            ->join('ref_keluaran', 'prosedur_kegiatan.id_keluaran=ref_keluaran.id')
            ->order_by('order_no', 'ASC')
            ->get('prosedur_kegiatan')
            ->result();
    }

    public function kelengkapan_prosedur_kegiatan($id_prosedur_kegiatan)
    {
        return $this->db->select('kelengkapan_prosedur_kegiatan.*, ref_kelengkapan.deskripsi as kelengkapan')
            ->where('id_prosedur_kegiatan', $id_prosedur_kegiatan)
            ->join('ref_kelengkapan', 'kelengkapan_prosedur_kegiatan.id_kelengkapan=ref_kelengkapan.id')
            ->get('kelengkapan_prosedur_kegiatan')
            ->result();
    }

    public function last_order_no_prosedur_kegiatan($id_prosedur)
    {
        return $this->db->where('id_prosedur', $id_prosedur)
            ->limit(1)
            ->order_by('order_no', 'DESC')
            ->get('prosedur_kegiatan')
            ->row();
    }

    public function new_order_no_prosedur_kegiatan($id_prosedur)
    {
        $last_no = $this->last_order_no_prosedur_kegiatan($id_prosedur);
        if(empty($last_no))
        {
            $no = 1;
        }
        else
        {
            $no = $last_no->order_no+1;
        }

        return $no;
    }

    public function insert_prosedur_kegiatan($input)
    {
        $data = [
            'id_prosedur'       => $input['id'],
            'id_kegiatan'       => $input['kegiatan'],
            'id_pelaksana'      => $input['pelaksana'],
            'waktu'             => $input['waktu'],
            'is_perhari'        => !empty($input['is_perhari']) ? 1 : 0,
            'jumlah_conto'      => $input['jumlah_conto'],
            'hari'              => $input['hari'],
            'id_keluaran'       => $input['keluaran'],
            'keterangan'        => $input['keterangan'],
            'prosedur_khusus'   => !empty($input['prosedur_khusus']) ? 1 : 0,
            'order_no'          => $this->new_order_no_prosedur_kegiatan($input['id']),
            'created_date'      => now()
        ];

        $this->db->insert('prosedur_kegiatan', $data);

        return $this->db->insert_id();
    }

    public function delete_prosedur_kegiatan($input)
    {
        return $this->db->where('id', $input['id'])->delete('prosedur_kegiatan');
    }

    public function update_prosedur_kegiatan_order($input)
    {
        foreach($input['kegiatan'] as $key => $value)
        {
            $data = [
                'order_no'      => $key++
            ];
            $this->db->where('id', $value)->update('prosedur_kegiatan', $data);
        }
    }

    public function insert_kelengkapan_prosedur_kegiatan($input)
    {
        $data = [
            'id_prosedur_kegiatan'  => $input['id_prosedur_kegiatan'],
            'id_kelengkapan'    => $input['kelengkapan']
        ];

        return $this->db->insert('kelengkapan_prosedur_kegiatan', $data);
    }

    public function prosedur_khusus($id_prosedur)
    {
        return $this->db->select('prosedur_kegiatan.*, ref_kegiatan.deskripsi as kegiatan, ref_keluaran.deskripsi as keluaran, ref_pelaksana.deskripsi as pelaksana')
            ->where('id_prosedur', $id_prosedur)
            ->where('prosedur_khusus', '1')
            ->join('ref_kegiatan', 'prosedur_kegiatan.id_kegiatan=ref_kegiatan.id')
            ->join('ref_pelaksana', 'prosedur_kegiatan.id_pelaksana=ref_pelaksana.id')
            ->join('ref_keluaran', 'prosedur_kegiatan.id_keluaran=ref_keluaran.id')
            ->get('prosedur_kegiatan')
            ->result();
    }

    /**
     * Karena ada prosedur dari tipe analisis yang hampis sama dengan analisis yang lain
     * contohnya type analisis AAS dengan ICP maka fungsi ini berguna untuk mengcopy semua prosedur kegiatan
     * dari table prosedur_kegiatan dengan prosedur A dan id A ke table prosedur_kegiatan dengan prosedur A dengan id B
     *
     * @param $id_prosedur
     * @param $id_prosedur_base
     */
    public function batch_copy_prosedur_kegiatan($id_prosedur, $id_prosedur_base)
    {
        $prosedur_kegiatan_base = $this->kegiatan($id_prosedur_base);

        foreach($prosedur_kegiatan_base as $kegiatan)
        {
            $kegiatan = (array) $kegiatan;
            $data = [
                'id_prosedur'       => $id_prosedur,
                'id_kegiatan'       => $kegiatan['id_kegiatan'],
                'id_pelaksana'      => $kegiatan['id_pelaksana'],
                'waktu'             => $kegiatan['waktu'],
                'is_perhari'        => $kegiatan['is_perhari'],
                'jumlah_conto'      => $kegiatan['jumlah_conto'],
                'hari'              => $kegiatan['hari'],
                'id_keluaran'       => $kegiatan['id_keluaran'],
                'keterangan'        => $kegiatan['keterangan'],
                'order_no'          => $kegiatan['order_no'],
                'created_date'      => now()
            ];

            $this->db->insert('prosedur_kegiatan', $data);
        }
    }

    public function update_prosedur_khusus($input)
    {
        $data = [
            'prosedur_khusus'   => $input['status']
        ];

        return $this->db->where('id', $input['id'])->update('prosedur_kegiatan', $data);
    }

}
