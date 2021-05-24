<?php

use Restserver\Libraries\REST_Controller;

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Message extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Message_model', 'mesmod');
    }
    public function index_get()
    {
        $id = $this->get('id');
        if ($id === NULL) {
            $message = $this->mesmod->getMessage();
        } else {
            $message = $this->mesmod->getMessage($id);
        }

        if ($message) {
            $this->response([
                'status' => true,
                'data' => $message,
            ], REST_Controller::HTTP_OK);
        } else {
            $this->response([
                'status' => false,
                'data' => 'ID NOT FOUND',
            ], REST_Controller::HTTP_NOT_FOUND);
        }
        // echo '<pre>';
        // print_r($message);
        // echo '</pre>';
    }
    public function index_delete()
    {
        $id = $this->delete('id');

        if ($id === null) {
            $this->response([
                'status' => false,
                'data' => 'PROVIDE AN ID',
            ], REST_Controller::HTTP_BAD_REQUEST);
        } else {
            if ($this->mesmod->deleteMessage($id) > 0) {
                //OK
                $this->response([
                    'status' => true,
                    'id' => $id,
                    'message' => 'message deleted.'
                ], REST_Controller::HTTP_OK);
            } else {
                //id not found 404
                $this->response([
                    'status' => false,
                    'data' => 'id not found',
                ], REST_Controller::HTTP_NOT_FOUND);
            }
        }
    }
    public function index_post()
    {
        $data = [
            'dari' => $this->post('dari'),
            'ke' => $this->post('ke'),
            'isi_pesan' => $this->post('isi_pesan'),
        ];

        if ($this->mesmod->createMessage($data) > 0) {
            $this->response([
                'status' => true,
                'message' => 'new message send.'
            ], REST_Controller::HTTP_CREATED);
        } else {
            $this->response([
                'status' => false,
                'data' => 'failed send message',
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
    }
    public function index_put()
    {
        $id = $this->put('id');

        $data = [
            'dari' => $this->put('dari'),
            'ke' => $this->put('ke'),
            'isi_pesan' => $this->put('isi_pesan'),
        ];

        if ($id === null) {
            $this->response([
                'status' => false,
                'data' => 'Provide an Id',
            ], REST_Controller::HTTP_BAD_REQUEST);
        } else {
            if ($this->mesmod->updateMessage($data, $id) > 0) {
                $this->response([
                    'status' => true,
                    'message' => 'message has modify send.'
                ], REST_Controller::HTTP_OK);
            } else {
                $this->response([
                    'status' => false,
                    'data' => 'failed to update message',
                ], REST_Controller::HTTP_BAD_REQUEST);
            }
        }
    }
}
