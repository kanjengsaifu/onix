<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by JetBrains PhpStorm.
 * User: Unleashed
 * Date: 10/1/13
 * Time: 8:35 PM
 */
class Kepala extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->library(array('tinyauth', 'session'));
    }

    public function index()
    {
        if(!$this->tinyauth->logged_in())
            $this->tinyauth->login_kepala();
        else
            redirect('home');
    }

}
