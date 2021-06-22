<?php

class DashPenjual_model extends CI_Model
{
    //Only User Seller
    public function update_user_seller($where, $data)
    {
        $this->db->where('email', $where);
        $this->db->update('user', $data);
    }

    //Data Barang
    public function data_barang($user_id)
    {
        $query = "SELECT * FROM barang WHERE barang.user_id = $user_id";
        return $this->db->query($query)->result_array();
    }
    public function get_jenis()
    {
        $query = $this->db->get('jenis');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }
    }
    public function insert_barang($data)
    {
        $this->db->insert('barang', $data);
    }
    public function update_barang($where, $datas)
    {
        $this->db->where('id', $where);
        $this->db->update('barang', $datas);
    }

    //Data Riwayat Penjualan
    public function riwayat_penjualan($id)
    {
        $query = "SELECT * FROM detail_transaksi
                     JOIN transaksi ON detail_transaksi.transaksi_id = transaksi.id WHERE detail_transaksi.penjual_id = $id";
        return $this->db->query($query)->result_array();
    }
}
