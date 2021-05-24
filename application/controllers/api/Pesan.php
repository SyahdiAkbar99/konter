<?php

use Restserver\Libraries\REST_Controller;

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Pesan extends REST_Controller
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
        // $from = $this->input->post('from');
        // $body = $this->input->post('body');

        // $this->sendNotification($body, $from);
        // echo '<pre>';
        // print_r($message);
        // echo '</pre>';
    }
    public function index_post()
    {
        $data = [
            'dari' => $this->post('dari'),
            'ke' => $this->post('ke'),
            'isi_pesan' => $this->post('isi_pesan'),
        ];

        $from =  "Dari : " . $this->post('dari');

        $body = "Isi pesan : " . $this->post('isi_pesan');

        if ($this->mesmod->createMessage($data) > 0) {
            if ($this->sendNotification($body, $from)) {
                $this->response([
                    'status' => true,
                    'message' => 'new message send.'
                ], REST_Controller::HTTP_CREATED);
            }
            // else {
            //     $this->response([
            //         'status' => false,
            //         'data' => 'failed send message',
            //     ], REST_Controller::HTTP_BAD_REQUEST);
            // }
        } else {
            $this->response([
                'status' => false,
                'data' => 'failed send message',
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
    }
    private function sendNotification($body, $from)
    {
        $url = "https://fcm.googleapis.com/fcm/send";

        $fields = array(
            "to" => "eZtabm0ZNU4PJ8zcNqfqqi:APA91bG7Dn5rUwmsM1eM5OVAejcbC_XgC0FvdgacDryDAzmcfB6adAvI6IctspJjSWu7KCzp5lcZzam9xDhEzdSZ8_rQ185PDMdF13Q5kNdZUkR7Ij3q8pYkpgGUJd4ZKnChBirDkyXm",
            "notification" => array(
                "body" => $body,
                "title" => $from,
                // "icon" => $_REQUEST['icon'],
                "click_action" => "http://localhost/wpu-rest-server/Notif",
            )
        );

        $headers = array(
            'Authorization: key=AAAAKM9BsN0:APA91bHXKvR4IA4O_Wfepq8D7Ebe7HOjPdi4YF6MvNPcztgl8ArRzgo4V0pwSnjhuCXZC_rlkyB3OrYRUBmL7MMVs4GqXujaLG1QarbnharDEPFAVpwiwElw2zhliERoiBdMDCrq3ZJC',
            'Content-Type:application/json'
        );

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
        $result = curl_exec($ch);
        print_r($result);
        curl_close($ch);
    }
}
