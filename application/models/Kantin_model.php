<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Kantin_model extends CI_Model {

    private $tabel = "kantin";

    public function pilih_semua()
    {
        return $this->db->get($this->tabel);
    }

}

/* End of file Kantin_model.php */

?>