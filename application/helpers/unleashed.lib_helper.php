<?php
/**
 * Created by PhpStorm.
 * User: Unleashed
 * Date: 3/15/14
 * Time: 10:04 PM
 * UNEALSHED FUNCTION PLUG-IN
 */

$lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum";
function lorem_ipsum()
{
    echo "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum";
}

/**
 * @param $table
 * @param bool $order_by
 * @param string $order
 * @param bool $limit
 * @return object|stdClass
 */
function get_all($table, $order_by = FALSE, $order = 'ASC', $limit = FALSE)
{
    $q = "SELECT * FROM $table ";
    if($order_by != FALSE)
        $q .= "ORDER BY $order_by $order ";

    if($limit != FALSE)
        $q .= "LIMIT $limit";

    $result = mysql_query($q);

    return $result;
}

/**
 * @param $table
 * @param $id_key
 * @param $value
 * @param bool $order_by
 * @param string $order
 * @param bool $limit
 * @return object|stdClass
 */
function get_by_id($table, $id_key, $value, $order_by = FALSE, $order = 'ASC', $limit = FALSE)
{
    $q = "SELECT * FROM $table WHERE $id_key='$value' ";
    if($order_by != FALSE)
        $q .= "ORDER BY $order_by $order ";

    if($limit != FALSE)
        $q .= "LIMIT $limit";

    $result = mysql_query($q);

    return $result;
}

/**
 * @param $table
 * @param $id_key
 * @param $value
 * @return object|stdClass
 */
function get_row_by_id($table, $id_key, $value)
{
    $q = "SELECT * FROM $table WHERE $id_key='$value' LIMIT 1";

    $result = mysql_query($q);

    if(mysql_num_rows($result) == 0)
        $data = FALSE;
    else
        $data = mysql_fetch_object($result);


    return $data;
}

function image_link_exist($link)
{
    $file_headers = @get_headers($link);
    // cek apakah link ada
    if(!$file_headers)
        return FALSE;
    else
    {
        // ambil informasi gambar
        $image = getimagesize($link);
        // jika bukan gambar
        if(!$image)
            return FALSE;
        else
            return TRUE;
    }
}

/**
 * @param $currency
 * @return string
 */
function format_rupiah($currency)
{
    return 'Rp. '.number_format($currency, 0, ',', '.');
}

/**
 * @param $dump
 */
function dump($dump)
{
    echo "<pre>";
    var_dump($dump);
    echo "</pre>";
}

/**
 * @param $link
 * Comment if you are using Codeigniter
 */
//function redirect($link)
//{
//    header('location:'.$link);
//}


/**
 * @return bool|string
 */
function now()
{
    return date('Y-m-d H:i:s');
}

/**
 * @param $text
 * @return string
 */
function cameltext($text)
{
    return ucwords(strtolower($text));
}

function to_jam($jam)
{
    return date('H:i', strtotime($jam));
}

/**
 * yyyy-mm-dd
 * @param $tgl
 * @param bool $waktu
 * @param bool $bln_only
 * @return string
 */
function tanggal_format_indonesia($tgl, $waktu = FALSE, $bln_only = FALSE){
    $tanggal  =  substr($tgl,8,2);
    $bulan  =  getBulan(substr($tgl,5,2));
    $tahun  =  substr($tgl,0,4);
    $jam = substr($tgl, 11,2);
    $menit = substr($tgl, 14,2);
    $separator = empty($jam) ? '' : ':';
    $r_wkt = $waktu == FALSE ? '' : $jam.$separator.$menit;

    if($bln_only == FALSE)
        return  $tanggal.' '.$bulan.' '.$tahun.' '.$r_wkt;
    else
        return  $bulan.' '.$tahun;

}

/**
 * @param $bln
 * @return string
 */
function  getBulan($bln){
    switch  ($bln){
        case  1:
            return  "Januari";
            break;
        case  2:
            return  "Februari";
            break;
        case  3:
            return  "Maret";
            break;
        case  4:
            return  "April";
            break;
        case  5:
            return  "Mei";
            break;
        case  6:
            return  "Juni";
            break;
        case  7:
            return  "Juli";
            break;
        case  8:
            return  "Agustus";
            break;
        case  9:
            return  "September";
            break;
        case  10:
            return  "Oktober";
            break;
        case  11:
            return  "November";
            break;
        case  12:
            return  "Desember";
            break;
    }
}

/**
 * @param $hari
 * @return string
 */
function getHari($hari)
{
    switch  ($hari){
        case  '7':
            return  "Minggu";
            break;
        case  '1':
            return  "Senin";
            break;
        case  '2':
            return  "Selasa";
            break;
        case  '3':
            return  "Rabu";
            break;
        case  '4':
            return  "Kami";
            break;
        case  '5':
            return  "Jumat";
            break;
        case  '6':
            return  "Sabtu";
            break;


    }
}

/**
 * @return bool|string
 * tanggal besok
 */
function besok()
{
    $now = strtotime(date('Y-m-d').' +1 day');
    $besok = date('Y-m-d', $now);

    return $besok;
}

/**
 * @param $val
 * @return string
 *
 * membersihkan inputan dari setan yang terkutuk
 */
function escape($val, $html = TRUE)
{
    if($html == FALSE)
        $string = trim(mysql_real_escape_string($val));
    else
        $string = trim(htmlentities(mysql_real_escape_string($val)));
    return $string;
}

/**
 * @param $key
 * @param $value
 * @return string
 */
function selected($key, $value)
{
    return $key == $value ? "SELECTED" : '';
}

/**
 * cara menggunakannya :
 * // buat log file
 * $file_path = '/lib/nama-file-log.txt';
 * $message = "[".now()."] messagenya ";
 * add_log($file_path, $message);
 * @param $file_path
 * @param $message
 */
function add_log($file_path, $message)
{
    if(!file_exists($file_path))
    {
        fopen($file_path, "w") or die('error create');
    }

    $current = file_get_contents($file_path);
    $current .= $message;
    $current .= "\n";
    file_put_contents($file_path, $current);
}

/**
 * Tambah data ke cart dengan ukuran
 * @param $item_to_cart
 * @return bool
 */
function add_cart_item($item_to_cart)
{
    $found = FALSE;
    if(!empty($_SESSION['item'])) // if session item is not empty
    {
        foreach($_SESSION['item'] as $item):    // loop item in session

            // jika id sama dan ukuran sama ditemukan maka false
            if($item['id'] == $item_to_cart[0]['id'] AND $item['option']['ukuran'] == $item_to_cart[0]['option']['ukuran']) // if found item excactly same with the input set found true
            {
                $found = TRUE;
            }
        endforeach;

        // if not item same with new item that being added merge item that being add with the cart item
        if($found == FALSE)
        {
            // berhasil masuk cart karena belum ada
            $_SESSION['item'] = array_merge($_SESSION['item'], $item_to_cart);
            return TRUE;
        }
        else
            return FALSE; // gagal karena sudah ada
    }
    else
    {
        $_SESSION['item'] = $item_to_cart;
        return TRUE;
    }
}

/**
 * Hapus item dari cart
 * @param $id
 */
function remove_cart_item($id)
{
    $cart_item = '';
    if(!empty($_SESSION['item'])):
        foreach($_SESSION['item'] as $item):
            if($item['cartID'] != $id)
            {
                $cart_item[] = array(
                    'cartID' => $item['cartID'],
                    'id'     => $item['id'],
                    'name'   => $item['name'],
                    'price'  => $item['price'],
                    'qty'    => $item['qty'],
                    'option' => $item['option']
                );
            }
            $_SESSION['item'] = $cart_item;
        endforeach;
    endif;
}

/**
 * Cek apakah ada id di keranjang dengan opsi tertentu
 * @param $id
 * @param $opsi
 * @return bool
 */
function check_cart_item($id, $opsi = FALSE)
{
    $found = FALSE;
    if(!empty($_SESSION['item'])):
        foreach($_SESSION['item'] as $item):
            if($item['id'] == $id)
            {
                if($opsi != FALSE)
                {
                    /*
                     * contoh:
                     *
                     * array (
                     *      'ukuran',
                     *      'S'
                     * )
                     */
                    if($item['opt'][$opsi[0]] == $opsi[1])
                    {
                        $found = TRUE;
                    }
                    else
                        $found = FALSE;
                }
                else
                    $found = TRUE;
            }
        endforeach;
    endif;

    return $found;
}

/**
 * Jumlah item yang ada di keranjang
 * @return int
 */
function total_cart_item()
{
    $total = 0;
    if(!empty($_SESSION['item'])):
        foreach($_SESSION['item'] as $item):
            $total += $item['qty'];
        endforeach;
    endif;

    return $total;
}

/**
 * Jumlah harga semua item di kerjang
 * @return int
 */
function subtotal_cart_item()
{
    $subtotal = 0;
    if(!empty($_SESSION['item'])):
        foreach($_SESSION['item'] as $item):
            $subtotal += $item['price']*$item['qty'];
        endforeach;
    endif;

    return $subtotal;
}

/**
 * @param $array
 * @param string $key
 * @return array
 */
function object_to_array_id_only($array, $key = 'id')
{
    $array_id_only = array();
    foreach($array as $row)
    {
        $array_id_only[] = $row->$key;
    }

    return $array_id_only;
}

function set_flashdata($message, $alert = 'warning', $icon = 'fa fa-warning')
{
    $CI =& get_instance();
    $CI->session->set_flashdata('info_alert', $alert);
    $CI->session->set_flashdata('info_message', $message);
    $CI->session->set_flashdata('info_icon', $icon);
}

function flashdata()
{
    $CI =& get_instance();
    $info_message = $CI->session->flashdata('info_message');
    if(!empty($info_message)):
        $info_alert = $CI->session->flashdata('info_alert');
        $info_icon = $CI->session->flashdata('info_icon');
        echo "<div class='alert alert-$info_alert'>";
        echo "<i class='".$info_icon."'></i> ";
        echo "<strong>$info_message</strong>";
        echo "</div>";
    endif;
}

/**
 * @param $key
 * @param $value
 */
function set_select_value($key, $value)
{
    echo $key == $value ? 'selected="selected"' : '';
}