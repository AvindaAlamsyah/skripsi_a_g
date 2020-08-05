<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Kandungan_model extends CI_Model {

    private $tabel = "kandungan_bahan";
    private $gabung_tabel_a = "sumber";

    public function pilih_semua()
    {
        return $this->db->get($this->tabel);
    }

    public function pilih_semua_gabung_tabel_sumber()
    {
        $this->db->select('kandungan_bahan.*, sumber.nama_sumber');
        $this->db->from($this->tabel);
        $this->db->join($this->gabung_tabel_a, 'sumber.idsumber = kandungan_bahan.sumber_idsumber', 'left');
        
        return $this->db->get();
    }

}

/* End of file Kandungan_model.php */

?>