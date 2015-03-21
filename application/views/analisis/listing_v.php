<a class="btn btn-primary" href="<?php echo base_url('analisis/detail/'.$id_analisis); ?>"><i class="glyphicon glyphicon-chevron-left"></i> Kembali</a>
<br>
<br>
<div class="row">
    <div class="col-sm-3">
        <div class="alert alert-info"><div class="info-data"><?php echo $nomor_analisis; ?></div><span class="glyphicon glyphicon-list info-icon"></span> nomor conto</div>
    </div>
</div>
<table class="table table-responsive">
    <thead>
        <tr>
            <th>No.</th>
            <th>Nomor Analisis</th>
            <th>Kode Conto</th>
            <?php
                $parameter_nonsatuan = array(
                    'KMKGB01', //ph
                    'KMKGB02', //gb
                    'KMBAK01', //ph
                    'KPBTH02', //ph
                );
                // parameter beserta satuan yg digunakan
                foreach($parameter as $param):
                    // tampilkan jika parameter ada satuan dan parameter bukan bagian dari parameter tanpa satuan
                    if(!empty($param->satuan) OR in_array(strtoupper($param->id_parameter), $parameter_nonsatuan)):
            ?>
                <th>
                    <?php echo nama_kimia($param->nama); ?>
                    <br>
                    <?php echo empty($param->satuan) ? '<br>' : '('.$param->satuan.')'; ?>
                </th>
            <?php
                    endif;
                endforeach;
            ?>
        </tr>
    </thead>
    <tbody>
    <?php $no = 1; ?>
    <?php
        foreach($listing as $conto):

        ?>
        <tr>
                <td><?php echo $no; ?></td>
                <td><?php echo $conto->id_conto; ?></td>
                <td><?php echo $kode_conto.'-'.str_pad($no++, 3, 0, STR_PAD_LEFT); ?></td>
                <?php foreach($parameter as $param){
                    // tampilkan jika parameter ada satuan dan parameter bukan bagian dari parameter tanpa satuan
                    if(!empty($param->satuan) OR in_array(strtoupper($param->id_parameter), $parameter_nonsatuan)):
                ?>
                <td>
                    <?php $nilai = nilai($conto->id, $param->id_parameter, FALSE, $param->satuan); echo $nilai[0]; ?>
                </td>
                <?php
                    endif;
                    }
                ?>
        </tr>
    <?php
        endforeach; ?>
    </tbody>
</table>
