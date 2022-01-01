<div id="view">
<fieldset>
<?php 
	include "koneksi.php";
	$sqla = mysql_query("select * from anggota where emailanggota='$_SESSION[namaang]'");
	$ra = mysql_fetch_array($sqla);
		
		// Tampilkan Status Pesanan
		$sqlo = mysql_query("select * from orders where idorder = '$_GET[ido]'");
		$ro = mysql_fetch_array($sqlo);
			
		// Tampilkan Rincian Produk yang di pesan
		$sqlpr = mysql_query("select * from orderdetail, produk where orderdetail.idproduk=produk.idproduk and orderdetail.idorder='$_GET[ido]'");
		
		echo "<h3>No Order : $ro[idorder]</h3>";
		
				
		echo "<h3>Detail Pesanan : </h3>";
		echo "<form method='post' action='?p=orderdetailstatus'>
		<input type='hidden' name='idorder' value='$ro[idorder]'>
			<table border='0' width='100%'>
			<tr>
				<th>No. </th>
				<th>Foto</th>
				<th>Nama Produk</th>
				<th>Jumlah</th>
				<th width='15%'>Harga</th>
				<th width='15%'>Sub Total</th>
			</tr>";
		$no = 1;
		while($rpr = mysql_fetch_array($sqlpr)){
			$disk = ($rpr['diskon'] * $rpr['hargaproduk']) / 100;
			$hrgbaru = $rpr['hargaproduk'] - $disk;
			$subtotal = $rpr['jumlahbeli'] * $hrgbaru;
			$tot = $tot + $subtotal;
			$brt = $rpr['jumlahbeli'] * $rpr['berat'];
			$berat = $berat + $brt;
			  if($rpr['diskon']>0){
				  $diskon = "Diskon <font color='#FF0000'> $rpr[diskon]% </font>";
				  $hrglama = "<font style='text-decoration:line-through'>IDR $rpr[hargaproduk]</font>";
			  }else{	  	
				  $diskon = "";
				  $hrglama = "";
			  }	
			echo "<tr>";
				echo "<td>$no <input type='hidden' name='idproduk' value='$rpr[idproduk]'></td>";
				echo "<td><img src='fotoproduk/$rpr[foto1]' width='100px'></td>";
				echo "<td><b>$rpr[namaproduk]</b><br> $diskon $hrglama</td>";
				echo "<td align='center'>$rpr[jumlahbeli]</td>";
				echo "<td align='right'>IDR $hrgbaru</td>";
				echo "<td align='right'>IDR $subtotal</td>";
				echo "</tr>";
			$no++;
			$sqlj = mysql_query("select * from jasakirim where idjasa='$rpr[idjasa]'");
			$rj = mysql_fetch_array($sqlj);
			$tarif = $berat * $rj["tarif"];
			$total = $tot + $tarif;	
		}
		echo "<tr>
			<td colspan='5' align='right'>Berat</td>
			<td align='right'><b>$berat</b> Kg</td>
		</tr>";
		echo "<tr>
			<td colspan='5' align='right'>Jasa Pengiriman : <b>$rj[namajasa]</b></td>
			<td align='right'>IDR <b>$tarif</b></td>
		</tr>";
		echo "<tr>
			<td colspan='5' align='right'>TOTAL</td>
			<td align='right'>IDR <b>$total</b></td>
		</tr>";
	echo "</table></form>";
	
			
		
?>
</fieldset>
</div>
