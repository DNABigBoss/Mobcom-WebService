<?php

class Resep_model extends CI_model
{

    public function getResep($id = null, $nama = null)
    {
        if ($id != null) {
            # Info resep
            $resep['info'] = $this->db->get_where('Resep', ['id' => $id])->result_array();

            # Bahan-bahan resep
            $this->db->select('bahan.nama, takaran');
            $this->db->from('bahan_resep');
            $this->db->join('bahan', 'bahan.id = bahan_resep.bahan_id', 'inner');
            $this->db->where('resep_id', $id);
            $resep['bahan'] = $this->db->get()->result_array();

            # Step resep
            $this->db->select('nomor_step, intruksi');
            $resep['step'] = $this->db->get_where('step_resep', ['resep_id' => $id])->result_array();
            return $resep;
        } else if ($nama != null) {
            $this->db->like('nama', $nama);
        }
        return $this->db->get('Resep')->result_array();
    }

    public function createResep($data)
    {
        $this->db->insert('Resep', $data);
        return $this->db->affected_rows();
    }

    public function updateResep($data, $id)
    {
        $this->db->update('Resep', $data, ['id' => $id]);
        return $this->db->affected_rows();
    }

    public function deleteResep($id)
    {
        $this->db->delete('Resep', ['id' => $id]);
        return $this->db->affected_rows();
    }
}