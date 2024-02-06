<?php
error_reporting(0);
?>
<html>

<head>
    <link rel="stylesheet" href="<?= base_url('assets/'); ?>bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?= base_url('assets/'); ?>bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <script src="<?= base_url('assets/'); ?>bower_components/jquery/dist/jquery.min.js"></script>
    <script src="<?= base_url('assets/'); ?>bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="<?= base_url('assets/'); ?>bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="<?= base_url('assets/'); ?>bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <title>Cetak Raport</title>
</head>

<body>

    <div style="page-break-after:always;">
        <br />
        <img src="<?= base_url('uploads/') . _school_profile()->logo; ?>" alt="Logo Sekolah" style="width:70px;height:70px;float:left;margin-bottom:10px;">
        <h3 style="line-height:5px; text-align: center;"><?= _school_profile()->nama; ?></h3>
        <h3 style="line-height:5px; text-align: center;">Akreditasi <?= _school_profile()->akreditasi; ?></h3>

        <hr style="border:0.5px solid; margin-top:-15px; margin-right:0px; width:750px; margin: auto;">
        <br>
        <p style="line-height:5px; text-align: center; margin-top:-10px; ">
            <?= _school_profile()->alamat; ?>
            <br>
            <br>

        <h4 class="text-center">DATA HASIL BELAJAR SISWA</h4>
        <h4 class="text-center">RAPORT SISWA</h4>
        <br>
        <table style="padding:15px;">
            <tr>
                <td width="150"><b>NIS</b></td>
                <td width="20">:</td>
                <td width="350"><?= $raport_data['nis']; ?></td>
                <td width="125"><b>Tahun Ajaran</b></td>
                <td width="20">:</td>
                <td><?= $raport_data['tahun_akademik']; ?></td>
            </tr>
            <tr>
                <td width="150"><b>Nama Siswa</b></td>
                <td width="20">:</td>
                <td width="350"><?= $raport_data['nama']; ?></td>
                <td width="125"><b>Semester</b></td>
                <td width="20">:</td>
                <td><?= $raport_data['semester']; ?></td>
            </tr>
            <tr>
                <td width="150"><b>Kelas</b></td>
                <td width="20">:</td>
                <td width="350"><?= $raport_data['kelas_nama']; ?></td>
                <!-- <td width="125"><b>Tanggal Cetak</b></td>
                <td width="20">:</td>
                <td><?= $raport_data['tanggal']; ?></td> -->
            </tr>
        </table>
        <br>
        <table class="table table-bordered table-striped" style="font-size:12pt;">
            <thead>
                <tr>
                    <th rowspan="2" style="text-align:center;line-height:30px;padding:0px 0px 15px 0px;">MATA PELAJARAN
                    </th>
                    <th colspan="4" style="text-align:center;padding:0px;">NILAI</th>
                    <th rowspan="2" style="text-align:center;line-height:30px;padding:0px 0px 15px 0px;">NILAI AKHIR
                    </th>
                    <th rowspan="2" style="text-align:center;line-height:30px;padding:0px 0px 15px 0px;">PREDIKAT</th>
                    <th rowspan="2" style="text-align:center;line-height:30px;padding:0px 0px 15px 0px;">KETERANGAN</th>
                </tr>
                <tr>
                    <th style="text-align:center;line-height:30px;padding:0px;">RTP</th>
                    <th style="text-align:center;line-height:30px;padding:0px;">RNU</th>
                    <th style="text-align:center;line-height:30px;padding:0px;">PTS</th>
                    <th style="text-align:center;line-height:30px;padding:0px;">UAS</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Initialize variables to hold the sum of each column and the number of rows
                $total_rtp = 0;
                $total_rnu = 0;
                $total_pts = 0;
                $total_uas = 0;
                $total_nilai_akhir = 0;
                $count_rows = count($raport_nilai);
                ?>

                <!-- Iterate through the raport_nilai data -->
                <?php foreach ($raport_nilai as $row) : ?>
                    <tr>
                        <td><?= $row['mapel_nama']; ?></td>
                        <td class="text-center"><?= $row['rata_tp']; ?></td>
                        <td class="text-center"><?= $row['rata_uh']; ?></td>
                        <td class="text-center"><?= $row['nilai_pts']; ?></td>
                        <td class="text-center"><?= $row['nilai_uas']; ?></td>
                        <td class="text-center"><?= $row['nilai_akhir']; ?></td>
                        <td class="text-center"><?= $row['nilai_huruf']; ?></td>
                        <td><?= $row['deskripsi']; ?></td>
                    </tr>

                    <!-- Add each value to the corresponding total variable -->
                    <?php
                    $total_rtp += $row['rata_tp'];
                    $total_rnu += $row['rata_uh'];
                    $total_pts += $row['nilai_pts'];
                    $total_uas += $row['nilai_uas'];
                    $total_nilai_akhir += $row['nilai_akhir'];
                    ?>
                <?php endforeach; ?>
            </tbody>
            <!-- Display the total values and the average values in the footer row -->
            <tfoot>
                <tr>
                    <td><strong>Total</strong></td>
                    <td class="text-center"><strong><?= $total_rtp; ?></strong></td>
                    <td class="text-center"><strong><?= $total_rnu; ?></strong></td>
                    <td class="text-center"><strong><?= $total_pts; ?></strong></td>
                    <td class="text-center"><strong><?= $total_uas; ?></strong></td>
                    <td class="text-center"><strong><?= $total_nilai_akhir; ?></strong></td>
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td><strong>Rata-rata</strong></td>
                    <td class="text-center"><strong><?= $count_rows > 0 ? round($total_rtp / $count_rows, 2) : 0; ?></strong></td>
                    <td class="text-center"><strong><?= $count_rows > 0 ? round($total_rnu / $count_rows, 2) : 0; ?></strong></td>
                    <td class="text-center"><strong><?= $count_rows > 0 ? round($total_pts / $count_rows, 2) : 0; ?></strong></td>
                    <td class="text-center"><strong><?= $count_rows > 0 ? round($total_uas / $count_rows, 2) : 0; ?></strong></td>
                    <td class="text-center"><strong><?= $count_rows > 0 ? round($total_nilai_akhir / $count_rows, 2) : 0; ?></strong></td>
                    <td colspan="3"></td>
                </tr>
            </tfoot>
        </table>


        <p>
            Keterangan :
            <br>
            <b>RTP</b> : Rata-rata nilai Tugas/PR
            <br>
            <b>RNU</b> : Rata-rata nilau Ulangan Harian
            <br>
            <b>PTS</b> : Penilaian Tengah Semester
            <br>
            <b>UAS</b> : Ujian Akhir Semester
        </p>
        <p style="text-align:right;margin-right:125px;"><?= $raport_data['tempat']; ?>,
            <?= date('d M Y', strtotime($raport_data['tanggal'])); ?></p>
        <table>
            <tr>
                <td class="text-center" width="500">
                    Kepala Sekolah
                    <br>
                    <?= _school_profile()->nama; ?>
                    <br>
                    <br>
                    <br>
                    <br>
                    <u><?= _school_profile()->nama_kepsek; ?></u>
                    <br>
                    NIP. <?= _school_profile()->nip_kepsek; ?>
                </td>
                <td class="text-center" width="500">
                    Wali Kelas
                    <br>
                    <br>
                    <br>
                    <br>
                    <u><?= $raport_wali['nama']; ?></u>
                    <br>
                    NIP. <?= $raport_wali['nip']; ?>
                </td>
            </tr>
        </table>
    </div>
</body>

</html>

<script>
    window.print();
</script>