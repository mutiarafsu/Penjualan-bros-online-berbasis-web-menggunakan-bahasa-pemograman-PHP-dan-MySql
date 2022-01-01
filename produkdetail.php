<?php
  $sqlpr = mysql_query("select * from produk where idproduk='$_GET[idp]'");
  $rpr = mysql_fetch_array($sqlpr);
  
  echo "<div class='dh4'>";
  if(!empty($rpr["foto1"])){
    $foto1 = "<img src='fotoproduk/$rpr[foto1]' width='100%' border='1'>";
  }
  if(!empty($rpr["foto2"])){
    $foto2 = "<p><img src='fotoproduk/$rpr[foto2]' width='100%' border='1'>";
  }
  echo "$foto1 $foto2";
  echo "</div>";
  
  echo "<div class='dh8' align='justify'>";
  echo "<h1>$rpr[namaproduk]</h1>";
  echo "<h2>IDR $rpr[hargaproduk] (Diskon $rpr[diskon]%)</h2>";
  echo "<h3>Tersedia $rpr[stok] Unit</h3>";
  echo "Berat <b>$rpr[berat] Kg</b><p>";
  echo "<b>Detail Produk : </b><br>$rpr[detailproduk]<p>";
  echo "<b>Isi dalam kotak : </b><br>$rpr[isikotak]<p>";
  echo "<a href='?p=keranjang&idp=$rpr[idproduk]&ida=$ra[idanggota]'><button type='button' class='btn btn-more'>Beli Sekarang</button></a>";
  echo " <a href='?p=orderpesanan&idp=$rpr[idproduk]&ida=$ra[idanggota]'><button type='button' class='btn btn-more'>Pesan</button></a>";
  echo "</div>";
?>
