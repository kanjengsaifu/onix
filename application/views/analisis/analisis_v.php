<h1>Permohonan <?php echo $title; ?></h1>
<hr>

<table class="table table-data">
    <thead>
    <tr>
        <th>No</th>
        <th>Nomor Analisis</th>
        <th>Jenis Conto</th>
        <th>Jumlah Conto</th>
        <th>Tanggal Daftar</th>
        <th>Status</th>
        <th>Aksi</th>
    </tr>
    </thead>
    <tbody>
    <?php $no=1; foreach ($analisis as $row): ?>
    <tr>
        <td><?php echo $no++; ?></td>
        <td><?php echo $row->nomor_analisis; ?></td>
        <td><?php echo $row->jenis_conto; ?></td>
        <td><?php echo $row->jumlah_conto; ?></td>
        <td><?php echo tanggal_format_indonesia($row->tanggal_terima); ?></td>
        <td class="status">
            <?php echo status_label($row->is_selesai); ?>
        </td>
        <td>
            <a href="<?php echo base_url('analisis/detail/'.$row->id); ?>" class="btn btn-xs">MULAI ANALISIS</a>

            <?php if($row->is_selesai == 0): ?>
                <button class="btn btn-primary btn-xs" onclick="selesai_analisis('<?php echo $row->id_analisis; ?>')">selesai</button>
            <?php else: ?>
                <button class="btn btn-warning btn-xs" onclick="reproses_analisis('<?php echo $row->id_analisis; ?>')">ulangi <i class="glyphicon glyphicon-refresh"></i> </button>
            <?php endif; ?>
        </td>
    </tr>
        <?php endforeach; ?>
    </tbody>
</table>
<sup>*Klik Selesai jika sudah selesai menganalisis</sup>