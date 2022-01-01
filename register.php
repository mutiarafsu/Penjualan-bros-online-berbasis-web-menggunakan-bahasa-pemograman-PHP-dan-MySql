<div id="formadd">
<fieldset>
<h3>FORM REGISTRASI MEMBER</h3>
<form name="form1" method="post" action="" enctype="multipart/form-data">
  <input type="text" name="username" id="username" placeholder="Username">
  <input type="text" name="password" id="password" placeholder="Password">
  <input type="text" name="namalengkap" id="namalengkap" placeholder="Nama Lengkap">
  <p>Jenis Kelamin :
  <input type="radio" name="jk" id="radio" value="P"> Pria
  <input type="radio" name="jk" id="radio2" value="W"> Wanita
  <select name="tgl" id="tgl">
  <?php
  echo "<option value=''>Tanggal Lahir </option>";
  for($i=1; $i<=31; $i++){
  echo "<option value='$i'>$i</option>";
  }
  ?>
  </select>
  <select name="bln" id="bln">
  <?php
  echo "<option value=''>Bulan Lahir </option>";
  for($j=1; $j<=12; $j++){
  if($j==1){ $bulan = "Januari";}
  else if($j==2){ $bulan = "Februari";}
  else if($j==3){ $bulan = "Maret";}
  else if($j==4){ $bulan = "April";}
  else if($j==5){ $bulan = "Mei";}
  else if($j==6){ $bulan = "Juni";}
  else if($j==7){ $bulan = "Juli";}
  else if($j==8){ $bulan = "Agustus";}
  else if($j==9){ $bulan = "September";}
  else if($j==10){ $bulan = "Oktober";}
  else if($j==11){ $bulan = "November";}
  else if($j==12){ $bulan = "Desember";}
  echo "<option value='$j'>$bulan</option>";
  }
  ?>
  </select>
  <input type="text" name="thn" id="thn" placeholder="Tahun">
  <textarea name="alamat" id="alamat" cols="45" rows="5" placeholder="Alamat"></textarea>
  <input type="text" name="nohp" id="nohp" placeholder="No. Handphone">
  <input type="submit" name="register" id="register" value="REGISTER">
</form>
<?php
include "koneksi.php";
if($_POST["register"]){
	$sqla = mysql_query("insert into anggota (username, password, namalengkap, jk, tgllahir, alamat, nohp, tgldaftar) value('$_POST[username]', '$_POST[password]', '$_POST[namalengkap]', '$_POST[jk]', '$_POST[thn]-$_POST[bln]-$_POST[tgl]', '$_POST[alamat]', '$_POST[nohp]', NOW())");
	if($sqla){
	echo "Proses Register Berhasil";
	echo "<META HTTP-EQUIV='Refresh' Content='1; URL=?p=login'>";
	}else{
	echo "Proses Register Gagal";
	echo "<META HTTP-EQUIV='Refresh' Content='1; URL=?p=register'>";
	}
}
?>
</filset>
</div>
