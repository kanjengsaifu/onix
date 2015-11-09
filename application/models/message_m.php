<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Message_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function find($id)
    {
        return $this->db->where('id', $id)->limit(1)->get('message')->row();
    }

    /**
     * Show inbox Message
     * @param $to
     * @return mixed
     */
    public function by_message_to($to)
    {
        return $this->db->where('message_to', $to)->where('is_deleted', 0)->order_by('created_date', 'desc')->get('message')->result();
    }

    public function message_to_and_message_from_by_deleted($id)
    {
        return $this->db->where('message_to', $id)->where('message_from', $id)->where('is_deleted', 1)->order_by('created_date', 'desc')->get('message')->result();
    }


    /**
     * Show sent Message
     * @param $from
     * @return mixed
     */
    public function by_message_from($from)
    {
        return $this->db->where('message_from', $from)->where('is_deleted', 0)->order_by('created_date', 'desc')->get('message')->result();
    }

    public function insert($input)
    {
        $data = [];
        foreach($input['to'] as $message_to)
        {
            $data[] = [
                'message_from'          => $this->session->userdata('logged_id'),
                'message_to'            => $message_to,
                'subject'               => $input['subject'],
                'message'               => $input['message'],
                'reply_to'              => $input['reply_to'],
                'attachment'            => json_encode($input['attachment']),
                'created_date'          => now()
            ];
        }

         return $this->db->insert_batch('message', $data);
    }

    public function set_read($input)
    {
        $data = [
            'is_readed'     => $input['value']
        ];

        return $this->db->where('id', $input['id'])->update('message', $data);
    }

    public function set_delete($input)
    {
        $data = [
            'is_deleted'     => $input['value']
        ];

        return $this->db->where('id', $input['id'])->update('message', $data);
    }

    /**
     * Count Inbox
     * @param $to
     * @return CI_DB_active_record
     */
    public function count_unread_by_message_to($to)
    {
        $result = $this->db->select('count(id) as jumlah')->where('message_to', $to)->where('is_readed', 0)->get('message')->row();

        return $result->jumlah;
    }
}
