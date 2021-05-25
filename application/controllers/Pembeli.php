<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pembeli extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->model('pembeli/DashPembeli_model', 'dpm');
        date_default_timezone_set("Asia/Jakarta");
    }
    public function index()
    {
        $data['title'] = 'Home';
        $this->load->view('templates/pembeli/header', $data);
        $this->load->view('templates/pembeli/navbar', $data);
        $this->load->view('pembeli/index', $data);
        $this->load->view('templates/pembeli/footer', $data);
    }
}
