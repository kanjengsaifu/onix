<?php
/**
 * Created by PhpStorm.
 * User: phi314
 * Date: 3/26/15
 * Time: 3:37 PM
 * Pengisian Analisis Mineral Butir
 */



if($is_empty_nilai)
{
    $nilai['berat_total'] = 0;
    $nilai['sm'] = 0;
    $nilai['m'] = 0;
    $nilai['nm'] = 0;
    $berat_total = 0;

}
else
{
    $berat_total = $nilai['sm'] + $nilai['m'] + $nilai['nm'];
}

?>
<table>
    <tbody>
    <tr>
        <td>NOMOR ANALISIS KIMIA</td>
        <td colspan="7"><?php echo $analisis->nomor_analisis; ?> - <?php echo substr($analisis->nomor_analisis,6,5) + $analisis->jumlah_conto - 1; ?></td>
    </tr>
    <tr>
        <td>JUMLAH CONTO</td>
        <td colspan="7"><?php echo $analisis->jumlah_conto; ?></td>
    </tr>
    <tr>
        <td>JENIS CONTO</td>
        <td colspan="7"><?php echo $analisis->jenis_conto; ?></td>
    </tr>
    <tr>
        <td>LOKASI</td>
        <td colspan="7"><?php echo $analisis->nama_lokasi; ?></td>
    </tr>
    <tr>
        <td>DITERIMA TANGGAL</td>
        <td colspan="7"><?php echo tanggal_format_indonesia($analisis->tanggal_terima); ?></td>
    </tr>
    <tr>
        <td>ANALISIS UNTUK</td>
        <td colspan="7"><?php echo $pemohon->nama_sertifikat; ?></td>
    </tr>
    <tr>
        <td>BERAT TOTAL</td>
        <td colspan="7" align="'center"><?php echo $berat_total; ?></td>
    </tr>
    <tr>
        <td>FRAKSI MINERAL</td>
        <td colspan="2">SM (%vol)</td>
        <td colspan="2">M (%vol)</td>
        <td colspan="2">NM (%vol)</td>
    </tr>
    <tr>
        <td>BERAT FRAKSI</td>
        <td colspan="2"><?php echo $nilai['sm']; ?></td>
        <td colspan="2"><?php echo $nilai['m']; ?></td>
        <td colspan="2"><?php echo $nilai['nm']; ?></td>
    </tr>
    <tr>
        <td></td>
        <td>% Fr</td>
        <td>% Tot</td>
        <td>% Fr</td>
        <td>% Tot</td>
        <td>% Fr</td>
        <td>% Tot</td>
        <td>Hasil (%)</td>
    </tr>

    <?php
        $total_sm = 0;
        $total_m = 0;
        $total_nm = 0;
        $total_total = 0;
        foreach($nilai['komposisi_mineral'] as $komposisi_mineral):
            $total_komposisi_mineral_sm = $nilai['sm'] / $berat_total * $komposisi_mineral->sm;
            $total_komposisi_mineral_m = $nilai['m'] / $berat_total * $komposisi_mineral->m;
            $total_komposisi_mineral_nm = $nilai['nm'] / $berat_total * $komposisi_mineral->nm;

            $subtotal_komposisi_mineral = $total_komposisi_mineral_sm + $total_komposisi_mineral_m + $total_komposisi_mineral_nm;

            $total_sm += $komposisi_mineral->sm;
            $total_m += $komposisi_mineral->m;
            $total_nm += $komposisi_mineral->nm;
            $total_total += $subtotal_komposisi_mineral
    ?>
        <tr id="mineral-<?php echo $komposisi_mineral->id; ?>">
            <td>
                <?php echo $komposisi_mineral->nama_mineral; ?>
            </td>
            <td><?php echo $komposisi_mineral->sm; ?></td>
            <td><?php echo round($total_komposisi_mineral_sm, 2); ?></td>
            <td><?php echo $komposisi_mineral->m; ?></td>
            <td><?php echo round($total_komposisi_mineral_m, 2); ?></td>
            <td><?php echo $komposisi_mineral->nm; ?></td>
            <td><?php echo round($total_komposisi_mineral_nm, 2); ?></td>
            <td><?php echo round($subtotal_komposisi_mineral, 2); ?></td>
        </tr>
    <?php endforeach; ?>
    </tbody>
    <tfoot>
    <tr>
        <td>JUMLAH</td>
        <td><?php echo $total_sm; ?></td>
        <td></td>
        <td><?php echo $total_m; ?></td>
        <td></td>
        <td><?php echo $total_nm; ?></td>
        <td></td>
        <td><?php echo round($total_total); ?></td>
    </tr>
    </tfoot>
</table>