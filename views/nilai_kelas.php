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

        <h4 class="text-center">DATA HASIL BELAJAR SISWA</h4>
        <h4 class="text-center">RAPORT SISWA</h4>
        <br>
        <table style="padding:15px;">


        <tr>
        <td width="150"><b>Kelas</b></td>
<td width="20">:</td>
<td width="350"><?=$kelas_nama;?></td>

</tr>

<table class="table table-bordered table-striped" style="font-size:12pt;">
    <thead>
        <tr>
            <th rowspan="2" style="text-align:center;line-height:30px;padding:0px 0px 15px 0px;">SISWA</th>
            <?php foreach ($mapel_data as $mapel): ?>
                <th colspan="1" style="text-align:center;padding:0px;"><?php echo $mapel->mapel_nama; ?></th>
            <?php endforeach;?>
        </tr>
        <tr>
            <?php foreach ($mapel_data as $mapel): ?>
                <th colspan="1" style="text-align:center;padding:0px;">Nilai</th>
            <?php endforeach;?>
            <th style="text-align:center;padding:0px;">&nbsp;</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($siswa_data as $siswa): ?>
            <tr>
                <td><?php echo $siswa->nama; ?></td>
                <?php foreach ($mapel_data as $mapel): ?>
                    <td><?php echo $mapel->nilai_akhir; ?></td>
                <?php endforeach;?>

            </tr>
        <?php endforeach;?>
    </tbody>
</table>











    </div>
</body>

</html>

<script>
    window.print();
</script>
