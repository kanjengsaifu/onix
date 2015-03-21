    <h1><?php echo strtoupper($title); ?></h1>
    <hr>
    <table class="table table-data-simple">
        <thead>
        <tr>
            <th>Laboratorium</th>
            <th>Jumlah Permohonan</th>
            <th>Jumlah Conto</th>
            <th>Jumlah Permohonan Selesai</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <?php foreach($lab as $row): ?>
        <tr>
            <td><?php echo $row->nama; ?></td>
            <td class="center"><?php echo $row->jumlah_permohonan; ?></td>
            <td class="center"><?php echo is_null($row->jumlah_conto) ? 0 : $row->jumlah_conto; ?></td>
            <td class="center"><?php echo $row->jumlah_permohonan_selesai; ?></td>
            <td><a class="btn btn-xs" href="<?php echo base_url('analisis/lab/'.$row->id_lab); ?>">DETAIL</a></td>
        </tr>
        <?php endforeach; ?>
        </tbody>
    </table>