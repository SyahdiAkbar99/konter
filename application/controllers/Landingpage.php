<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Landingpage extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        if ($this->session->userdata('email')) {
            if ($this->session->userdata('role_id') == 1) {
                redirect('admin');
            } elseif ($this->session->userdata('role_id') == 2) {
                redirect('penjual');
            } elseif ($this->session->userdata('role_id') == 3) {
                redirect('pembeli');
            }
        }
        $this->load->model('pembeli/DashPembeli_model', 'dpm');
        date_default_timezone_set("Asia/Jakarta");
    }

    public function index()
    {
        $data['title'] = 'Home';
        $this->load->view('templates/landingpage/header', $data);
        $this->load->view('templates/landingpage/navbar', $data);
        $this->load->view('landingpage/index', $data);
        $this->load->view('templates/landingpage/footer', $data);
    }
}
