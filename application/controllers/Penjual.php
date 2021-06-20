<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Penjual extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->model('penjual/DashPenjual_model', 'dpj');
        date_default_timezone_set("Asia/Jakarta");
    }
    public function index()
    {
        $data['title'] = 'Dashboard Penjual';
        $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
        $this->load->view('templates/penjual/header', $data);
        $this->load->view('templates/penjual/sidebar', $data);
        $this->load->view('templates/penjual/navbar', $data);
        $this->load->view('penjual/index', $data);
        $this->load->view('templates/penjual/footer', $data);
    }
}
