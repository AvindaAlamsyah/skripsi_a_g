<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Menu_model extends CI_Model {

    private $tabel = "menu_makanan";
    private $gabung_tabel_a = "kantin";

    public function pilih_semua()
    {
        return $this->db->get($this->tabel);
    }

    public function pilih_semua_gabung_tabel_kantin()
    {
        $this->db->select('menu_makanan.*, kantin.nama_kantin');
        $this->db->from($this->tabel);
        $this->db->join($this->gabung_tabel_a, 'menu_makanan.kantin_idkantin = kantin.idkantin', 'left');
        
        return $this->db->get();
    }

    public function pilih_detil($ketentuan)
    {
        $this->db->select();
        $this->db->from($this->tabel);
        $this->db->where('idmenu_makanan', $ketentuan);
        
        return $this->db->get()->row();
    }

    public function pilih_detil_gabung_tabel_kantin($ketentuan)
    {
        $this->db->select();
        $this->db->from($this->tabel);
        $this->db->where('menu_makanan.idmenu_makanan', $ketentuan);
        $this->db->join($this->gabung_tabel_a, 'menu_makanan.kantin_idkantin = kantin.idkantin', 'left');
        
        return $this->db->get()->row();
    }

    public function pilih_detail_menurut_kode($ketentuan)
    {
        $this->db->select();
        $this->db->from($this->tabel);
        $this->db->where('kode_makanan', $ketentuan);

        return $this->db->get()->row();
    }

}

/* End of file Menu_model.php */

?>