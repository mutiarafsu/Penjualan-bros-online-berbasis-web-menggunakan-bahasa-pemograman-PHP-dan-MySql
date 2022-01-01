<div id="view">
<fieldset>
<?php
	include "koneksi.php";
	$sqla = mysql_query("select * from anggota where username='$_SESSION[userag]'");
	$ra = mysql_fetch_array($sqla);
	$sqlps = mysql_query("select * from pesan where idanggota='$ra[idanggota]'");
	echo "<br>";
	echo "<table border='0'  width='100%'>";
	echo "<tr>";
		echo "<th>No.</th>";
		echo "<th>No Pesan</th>";
		echo "<th>Nama Produk</th>";
		echo "<th>Nama Pemesan</th>";
		echo "<th>Jumlah Pesanan</th>";
		echo "<th>Warna Pesanan</th>";
		echo "<th>Tanggal Pesan</th>";
		echo "<th>Tanggal Selesai</th>";
		echo "<th>Konfirmasi Pesanan</th>";
	echo "</tr>";
	$no = 1;	
	while($rps = mysql_fetch_array($sqlps)){
		$sqlpsn = mysql_query("select * from pesan where idpesan='$rps[idpesan]'");
		$rpsn = mysql_fetch_array($sqlpsn);
		$sqla = mysql_query("select * from anggota where idanggota='$ra[idanggota]'");
		$ra = mysql_fetch_array($sqla);
		$sqlpr = mysql_query("SELECT * from produk where idproduk='$rps[idproduk]'");
		$rpr = mysql_fetch_array($sqlpr);
		
		echo "<tr>";
			echo "<td>$no</td>";
			echo "<td>$rpsn[idpesan]</td>";
			echo "<td>$rpr[namaproduk]</td>";
			echo "<td>$ra[namalengkap]</td>";
			echo "<td>$rpsn[jumlahbeli]</td>";
			echo "<td>$rpsn[warna]</td>";
			echo "<td>$rpsn[tglpesan]</td>";
			echo "<td>$rpsn[tglselesai]</td>";
			echo "<td>$rpsn[statuspesan]</td>";
		echo "</tr>";
		$no++;
	}
	echo "<td><a href='?p=konfirmasipesan&idpsn=$rpsn[idpesan]'><button type='button' class='btn btn-more'> Lihat Detail Pesana</button></a></td>";
	echo "</table>";
?>
</fieldset>
</div>
