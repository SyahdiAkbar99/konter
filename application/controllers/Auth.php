<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{
    public function index()
    {
        if ($this->session->userdata('email')) {
            //astagfirullah ternyata bisa digunain pas pakek form 403 Access Forbidden kodingan kek gini :(
            if ($this->session->userdata('role_id') == 1) {
                redirect('admin');
            } elseif ($this->session->userdata('role_id') == 2) {
                redirect('penjual');
            } elseif ($this->session->userdata('role_id') == 3) {
                redirect('pembeli');
            }
        }
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email');
        $this->form_validation->set_rules('password', 'Password', 'required|trim');
        if ($this->form_validation->run() == false) {
            $data['title'] = 'Login';
            $this->load->view('templates/auth/header', $data);
            $this->load->view('auth/index', $data);
            $this->load->view('templates/auth/footer', $data);
        } else {
            $this->_login();
        }
    }



    //fungsi login
    private function _login()
    {
        $email = $this->input->post('email');
        $password = $this->input->post('password');

        $user = $this->db->get_where('user', ['email' => $email])->row_array();

        // echo '<pre>';
        // print_r($user);
        // die;
        // echo '</pre>';

        //jika usernya ada
        if ($user) {
            //jika usernya aktif
            if ($user['is_active'] == 1) {
                //cek passwordnya
                if (password_verify($password, $user['password'])) {
                    $data = [
                        'id' => $user['id'],
                        'email' => $user['email'],
                        'role_id' => $user['role_id'],
                    ];
                    $this->session->set_userdata($data);
                    if ($user['role_id'] == 1) {
                        redirect('admin');
                    } elseif ($user['role_id'] == 2) {
                        redirect('penjual');
                    } else {
                        redirect('pembeli');
                    }
                } else {
                    $this->session->set_flashdata(
                        'message',
                        '<div class="alert alert-danger" role="alert">
                        Password salah !
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                    </div>'
                    );
                    redirect('auth');
                }
            } else {
                $this->session->set_flashdata(
                    'message',
                    '<div class="alert alert-danger" role="alert">
                    Email belum diaktifkan !
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                </div>'
                );
                redirect('auth');
            }
        } else {
            $this->session->set_flashdata(
                'message',
                '<div class="alert alert-danger" role="alert">
                Email belum terdaftar !
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>'
            );
            redirect('auth');
        }
    }



    public function registration()
    {
        // ========================================
        if ($this->session->userdata('email')) {
            //astagfirullah ternyata bisa digunain pas pakek form 403 Access Forbidden kodingan kek gini :(
            if ($this->session->userdata('role_id') == 1) {
                redirect('admin');
            } elseif ($this->session->userdata('role_id') == 2) {
                redirect('penjual');
            } elseif ($this->session->userdata('role_id') == 3) {
                redirect('pembeli');
            }
        }
        // ========================================

        $this->form_validation->set_rules('name', 'Name', 'required|trim');
        $this->form_validation->set_rules('email', 'Email', 'required|trim|valid_email|is_unique[user.email]', [
            'is_unique' => '%s sudah didaftarkan',
        ]);
        $this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[6]|matches[password2]');
        $this->form_validation->set_rules('password2', 'Ulangi Password', 'required|trim|min_length[6]|matches[password1]');
        $this->form_validation->set_rules('no_telp', 'No Telpon', 'required|trim|min_length[10]|max_length[14]|numeric');
        $this->form_validation->set_rules('alamat', 'Alamat', 'required|trim');
        $this->form_validation->set_rules('no_rekening', 'No Rekening', 'required|trim');
        $this->form_validation->set_rules('nama_bank', 'Nama Bank', 'required|trim');

        if ($this->form_validation->run() == false) {
            $data['title'] = 'Registrasi';
            $data['role_id'] = $this->db->get('user_role')->result_array();
            $this->load->view('templates/auth/header', $data);
            $this->load->view('auth/registrasi', $data);
            $this->load->view('templates/auth/footer', $data);
        } else {
            $data = [
                'name' => htmlspecialchars($this->input->post('name', true)),
                'email' => htmlspecialchars($this->input->post('email', true)),
                'image' => 'default.png',
                'password' => password_hash(htmlspecialchars($this->input->post('password1')), PASSWORD_DEFAULT),
                'no_telp' => htmlspecialchars('62' . $this->input->post('no_telp')),
                'alamat' => htmlspecialchars($this->input->post('alamat')),
                'role_id' => htmlspecialchars($this->input->post('role_id')),
                'is_active' => 1,
                'date_created' => time(),
                'no_rekening' => htmlspecialchars($this->input->post('no_rekening')),
                'nama_bank' => htmlspecialchars($this->input->post('nama_bank')),
            ];
            $true = $this->db->insert('user', $data);
            if ($true == true) {
                $this->session->set_flashdata(
                    'message',
                    '<div class="alert alert-success mx-5" role="alert">
                    Akun anda sudah terdaftar!
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                </div>'
                );
                redirect('auth');
            } else {
                $this->session->set_flashdata(
                    'message',
                    '<div class="alert alert-danger mx-5" role="alert">
                    Maaf Akun anda gagal didaftarkan !
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                </div>'
                );
                redirect('auth');
            }
        }
    }

























































    //untuk logout
    public function logout()
    {
        // $this->session->unset_userdata('id');
        $this->session->unset_userdata('email');
        $this->session->unset_userdata('role_id');
        $this->session->set_flashdata(
            'message',
            '<div class="alert alert-success mx-4" role="alert">
            Berhasil logout!
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
        </div>'
        );
        redirect('auth');
    }
}
