<?php
  include "koneksi.php";
  mysql_query("delete from pesan where idpesan='$_GET[idpsn]'");
  echo "<META HTTP-EQUIV='Refresh' Content='1; URL=?p=orderpesanview&ida=$_GET[ida]'>";
?>
