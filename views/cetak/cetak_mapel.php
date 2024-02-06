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
    <title>Cetak Mata Pelajaran</title>
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

        <h4 class="text-center">LAPORAN DATA MATA PELAJARAN</h4>

        <br>
        <table style="padding:15px;">

        </table>
        <br>
        <table class="table table-bordered table-striped" style="font-size:12pt;">
        <thead>
                    <tr>
                        <th width="5">NO</th>
                        <th>KODE</th>
                        <th>MATA PELAJARAN</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $n = 1;
                    foreach ($mapel as $row) : ?>
                        <tr>
                            <td><?= $n++ . '.'; ?></td>
                            </td>
                            <td><?= $row->mapel_kd; ?></td>
                            <td><?= $row->mapel_nama; ?></td>

                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
        </table>

        <table>
            <tr>
                <td align="left" width="500">
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
