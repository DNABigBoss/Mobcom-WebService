<?php
defined('BASEPATH') or exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class Resep extends RESTController
{

    function __construct()
    {
        // Construct the parent class
        parent::__construct();
        $this->load->model('Resep_model', 'resep');
    }

    public function index_get()
    {
        $id = $this->get('id');
        $nama = $this->get('nama');

        if ($id === null && $nama === null) {
            $resep = $this->resep->getResep();
        } elseif ($id !== null && $nama !== null) {
            $this->response([
                'status' => false,
                'message' => 'Bad Request data'
            ], 400);
        } else {
            if ($nama != null) {
                $resep = $this->resep->getResep($id = null, $nama);
            } else {
                $resep = $this->resep->getResep($id);
            }
        }

        if ($resep) {
            // Set the response and exit
            $this->response($resep, 200);
        } else {
            // Set the response and exit
            $this->response([
                'status' => false,
                'message' => 'No Resep were found'
            ], 404);
        }
    }

    public function index_post()
    {
        $data = [
            'nama' => $this->post('nama'),
            'waktu_memasak' => $this->post('waktu_memasak'),
            'porsi' => $this->post('porsi'),
            'harga' => $this->post('harga'),
            'favorit' => $this->post('favorit'),
            'dilihat' => $this->post('dilihat'),
            'gambar' => $this->post('gambar'),
        ];

        if ($this->resep->createResep($data) > 0) {
            // Success
            $this->response([
                'status' => true,
                'message' => 'Successfully Created'
            ], 201);
        } else {
            // id not found
            $this->response([
                'status' => false,
                'message' => 'Fail created new data'
            ], 400);
        }
    }

    public function index_put()
    {
        $id = $this->put('id');
        $data = [
            'nama' => $this->put('nama'),
            'waktu_memasak' => $this->put('waktu_memasak'),
            'porsi' => $this->put('porsi'),
            'harga' => $this->put('harga'),
            'favorit' => $this->put('favorit'),
            'dilihat' => $this->put('dilihat'),
            'gambar' => $this->put('gambar'),
        ];

        if ($this->resep->updateResep($data, $id) > 0) {
            // Success
            $this->response([
                'status' => true,
                'message' => 'Successfully Updated'
            ], 202);
        } else {
            // id not found
            $this->response([
                'status' => false,
                'message' => 'Fail updated data'
            ], 400);
        }
    }

    public function index_delete()
    {
        $id = $this->delete('id');

        if ($id === null) {
            $this->response([
                'status' => false,
                'message' => 'Provide an id'
            ], 400);
        } else {
            if ($this->resep->deleteResep($id) > 0) {
                // Success
                $this->response([
                    'status' => true,
                    'id' => $id,
                    'message' => 'Successfully deleted'
                ], 204);
            } else {
                // id not found
                $this->response([
                    'status' => false,
                    'message' => 'Id not found'
                ], 400);
            }
        }
    }
}