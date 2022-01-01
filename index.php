<?php
  session_start();
  include "koneksi.php";
  $sqla = mysql_query("select * from anggota where username='$_SESSION[userag]'");
  $ra = mysql_fetch_array($sqla);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Alif_Bross.com</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<style type="text/css">
<!--
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
}
-->
</style>
</head>

<body>
<div class="container1">
  <div class="grid">
    <div class="dh4">
      <form id="form1" name="form1" method="post" action="">
        <label>
          <input type="image" name="imageField" id="imageField" src="icon/Alif.jpg" />
        </label>
        <span class="style1"><b><span style="color:#0066FF; font-size:28px;"> Alif_Bros.Com</b></span>
      </form>
    </div>
	<div class="dh8" align="right">
	<?php include "menumember.php";?>
	</div>
  </div>
</div>
<div class="container2">
  <ul id="menu">
  <?php
    $sqlk = mysql_query("select * from kategori order by namakat asc");
	echo "<li><a href='?idk=0'>Beranda</a></li>";
	while($rk = mysql_fetch_array($sqlk)){
	  echo "<li><a href='?idk=$rk[idkat]'>$rk[namakat]</a></li>";
	}
  ?>
  </ul>
</div>
<div class="container3">
  <div class="grid">
  <?php
  if($_GET["p"] == "produkdetail"){
    include "produkdetail.php";
  }else if($_GET["p"] == "register"){
    include "register.php";
  }else if($_GET["p"] == "login"){
    include "login.php";
  }else if($_GET["p"] == "logout"){
    include "logout.php";
  }else if($_GET["p"] == "keranjang"){
    include "keranjang.php";
  }else if($_GET["p"] == "keranjangedit"){
    include "keranjangedit.php";
  }else if($_GET["p"] == "keranjangdel"){
    include "keranjangdel.php";
  }else if($_GET["p"] == "keranjangbelanja"){
    include "keranjangbelanja.php";
  }else if($_GET["p"] == "selesaibelanja"){
    include "selesaibelanja.php";
  }else if($_GET["p"] == "selesaibelanjaaksi"){
    include "selesaibelanjaaksi.php";
  }else if($_GET["p"] == "konfirmasi"){
    include "konfirmasi.php";
  }else if($_GET["p"] == "order"){
    include "order.php";
  }else if($_GET["p"] == "orderdetail"){
    include "orderdetail.php";
  }else if($_GET["p"] == "pesan"){
    include "pesan.php";
  }else if($_GET["p"] == "orderpesanan"){
    include "orderpesanan.php";
  }else if($_GET["p"] == "orderpesananview"){
    include "orderpesananview.php";
  }else if($_GET["p"] == "konfirmasipesan"){
    include "konfirmasipesan.php";
  }else if($_GET["p"] == "hapuspesan"){
    include "hapuspesan.php";
  }else{ 
    include "produkterbaru.php";
    include "produk.php";
  }
  ?>
  </div>
</div>
<div class="container5">
  <?php include "footer.php"; ?>
</div>
</body>
</html>
