<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Raport extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        is_logged_in();
        $this->load->model('nilai_m');
    }

    public function index()
    {
        $data['report'] = true;
        $data['content'] = 'raport';
        $this->load->view('index', $data);
    }
    public function cetak()
    {
        $idtahun_akademik = $this->input->post('idtahun_akademik', true);
        $semester = $this->input->post('semester', true);
        $idkelas = $this->input->post('idkelas', true);
        $idsiswa = $this->input->post('idsiswa', true);
        $data['raport_data'] = $this->nilai_m->getDataRaport($idtahun_akademik, $semester, $idkelas, $idsiswa);
        $data['raport_wali'] = $this->nilai_m->getDataWali($idtahun_akademik, $semester, $idkelas);
        $data['raport_nilai'] = $this->nilai_m->getDataNilai($idtahun_akademik, $semester, $idkelas, $idsiswa);
        $this->load->view('cetak_raport', $data);
    }
    public function siswa()
    {
        $data['report_siswa'] = true;
        $data['content'] = 'raport_siswa';
        $this->load->view('index', $data);
    }
    public function cetak_siswa($nis)
    {
        $idtahun_akademik = $this->input->post('idtahun_akademik', true);
        $semester = $this->input->post('semester', true);
        $row = $this->db->select('x.idkelas,x1.idsiswa')
            ->join('rombel x1', 'x1.idwali_kelas = x.idwali_kelas', 'left')
            ->join('siswa x2', 'x2.idsiswa = x1.idsiswa', 'left')
            ->where(['x.idtahun_akademik' => $idtahun_akademik, 'x.semester' => $semester, 'x2.nis' => $nis])
            ->get('wali_kelas x')->row();
        if ($row == null) {
            redirect('raport/siswa', 'refresh');
        }
        $idkelas = $row->idkelas;
        $idsiswa = $row->idsiswa;
        $data['raport_data'] = $this->nilai_m->getDataRaport($idtahun_akademik, $semester, $idkelas, $idsiswa);
        $data['raport_wali'] = $this->nilai_m->getDataWali($idtahun_akademik, $semester, $idkelas);
        $data['raport_nilai'] = $this->nilai_m->getDataNilai($idtahun_akademik, $semester, $idkelas, $idsiswa);
        $this->load->view('cetak_raport', $data);
    }

    public function cetak_kelas()
    {
        $idtahun_akademik = $this->input->post('idtahun_akademik', true);
        $semester = $this->input->post('semester', true);
        $idkelas = $this->input->post('idkelas', true);

        // Mendapatkan nama kelas dari database
        $kelas_nama = $this->db->select('kelas_nama')
            ->where('idkelas', $idkelas)
            ->get('kelas')->row()->kelas_nama;

        // Mendapatkan data siswa berdasarkan tahun akademik, semester, dan kelas
        $siswa_data = $this->db->select('siswa.nama, siswa.nis, siswa.nisn, siswa.tmp_lhr, siswa.tgl_lhr, siswa.jk, siswa.alamat')
            ->join('rombel', 'rombel.idwali_kelas = wali_kelas.idwali_kelas', 'left')
            ->join('siswa', 'siswa.idsiswa = rombel.idsiswa', 'left')
            ->where(['wali_kelas.idtahun_akademik' => $idtahun_akademik, 'wali_kelas.semester' => $semester, 'wali_kelas.idkelas' => $idkelas])
            ->get('wali_kelas')->result();

        // Mendapatkan nama-nama mata pelajaran
        $mapel_data = $this->db->select('mapel.mapel_nama, nilai.nilai_akhir')
            ->join('tahun_akademik', 'tahun_akademik.idtahun_akademik = nilai.idtahun_akademik', 'left')
            ->join('mapel', 'mapel.idmapel = nilai.idmapel', 'left')
            ->where(['nilai.idtahun_akademik' => $idtahun_akademik, 'nilai.semester' => $semester, 'nilai.idkelas' => $idkelas])
            ->group_by('mapel.mapel_nama')
            ->get('nilai')->result();

        $data['siswa_data'] = $siswa_data;
        $data['kelas_nama'] = $kelas_nama;
        $data['mapel_data'] = $mapel_data;
        $this->load->view('nilai_kelas', $data);
    }

    // public function cetak_kelas()
    // {
    //     $idtahun_akademik = $this->input->post('idtahun_akademik', true);
    //     $semester = $this->input->post('semester', true);
    //     $idkelas = $this->input->post('idkelas', true);

    //     // Mendapatkan nama kelas dari database
    //     $kelas_nama = $this->db->select('kelas_nama')
    //         ->where('idkelas', $idkelas)
    //         ->get('kelas')->row()->kelas_nama;

    //     // Mendapatkan data siswa berdasarkan tahun akademik, semester, dan kelas
    //     $siswa_data = $this->db->select('siswa.nama')
    //         ->join('rombel', 'rombel.idwali_kelas = wali_kelas.idwali_kelas', 'left')
    //         ->join('siswa', 'siswa.idsiswa = rombel.idsiswa', 'left')
    //         ->where(['wali_kelas.idtahun_akademik' => $idtahun_akademik, 'wali_kelas.semester' => $semester, 'wali_kelas.idkelas' => $idkelas])
    //         ->get('wali_kelas')->result();

    //     // Mendapatkan nama-nama mata pelajaran
    //     $mapel_data = $this->db->select('mapel.mapel_nama, nilai.nilai_akhir')
    //         ->join('tahun_akademik', 'tahun_akademik.idtahun_akademik = nilai.idtahun_akademik', 'left')
    //         ->join('mapel', 'mapel.idmapel = nilai.idmapel', 'left')
    //         ->where(['nilai.idtahun_akademik' => $idtahun_akademik, 'nilai.semester' => $semester, 'nilai.idkelas' => $idkelas])
    //         ->group_by('mapel.mapel_nama')
    //         ->get('nilai')->result();

    //     $data['siswa_data'] = $siswa_data;
    //     $data['kelas_nama'] = $kelas_nama;
    //     $data['mapel_data'] = $mapel_data;
    //     $this->load->view('nilai_kelas', $data);
    // }

}

/* End of file Raport.php */
