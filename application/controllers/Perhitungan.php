<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Perhitungan extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('menu_model');
    }

    public $data_pengguna = array(
        'umur' => "",
        'berat_badan' => "",
        'tinggi_badan' => "",
        'jenis_kelamin' => "",
        'kegiatan' => ""
    );
    public $kebutuhan_pengguna = array(
        'kebutuhan_kalori' => "",
        'kebutuhan_karbo' => "",
        'kebutuhan_protein' => "",
        'kebutuhan_lemak' => ""
    );
    public $populasi = array();
    public $crossover_rate = 0.4;
    public $mutation_rate = 0.4;
    public $ukuran_populasi = 5;
    public $ukuran_generasi = 10;
    public $temp_elitsm = array();

    public function index()
    {
        $this->data_pengguna = array(
            'umur' => $this->input->post('umur'),
            'berat_badan' => $this->input->post('berat'),
            'tinggi_badan' => $this->input->post('tinggi'),
            'jenis_kelamin' => $this->input->post('jenis'),
            'kegiatan' => $this->input->post('kegiatan')
        );

        $this->perhitungan_kebutuhan_pengguna($this->data_pengguna);

        $this->populasi[1] = $this->populasi_awal($this->ukuran_populasi);


        // $bantu = 0;
        // for ($i = 1; $i < $this->ukuran_generasi; $i++) {
        //     $this->populasi[$i] = $this->fungsi_evaluasi($this->populasi[$i], $this->ukuran_populasi);
        //     $this->populasi[$i] = $this->seleksi($this->populasi[$i], $this->ukuran_populasi);
        //     $this->populasi[$i] = $this->crossover($this->populasi[$i], $this->ukuran_populasi);
        // }

        $this->populasi[1] = $this->fungsi_evaluasi($this->populasi[1],$this->ukuran_populasi);
        $this->populasi[2] = $this->crossover($this->populasi[1],$this->ukuran_populasi);
        //$this->populasi[3] = $this->mutasi($this->populasi[]);

        echo json_encode($this->populasi);
    }

    public function perhitungan_kebutuhan_pengguna($data_pengguna)
    {
        if ($data_pengguna['jenis_kelamin'] == "L") {
            $this->kebutuhan_pengguna['kebutuhan_kalori'] = (66.473 + (13.7516 * $data_pengguna['berat_badan']) + (5.0033 * $data_pengguna['tinggi_badan']) - (6.755 * $data_pengguna['umur'])) * $data_pengguna['kegiatan'];
        } else {
            $this->kebutuhan_pengguna['kebutuhan_kalori'] = (655.0955 + (9.5634 * $data_pengguna['berat_badan']) + (1.8496 * $data_pengguna['tinggi_badan']) - (4.6756 * $data_pengguna['umur'])) * $data_pengguna['kegiatan'];
        }

        $this->kebutuhan_pengguna['kebutuhan_karbo'] = ($this->kebutuhan_pengguna['kebutuhan_kalori'] * 60 / 100);
        $this->kebutuhan_pengguna['kebutuhan_protein'] = ($this->kebutuhan_pengguna['kebutuhan_kalori'] * 15 / 100);
        $this->kebutuhan_pengguna['kebutuhan_lemak'] = ($this->kebutuhan_pengguna['kebutuhan_kalori'] * 25 / 100);
    }

    public function populasi_awal($jumlah_populasi)
    {
        $individu = array();
        $total_kalori = 0;
        $total_karbohidrat = 0;
        $total_lemak = 0;
        $total_protein = 0;

        for ($i = 0; $i < $jumlah_populasi; $i++) {
            $kromosom = array("1" => mt_rand(1, 40), "2" => mt_rand(1, 40), "3" => mt_rand(1, 40));
            for ($j = 1; $j <= count($kromosom); $j++) {
                $query = $this->menu_model->pilih_detail_menurut_kode($kromosom[$j]);
                $total_kalori += $query->total_kalori_makanan;
                $total_karbohidrat += $query->total_karbohidrat_makanan;
                $total_protein += $query->total_protein_makanan;
                $total_lemak += $query->total_lemak_makanan;
            }
            $individu[$i]['kromosom'] = $kromosom;
            $individu[$i]['total_kalori'] = $total_kalori;
            $individu[$i]['total_karbo'] = $total_karbohidrat * 4;
            $individu[$i]['total_protein'] = $total_protein * 4;
            $individu[$i]['total_lemak'] = $total_lemak * 9;
            $total_kalori = 0;
            $total_karbohidrat = 0;
            $total_protein = 0;
            $total_lemak = 0;
        }
        return $individu;
    }

    public function fungsi_evaluasi($individu, $ukuran_populasi)
    {

        for ($i = 0; $i < $ukuran_populasi; $i++) {
            $individu[$i]['nilai_fitness'] = abs($individu[$i]['total_kalori'] - $this->kebutuhan_pengguna['kebutuhan_kalori']) + abs($individu[$i]['total_karbo'] - $this->kebutuhan_pengguna['kebutuhan_karbo']) + abs($individu[$i]['total_protein'] - $this->kebutuhan_pengguna['kebutuhan_protein']) + abs($individu[$i]['total_lemak'] - $this->kebutuhan_pengguna['kebutuhan_lemak']);
        }

        $var_bantu = 9999999;
        for ($i = 0; $i < count($individu); $i++) {
            if ($individu[$i]['nilai_fitness'] <= $var_bantu) {
                $this->temp_elitsm = $individu[$i];
                $var_bantu = $individu[$i]['nilai_fitness'];
            }
        }

        return $individu;
    }

    public function seleksi($individu, $ukuran_populasi)
    {
        $total_invers = 0;
        for ($i = 0; $i < $ukuran_populasi; $i++) {
            $individu[$i]['invers_fitness'] = 1 / $individu[$i]['nilai_fitness'];
            $total_invers = $total_invers + $individu[$i]['invers_fitness'];
        }

        for ($i = 0; $i < $ukuran_populasi; $i++) {
            $individu[$i]['fitness_relative'] = $individu[$i]['invers_fitness'] / $total_invers;
        }

        $nilai_roullete = array();
        $individu_roullete = array();
        $var_bantu_min = 0;
        $var_bantu_max = 0;
        for ($i = 0; $i < $ukuran_populasi; $i++) {
            $nilai_roullete[$i] = mt_rand() / mt_getrandmax();
            for ($j = 0; $j < $ukuran_populasi; $j++) {
                $var_bantu_max = $var_bantu_max + $individu[$j]['fitness_relative'];
                if ($nilai_roullete[$i] >= $var_bantu_min and $nilai_roullete[$i] <= $var_bantu_max) {
                    $individu_roullete[$i] = $individu[$j];
                    break;
                }
                $var_bantu = $individu[$j]['fitness_relative'] + 0.000001;
            }

        }

        return $in = array("1" => $nilai_roullete, "2" => $individu_roullete);
    }

    public function crossover($individu, $ukuran_populasi)
    {
        $nilai_acak = array();
        
        do {
            $var_bantu = 0;
            for ($i=0; $i < $ukuran_populasi; $i++) { 
                $nilai_acak[$i] = mt_rand() / mt_getrandmax();
                if ($nilai_acak[$i] <= $this->crossover_rate) {
                    $var_bantu = $var_bantu + 1;
                }
            }
        } while ($var_bantu <= $this->crossover_rate * $this->ukuran_populasi);
        

        $induk = array();
        for ($i=0; $i < $ukuran_populasi; $i++) { 
            if ($nilai_acak[$i] <= $this->crossover_rate) {
                $induk[$i] = $individu[$i];
            }

            if (count($induk) == ($this->crossover_rate * $this->ukuran_populasi)) {
                break;
            }
        }

        $array_bantu = array_keys($induk);
        $array_bantu_2 = array();
        $temp = 0;
        for ($i=0; $i < count($induk); $i = $i+2) { 
            $array_bantu_2[1] = current($induk);
            $array_bantu_2[2] = next($induk);
            $temp = $array_bantu_2[1]['kromosom']['2'];
            $array_bantu_2[1]['kromosom']['2'] = $array_bantu_2[2]['kromosom']['2'];
            $array_bantu_2[2]['kromosom']['2'] = $temp;
            $induk[$array_bantu[$i]] = $array_bantu_2[1];
            $induk[$array_bantu[$i+1]] = $array_bantu_2[2];
            next($induk);
        }

        array_replace_recursive($individu,$induk);
        
        return $individu;
    }

    public function mutasi($individu)
    {
        $nilai_acak = array();
        
        do {
            $var_bantu = 0;
            for ($i=0; $i < $this->ukuran_populasi; $i++) { 
                $nilai_acak[$i] = mt_rand() / mt_getrandmax();
                if ($nilai_acak[$i] <= $this->mutation_rate) {
                    $var_bantu = $var_bantu + 1;
                }
            }
        } while ($var_bantu <= $this->mutation_rate * $this->ukuran_populasi);

        $individu_mutasi = array();
        for ($i=0; $i < $this->ukuran_populasi; $i++) { 
            if ($nilai_acak[$i] <= $this->mutation_rate) {
                $individu_mutasi[$i] = $individu[$i];
            }

            if (count($individu_mutasi) == ($this->mutation_rate * $this->ukuran_populasi)) {
                break;
            }
        }
        
        $array_bantu = array_keys($individu_mutasi);
        for ($i=0; $i < count($individu_mutasi); $i++) { 
            $individu_mutasi[$array_bantu[$i]]['kromosom'][mt_rand(1,3)] = mt_rand(1,40);
        }
        
        array_replace($individu,$individu_mutasi);

        return $acak = array("index"=>$array_bantu, "anak"=>$individu);
    }
}

/* End of file Perhitungan.php */
