<?php if($this->tinyauth->is_admin() OR $this->tinyauth->is_kepala() OR substr($this->session->userdata('id_user'),0,1) == 'p'): ?>
<h1>Listing Permohonan</h1>
<hr>
<table class="table table-data">
    <thead>
    <tr>
        <th>NO</th>
        <th>ID ANALISIS</th>
        <th>LAB</th>
        <th>JENIS CONTO</th>
        <th>NAMA PEMOHON</th>
        <th>TANGGAL MASUK</th>
        <th>STATUS</th>
        <th>DETAIL</th>
    </tr>
    </thead>
    <tbody>
    <?php $no = 1; foreach ($permohonan as $analisis): ?>
    <tr>
        <td><?php echo $no++; ?>. </td>
        <td><?php echo $analisis->nomor_analisis; ?> - <?php echo substr($analisis->nomor_analisis,6,5) + $analisis->jumlah_conto - 1; ?></td>
        <td><?php echo $analisis->lab; ?></td>
        <td><?php echo $analisis->jenis_conto; ?></td>
        <td><?php echo $analisis->nama_pemohon; ?></td>
        <td><?php echo tanggal_format_indonesia($analisis->tanggal_terima); ?></td>
        <td><?php echo status_label($analisis->is_selesai); ?></td>
        <td><a href="<?php echo base_url('permohonan/detail/'.$analisis->id); ?>" class="btn btn-info btn-sm">Detail</a> </td>
    </tr>
    <?php endforeach; ?>
    </tbody>
</table>
<?php endif; ?>
