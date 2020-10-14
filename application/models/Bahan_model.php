<?php

class Bahan_model extends CI_model
{

    public function getBahan($id = null, $nama = null, $order = null)
    {
        if ($id != null) {
            # Info Bahan
            return $this->db->get_where('bahan', ['id' => $id])->result_array();
        } else if ($nama != null) {
            $this->db->like('nama', $nama);
        } else if ($order != null) {
            $this->db->order_by('nama', $order);
        }
        return $this->db->get('bahan')->result_array();
    }

    public function createBahan($data)
    {
        $this->db->insert('bahan', $data);
        return $this->db->affected_rows();
    }

    public function updateBahan($data, $id)
    {
        $this->db->update('bahan', $data, ['id' => $id]);
        return $this->db->affected_rows();
    }

    public function deleteBahan($id)
    {
        $this->db->delete('bahan', ['id' => $id]);
        return $this->db->affected_rows();
    }
}
?>