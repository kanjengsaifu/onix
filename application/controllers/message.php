<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Message extends PS_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(['message_m', 'petugas_m']);
    }

    public function index()
    {
        $messages = $this->message_m->by_message_to($this->session->userdata('logged_id'));

        if(!empty($messages))
        {
            foreach($messages as $key => $row)
            {
                $petugas_from = $this->petugas_m->find($row->message_from);
                $messages[$key]->from_name = $petugas_from->nama;
                $petugas_to = $this->petugas_m->find($row->message_to);
                $messages[$key]->to_name = $petugas_to->nama;
            }
        }

        $count_inbox = $this->message_m->count_unread_by_message_to($this->session->userdata('logged_id'));

        $data = [
            'title'             => 'Message',
            'main_content'      => 'message/message_v',
            'messages'           => $messages,
            'count_inbox'       => $count_inbox
        ];

        $this->load->view('template', $data);
    }

    public function detail($id)
    {
        $message = $this->message_m->find($id);

        // validation
        if(!$message)
        {
            redirect('message');
        }

        if(($message->message_to != $this->session->userdata('logged_id')) && ($message->message_from != $this->session->userdata('logged_id')))
        {
            redirect('message');
        }

        if($message->message_to == $this->session->userdata('logged_id'))
        {
            $input = [
                'id'        => $id,
                'value'     => TRUE
            ];

            $this->message_m->set_read($input);
        }

        $petugas_from = $this->petugas_m->find($message->message_from);
        $message->from_name = $petugas_from->nama;
        $petugas_to = $this->petugas_m->find($message->message_to);
        $message->to_name = $petugas_to->nama;

        if(!empty($message->reply_to))
        {
            $reply_to = $this->message_m->find($message->reply_to);
            $reply_to_petugas = $this->petugas_m->find($reply_to->message_from);
            $message->reply_to = $reply_to;
            $message->reply_to->from_name = $reply_to_petugas->nama;
        }

        $count_inbox = $this->message_m->count_unread_by_message_to($this->session->userdata('logged_id'));

        $js = [
            'summernote/summernote'
        ];

        $data = [
            'title'             => 'Message',
            'main_content'      => 'message/detail_message_v',
            'js'                => $js,
            'message'           => $message,
            'count_inbox'       => $count_inbox
        ];

        $this->load->view('template', $data);
    }

    public function compose()
    {
        $this->load->library('form_validation');

        $petugas = $this->petugas_m->all();

        $js = [
            'summernote/summernote'
        ];

        $data = [
            'title'             => 'Message',
            'main_content'      => 'message/compose_v',
            'js'                => $js,
            'petugas'           => $petugas
        ];

        $this->load->view('template', $data);
    }

    public function send()
    {
        $this->load->library('form_validation');

        if($this->form_validation->run())
        {
            if(!empty($_FILES['userfile']['name']))
            {
                $config['upload_path'] = 'public/attachment/';
                $config['allowed_types'] = 'gif|jpg|png|doc|docx|xls|xlxs|pdf|7z|zip|rar';
                $config['max_size']	= '3000';
                $config['file_name'] = $_FILES['userfile']['name'];

                $this->load->library('upload', $config);

                if ( ! $this->upload->do_upload())
                {
                    $this->compose();
                }
                else
                {
                    $input = $this->input->post();
                    $input['attachment'] = $this->upload->data();
                    $this->message_m->insert($input);

                    redirect('message');
                }
            }
            else
            {
                $input = $this->input->post();
                $input['attachment'] = 0;
                $this->message_m->insert($input);

                redirect('message');
            }
        }
        else
        {
            $this->compose();
        }
    }

    public function sent()
    {
        $messages = $this->message_m->by_message_from($this->session->userdata('logged_id'));

        if(!empty($messages))
        {
            foreach($messages as $key => $row)
            {
                $petugas = $this->petugas_m->find($row->message_to);
                $messages[$key]->to_name = $petugas->nama;
            }
        }

        $count_inbox = $this->message_m->count_unread_by_message_to($this->session->userdata('logged_id'));

        $data = [
            'title'             => 'Message',
            'main_content'      => 'message/message_sent_v',
            'messages'           => $messages,
            'count_inbox'       => $count_inbox
        ];

        $this->load->view('template', $data);
    }

    public function deleted()
    {
        $messages = $this->message_m->message_to_and_message_from_by_deleted($this->session->userdata('logged_id'));

        if(!empty($messages))
        {
            foreach($messages as $key => $row)
            {
                $petugas = $this->petugas_m->find($row->message_to);
                $messages[$key]->to_name = $petugas->nama;
            }
        }

        $count_inbox = $this->message_m->count_unread_by_message_to($this->session->userdata('logged_id'));

        $data = [
            'title'             => 'Message',
            'main_content'      => 'message/message_deleted_v',
            'messages'           => $messages,
            'count_inbox'       => $count_inbox
        ];

        $this->load->view('template', $data);
    }

    public function trash()
    {
        $input = [
            'id'        => $this->input->post('id'),
            'value'     => TRUE
        ];

        $this->message_m->set_delete($input);

        redirect('message');
    }
}
