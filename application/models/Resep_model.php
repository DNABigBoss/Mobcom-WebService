<?php

class Resep_model extends CI_model
{

    public function getResep($id = null, $nama = null, $limit = null, $bahan = null, $order = null)
    {
        if ($limit === null) {
            $limit = 10;
        }
        if ($id != null) {
            # Info resep
            $resep['info'] = $this->db->get_where('resep', ['id' => $id])->result_array();

            # Bahan-bahan resep
            $this->db->select('`bahan`.`nama`, takaran');
            $this->db->from('bahan_resep');
            $this->db->join('bahan', 'bahan_id = bahan.id', 'inner');
            $this->db->where('resep_id', $id);
            $resep['bahan'] = $this->db->get()->result_array();

            # Step resep
            $this->db->select('nomor_step, intruksi');
            $resep['step'] = $this->db->get_where('step_resep', ['resep_id' => $id])->result_array();

            # Diskusi
            $this->db->select("`diskusi`.`id`, `diskusi`.`isi`,`diskusi`.`user_id`,`users`.`nama`,`diskusi`.`disukai`, `diskusi`.`tanggal`");
            $this->db->from('diskusi');
            $this->db->join('users', '`users`.`id`= `diskusi`.`user_id`', 'inner');
            $this->db->where('resep_id', $id);
            $resep['diskusi'] = $this->db->get()->result_array();
            return $resep;
        } else if ($nama != null) {
            if ($order) $this->db->order_by($order, "DESC");
            $this->db->like('nama', $nama);
        } else if ($bahan != null) {
            $this->db->select('`bahan`.`id`');
            $this->db->from('bahan');
            $this->db->like('nama', $bahan);
            $bahan_ids = $this->db->get()->result_array();
            $bahan_id = array();
            foreach ($bahan_ids as $id) {
                array_push($bahan_id, (int) $id['id']);
            }
            $this->db->select('`bahan_resep`.`resep_id`');
            $this->db->from('bahan_resep');
            $this->db->where_in('bahan_id', $bahan_id);
            $resep_ids = $this->db->get()->result_array();
            $resep_id = array();
            foreach ($resep_ids as $id) {
                array_push($resep_id, (int)$id['resep_id']);
            }
            $this->db->select('*');
            $this->db->from('resep');
            $this->db->where_in('id', $resep_id);
            $this->db->limit($limit);
            if ($order) $this->db->order_by($order, "DESC");
            return $this->db->get()->result_array();
        }
        $this->db->limit($limit);
        if ($order) $this->db->order_by($order, "DESC");
        return $this->db->get('resep')->result_array();
    }

    public function createResep($data)
    {
        $this->db->insert('resep', $data);
        return $this->db->affected_rows();
    }

    public function updateResep($data, $id)
    {
        $this->db->update('resep', $data, ['id' => $id]);
        return $this->db->affected_rows();
    }

    public function deleteResep($id)
    {
        $this->db->delete('resep', ['id' => $id]);
        return $this->db->affected_rows();
    }
}