<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Sumber_model extends CI_Model {

    private $tabel = "sumber";

    public function pilih_semua()
    {
        return $this->db->get($this->tabel);
    }

}

/* End of file Sumber_model.php */


?>