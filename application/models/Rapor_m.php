<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Rapor_m extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function get_siswa_by_kelas($tahun_akademik, $semester, $idkelas)
    {
        // Query untuk mengambil data siswa berdasarkan tahun akademik, semester, dan kelas
        $this->db->select('siswa.nama_siswa');
        $this->db->from('siswa');
        $this->db->join('nilai', 'siswa.idsiswa = nilai.idsiswa');
        $this->db->where('nilai.tahun_akademik', $tahun_akademik);
        $this->db->where('nilai.semester', $semester);
        $this->db->where('siswa.idkelas', $idkelas);
        $query = $this->db->get();

        return $query->result();
    }

}
