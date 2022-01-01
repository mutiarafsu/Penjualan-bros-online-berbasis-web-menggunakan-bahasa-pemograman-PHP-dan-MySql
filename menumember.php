<?php
if(!empty($_SESSION["userag"]) and !empty($_SESSION["passag"])){
  echo "<br>";
  echo "<br>Selamat Datang, <b>$ra[namalengkap]</b>| ";
  echo "<a href='?p=keranjangbelanja&ida=$ra[idanggota]'>Keranjang Saya</a> | ";
  echo "<a href='?p=order&ida=$ra[idanggota]'>Status Order</a> | ";
  echo "<a href='?p=konfirmasi&ida=$ra[idanggota]'>Konfirmasi Pembayaran</a> | ";
  echo "<a href='?p=orderpesananview&ida=$ra[idanggota]'>Pesanan</a> | ";
  echo "<a href='?p=logout'>Logout</a></br>";
  echo "</br>";
}else{
  echo "<br>";
  echo "<br><a href='?p=login'>Login</a> | ";
  echo "<a href='?p=register'>Register</a></br>";
  echo "</br>";
}
?>
