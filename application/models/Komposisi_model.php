<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Komposisi_model extends CI_Model {

    private $tabel = "komposisi";
    private $gabung_tabel_a = "menu_makanan";

    public function pilih_semua()
    {
        return $this->db->get($this->tabel);
    }

    public function pilih_semua_gabung_tabel_menu(Type $var = null)
    {
        $this->db->select('field1, field2');
        
    }

}

/* End of file Komposisi_model.php */

?>