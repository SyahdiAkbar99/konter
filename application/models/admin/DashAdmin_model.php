<?php

class DashAdmin_model extends CI_Model
{
    //Data User
    public function data_user()
    {
        $query = "SELECT * FROM user ORDER BY user.id ASC";
        return $this->db->query($query)->result_array();
    }
    public function status_user($where, $data)
    {
        $this->db->where('id', $where);
        $this->db->update('user', $data);
    }
    public function delete_user($where)
    {
        $this->db->where('id', $where);
        $this->db->delete('user');
    }


    public function transaction()
    {
        $data = $this->db->query("SELECT * from transaksi");
        return $data->result();
    }

    public function getPendapatan()
    {
        $query = "SELECT SUM(transaksi.total_transaksi) AS pendapatan, DATE_FORMAT(transaksi.tanggal_transaksi, '%M %Y') AS bulan
        FROM transaksi
          WHERE
            transaksi.status = 1
              
              GROUP BY MONTH(transaksi.tanggal_transaksi)
              HAVING SUM(transaksi.total_transaksi)
              ORDER BY transaksi.tanggal_transaksi ASC";

        $getPendapatan = $this->db->query($query)->result_array();

        return $getPendapatan;
    }




    //Data Banner
    public function data_banner()
    {
        $query = "SELECT * FROM data_banner ORDER BY data_banner.id ASC";
        return $this->db->query($query)->result_array();
    }
    public function insert_data_banner($data)
    {
        $this->db->insert('data_banner', $data);
    }
    public function update_data_banner($where, $data)
    {
        $this->db->where('id', $where);
        $this->db->update('data_banner', $data);
    }
    public function delete_data_banner($where)
    {
        $this->db->where('id', $where);
        $this->db->delete('data_banner');
    }

    //Only Profile User Admin
    public function update_profile($where, $data)
    {
        $this->db->where('email', $where);
        $this->db->update('user', $data);
    }
}
