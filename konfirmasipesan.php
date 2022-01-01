<div id="view">
<fieldset>
<?php
	include "koneksi.php";
	$sqla = mysql_query("select * from anggota where username='$_SESSION[userag]'");
	$ra = mysql_fetch_array($sqla);
	$sqlps = mysql_query("select * from pesan where idanggota='$ra[idanggota]'");
	
while($rps = mysql_fetch_array($sqlps)){
		$sqlpsn = mysql_query("select * from pesan where idpesan='$rps[idpesan]'");
		$rpsn = mysql_fetch_array($sqlpsn);
		$sqla = mysql_query("select * from anggota where idanggota='$ra[idanggota]'");
		$ra = mysql_fetch_array($sqla);
		$sqlpr = mysql_query("SELECT * from produk where idproduk='$rps[idproduk]'");
		$rpr = mysql_fetch_array($sqlpr);
		
  echo "Pesanan <b>$rpr[namaproduk]</b> sebanyak <b>$rpsn[jumlahbeli]</b> unit <br> <b>$rpsn[statuspesan]</b>";
  echo "<fieldset style='text-align:center; background-color:#FFFFD2'>";
  if( $rpsn[statuspesan] == "Diterima"){
  
  	// Merubah stok di tabel produk
	$stokpesan = $rpr['stok'] + $rpsn['jumlahbeli'];
	mysql_query("update produk set stok='$stokpesan' where idproduk='$rpr[idproduk]'");
  
		 mysql_query("insert into cart(idproduk, idanggota,jumlahbeli) select idproduk, idanggota, jumlahbeli from pesan  where idpesan='$_GET[idpsn]'");
		 mysql_query("delete from pesan where idpesan='$_GET[idpsn]'");

  	echo "<td><a href='?p=keranjangbelanja&idpsn=$_GET[idpsn]'><button type='button' class='btn btn-more'> Lanjutkan Pembelian</button></a></td>";
	echo " <td> <a href='?p=hapuspesan'><button type='button' class='btn btn-more'> Batal</button></a></td>";
  }else{
  	echo "<td><a href='?p=beranda'><button type='button' class='btn btn-more'>Halaman Depan</button></a></td>";
  }
  echo "</fieldset><br>";
}
?>
</fieldset>
</div>
