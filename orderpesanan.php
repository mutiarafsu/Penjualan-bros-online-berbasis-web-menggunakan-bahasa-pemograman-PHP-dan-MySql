<div id="formadd">
<fieldset>
<h3>HALAMAN PESANAN</h3>
<?php
$sqlpr = mysql_query("select * from produk where idproduk='$_GET[idp]'");
  $rpr = mysql_fetch_array($sqlpr);
?>
<form name="form1" method="post" action="" enctype="multipart/form-data">
  <input name="idproduk" type="hidden" value="<?php echo "$rpr[idproduk]"; ?>" />
  <input type="hidden" name="idanggota" value="<?php echo "$ra[idanggota]"; ?>" />
  <input name="namaproduk" type="text" id="namaproduk" placeholder="Nama Produk" value="<?php echo "$rpr[namaproduk]"; ?>">
  <input name="hargaproduk" type="text" id="hargaproduk" placeholder="Harga Produk" value="<?php echo "$rpr[hargaproduk]"; ?>" />
  <input name="jumlahbeli" type="text" id="jumlahbeli" placeholder="Jumlah Pesanan" value="" />
  <textarea name="warna" id="warna" placeholder="Pilihan Warna, Isikan LENGKAP Jika ingin semua warna"></textarea>
  <input type="text" name="tglselesai" id="tglselesai" placeholder="Permintaan Selesai Pada Tanggal contoh : 2017-01-30" />
  <input name="simpan" type="submit" id="simpan" value="SIMPAN PESANAN" />
  
<?php
include "koneksi.php";
if($_POST["simpan"]){
	$sqlpsn = mysql_query("insert into pesan (idproduk, idanggota, jumlahbeli, warna, tglselesai, statuspesan, tglpesan) values ('$rpr[idproduk]', '$_GET[ida]', '$_POST[jumlahbeli]', '$_POST[warna]', '$_POST[tglselesai]', 'Belum Dikonfirmasi', NOW())");
	if($sqlpsn){
		echo "Pesanan Berhasil Disimpan";
	}else{
		echo "Gagal Menyimpan";
	}
	echo "<META HTTP-EQUIV='Refresh' Content='1; URL=?p=orderpesananview'>";
}
?>
</form>
</fieldset>
</div>
