<?php
error_reporting(0);
?>
<html>

<head>
    <link rel="stylesheet" href="<?=base_url('assets/');?>bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?=base_url('assets/');?>bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <script src="<?=base_url('assets/');?>bower_components/jquery/dist/jquery.min.js"></script>
    <script src="<?=base_url('assets/');?>bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="<?=base_url('assets/');?>bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="<?=base_url('assets/');?>bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <title>Data Niali Perkelas</title>
    <style>
        @page {
            size: landscape;
        }
    </style>
</head>

<body>

    <div style="page-break-after:always;">
        <br />
        <img src="<?=base_url('uploads/') . _school_profile()->logo;?>" alt="Logo Sekolah" style="width:70px;height:70px;float:left;margin-bottom:10px;">
        <h3 style="line-height:5px; text-align: center;"><?=_school_profile()->nama;?></h3>
        <h3 style="line-height:5px; text-align: center;">Akreditasi <?=_school_profile()->akreditasi;?></h3>

        <hr style="border:0.5px solid; margin-top:-15px; margin-right:0px; width:750px; margin: auto;">
        <br>
        <p style="line-height:5px; text-align: center; margin-top:-10px; ">
            <?=_school_profile()->alamat;?>
            <br>
            <br>

        <h4 class="text-center">DATA SISWA PERKELAS</h4>
        <br>
        <table style="padding:15px;">


        <tr>
        <td width="150"><b>Kelas</b></td>
<td width="20">:</td>
<td width="350"><?=$kelas_nama;?></td>

</tr>


<!-- Tampilkan daftar siswa -->
<!-- Tampilkan data siswa dalam tabel -->
<table class="table table-bordered table-striped" style="font-size:12pt;">
    <thead>
        <tr>
            <th width="5">NO</th>
            <th>NIS</th>
            <th>NISN</th>
            <th>NAMA LENGKAP</th>
            <th>TTL</th>
            <th>JK</th>
            <th>ALAMAT</th>
        </tr>
    </thead>
    <tbody>
        <?php
        $n = 1;
        foreach ($siswa_data as $siswa) : ?>
            <tr>
                <td><?= $n++ . '.'; ?></td>
                <td><?= $siswa->nis; ?></td>
                <td><?= $siswa->nisn; ?></td>
                <td><?= $siswa->nama; ?></td>
                <td><?= $siswa->tmp_lhr . ', ' . date('d M Y', strtotime($siswa->tgl_lhr)); ?></td>
                <td><?= $siswa->jk == 'L' ? 'Laki-Laki' : 'Perempuan'; ?></td>
                <td><?= $siswa->alamat; ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>


<p style="text-align:right;margin-right:125px;">Padang,
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
            </tr>
        </table>











    </div>
</body>

</html>

<script>
    window.print();
</script>
