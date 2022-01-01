<?php
  if($_GET["idk"] == 0){
	$q = "";
  }else{
	$q = " where idkat='$_GET[idk]'";
  }
  $sqlpr = mysql_query("select * from produk $q order by tglpost desc");
  while($rpr = mysql_fetch_array($sqlpr)){ 
  $nm = substr($rpr["namaproduk"],0,30); 
  echo "<div class='dh3'>";
  echo "<div id='prd' align='center'>";
  echo "<fieldset>";
  echo "<img src='fotoproduk/$rpr[foto1]' width='280' height='280'>";
  echo "<h2>$nm...</h2>";
  echo "<h3>IDR $rpr[hargaproduk]</h3>";
  echo "(Diskon $rpr[diskon]%)<br>";
  echo "Tersedia $rpr[stok] Unit<p>";
  echo "<a href='?idk=$_GET[idk]&p=produkdetail&idp=$rpr[idproduk]'><button type='button' class='btn btn-more'>Lihat</button></a>";
  echo " <a href='?p=keranjang&idp=$rpr[idproduk]&ida=$ra[idanggota]'><button type='button' class='btn btn-more'>Beli Sekarang</button></a>";
  echo " <a href='?p=orderpesanan&idp=$rpr[idproduk]&ida=$ra[idanggota]'><button type='button' class='btn btn-more'>Pesan</button></a>";
  echo "</fieldset>";
  echo "</div>";
  echo "</div>";
  }
?>
