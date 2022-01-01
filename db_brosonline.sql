-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 05, 2017 at 12:30 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_brosonline`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `idadmin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  PRIMARY KEY (`idadmin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`idadmin`, `username`, `password`, `namalengkap`) VALUES
(1, 'admin', 'admin', 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE IF NOT EXISTS `anggota` (
  `idanggota` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  `jk` char(1) NOT NULL,
  `tgllahir` date NOT NULL DEFAULT '0000-00-00',
  `alamat` text NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `tgldaftar` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idanggota`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`idanggota`, `username`, `password`, `namalengkap`, `jk`, `tgllahir`, `alamat`, `nohp`, `tgldaftar`) VALUES
(4, 'wilna', 'wilna', 'Wilna Maulida', 'W', '1996-08-14', 'Padang', '081268617605', '2017-06-04 15:19:15');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `idcart` int(11) NOT NULL AUTO_INCREMENT,
  `idproduk` int(11) NOT NULL,
  `idanggota` int(11) NOT NULL,
  `jumlahbeli` int(11) NOT NULL,
  `tglcart` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idcart`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `cart`
--


-- --------------------------------------------------------

--
-- Table structure for table `jasakirim`
--

CREATE TABLE IF NOT EXISTS `jasakirim` (
  `idjasa` int(11) NOT NULL AUTO_INCREMENT,
  `idadmin` int(11) NOT NULL,
  `namajasa` varchar(30) NOT NULL,
  `logojasa` text NOT NULL,
  `tarif` double NOT NULL,
  PRIMARY KEY (`idjasa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jasakirim`
--

INSERT INTO `jasakirim` (`idjasa`, `idadmin`, `namajasa`, `logojasa`, `tarif`) VALUES
(1, 1, 'JNE', 'jne.jpg', 13000),
(2, 1, 'POS INDONESIA', 'pos.jpg', 11000),
(3, 1, 'TIKI', 'tiki.jpg', 12500),
(4, 1, 'PANDU LOGISTIC', 'pandu.jpg', 15000),
(5, 1, 'RPX HOLDING', 'rpx.jpg', 12000),
(6, 1, 'ESL EXPRESS', 'esl.jpg', 14500);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `idkat` int(11) NOT NULL AUTO_INCREMENT,
  `idadmin` int(11) NOT NULL,
  `namakat` varchar(40) NOT NULL,
  PRIMARY KEY (`idkat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkat`, `idadmin`, `namakat`) VALUES
(1, 1, 'Bross'),
(2, 1, 'Kalung'),
(3, 1, 'Tempat Pentul'),
(6, 1, 'Bendo');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasibayar`
--

CREATE TABLE IF NOT EXISTS `konfirmasibayar` (
  `idkonfirmasi` int(11) NOT NULL AUTO_INCREMENT,
  `idorder` int(11) NOT NULL,
  `namabankpengirim` varchar(50) NOT NULL,
  `namapengirim` varchar(50) NOT NULL,
  `jumlahtransfer` double NOT NULL,
  `tgltransfer` date NOT NULL DEFAULT '0000-00-00',
  `namabankpenerima` varchar(50) NOT NULL,
  `bukti` text NOT NULL,
  PRIMARY KEY (`idkonfirmasi`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `konfirmasibayar`
--

INSERT INTO `konfirmasibayar` (`idkonfirmasi`, `idorder`, `namabankpengirim`, `namapengirim`, `jumlahtransfer`, `tgltransfer`, `namabankpenerima`, `bukti`) VALUES
(2, 6, 'BRI', 'WILNA', 16156, '2017-07-02', 'BRI', 'blue-wooden-fence-background-pattern-backgrounds-53431317.jpg'),
(3, 7, 'BRI', 'WILNA', 17200, '2017-07-05', 'BRI', 'blue-swirl-website-background2.jpg'),
(4, 9, 'BRI', 'WILNA', 403300, '2017-06-30', 'BRI', 'images.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE IF NOT EXISTS `orderdetail` (
  `idorder` int(11) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `idjasa` int(11) NOT NULL,
  `jumlahbeli` int(11) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`idorder`, `idproduk`, `idjasa`, `jumlahbeli`, `subtotal`) VALUES
(6, 25, 1, 4, 16000),
(7, 23, 3, 1, 14700),
(8, 24, 5, 70, 407400),
(9, 25, 2, 100, 400000),
(10, 25, 4, 12, 48000),
(11, 25, 3, 3, 12000),
(12, 25, 6, 2, 8000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `idorder` int(11) NOT NULL AUTO_INCREMENT,
  `idanggota` int(11) NOT NULL,
  `alamatkirim` text NOT NULL,
  `total` double NOT NULL,
  `tglorder` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `statusorder` varchar(40) NOT NULL,
  PRIMARY KEY (`idorder`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`idorder`, `idanggota`, `alamatkirim`, `total`, `tglorder`, `statusorder`) VALUES
(6, 4, 'Padang', 16156, '2017-06-04 15:20:08', 'Sudah Diterima Pembeli'),
(7, 4, 'Lubuk Begalung', 17200, '2017-06-04 15:27:53', 'Dalam Pengiriman'),
(8, 4, 'Bukittinggi', 414120, '2017-06-04 15:30:57', 'Dalam Pengemasan'),
(9, 4, 'Padang', 403300, '2017-06-04 15:37:31', 'Dalam Pengiriman'),
(10, 4, 'LUBAS', 48540, '2017-06-04 15:45:34', 'Baru'),
(11, 4, 'huk', 12112.5, '2017-06-04 15:49:05', 'Baru'),
(12, 4, 'yfy', 8087, '2017-06-04 15:51:08', 'Baru');

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE IF NOT EXISTS `pesan` (
  `idpesan` int(11) NOT NULL AUTO_INCREMENT,
  `idproduk` int(11) NOT NULL,
  `idanggota` int(11) NOT NULL,
  `jumlahbeli` int(11) NOT NULL,
  `warna` text NOT NULL,
  `tglselesai` date NOT NULL DEFAULT '0000-00-00',
  `statuspesan` varchar(50) NOT NULL,
  `tglpesan` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idpesan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `pesan`
--


-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `idproduk` int(11) NOT NULL AUTO_INCREMENT,
  `idkat` int(11) NOT NULL,
  `namaproduk` varchar(100) NOT NULL,
  `hargaproduk` double NOT NULL,
  `stok` int(11) NOT NULL,
  `detailproduk` text NOT NULL,
  `diskon` int(11) NOT NULL,
  `berat` float NOT NULL,
  `isikotak` text NOT NULL,
  `foto1` text NOT NULL,
  `foto2` text NOT NULL,
  `tglpost` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idproduk`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `idkat`, `namaproduk`, `hargaproduk`, `stok`, `detailproduk`, `diskon`, `berat`, `isikotak`, `foto1`, `foto2`, `tglpost`) VALUES
(23, 1, 'Bross GG Permata BRGP01 Mini Biru', 7000, 29, '- Memiliki 26 Mutiara\r\n- Memiliki 40 Permata\r\n- Pilihan warna  : Ungu, Orange, Hijau, Biru Muda, Pink Muda', 11, 0.02, 'Satu buah Bross GG Permata', 'PhotoGrid_1496568385407.png', '20170413_150127.png', '2017-06-03 00:13:13'),
(24, 3, 'Cupcake Pincushion SCP01 Ping', 6000, 20, '  Tempat pentul yang berbentuk kue dengan ukuran sebesar telapak tangan orang dewasa\r\nPilihan warna : Biru Motif, Ungu, Ungu Motif, Ping, Kuning', 3, 0.008, 'Satu buah tempat pentul unik ', 'Screenshot_20170603-001406.png', '20170603_001716.png', '2017-06-03 00:23:12'),
(26, 3, 'Cupcake Pincushion SCP01 Kuning', 6000, 15, 'Tempat pentul yang berbentuk kue dengan ukuran sebesar telapak tangan orang dewasa\r\nPilihan warna : Biru Motif, Ungu, Ungu Motif, Ping, Kuning', 3, 0.008, 'Satu buah tempat pentul unik', 'PhotoGrid_1496569032439.png', '20170603_001716.png', '2017-06-04 16:47:02'),
(27, 3, 'Cupcake Pincushion SCP01 Ungu', 6000, 15, 'Tempat pentul yang berbentuk kue dengan ukuran sebesar telapak tangan orang dewasa\r\nPilihan warna : Biru Motif, Ungu, Ungu Motif, Ping, Kuning', 3, 0.008, 'Satu buah tempat pentul unik', 'PhotoGrid_1496568831441.png', '20170603_001716.png', '2017-06-04 16:51:03'),
(28, 3, 'Cupcake Pincushion SCP01 Ungu Motif', 6000, 11, 'Tempat pentul yang berbentuk kue dengan ukuran sebesar telapak tangan orang dewasa\r\nPilihan warna : Biru Motif, Ungu, Ungu Motif, Ping, Kuning', 3, 0.008, 'Satu buah tempat pentul unik', 'PhotoGrid_1496568885940.png', '20170603_001716.png', '2017-06-04 16:52:23'),
(29, 3, 'Cupcake Pincushion SCP01Biru Motif', 6000, 20, 'Tempat pentul yang berbentuk kue dengan ukuran sebesar telapak tangan orang dewasa\r\nPilihan warna : Biru Motif, Ungu, Ungu Motif, Ping, Kuning', 3, 0.008, 'Satu buah tempat pentul unik', 'PhotoGrid_1496568983780.png', '20170603_001716.png', '2017-06-04 16:53:24'),
(30, 2, 'Kalung Bunga Cempaka KL01', 30000, 5, 'Kalung dengan 3 buah bunga dan permata', 0, 0.05, 'satu buat kalung bunga cempaka', '20170604_172434.png', '20170604_172434.png', '2017-06-04 17:29:09'),
(31, 1, 'Bross GG Permata BRGP01 Mini Orange', 7000, 16, '- Memiliki 26 Mutiara\r\n- Memiliki 40 Permata\r\n- Pilihan warna  : Ungu, Orange, Hijau, Biru Muda, Pink Muda', 11, 0.02, 'Satu buah Bross GG Permata', 'PhotoGrid_1496568258317.png', '20170413_150127.png', '2017-06-04 17:34:43'),
(32, 1, 'Bross GG Permata BRGP01 Mini Ungu', 7000, 17, '- Memiliki 26 Mutiara\r\n- Memiliki 40 Permata\r\n- Pilihan warna  : Ungu, Orange, Hijau, Biru Muda, Pink Muda', 11, 0.02, 'Satu buah Bross GG Permata', 'PhotoGrid_1496568208608.png', '20170413_150127.png', '2017-06-04 17:35:53'),
(33, 1, 'Bross GG Permata BRGP01 Mini Hijau', 7000, 20, '- Memiliki 26 Mutiara\r\n- Memiliki 40 Permata\r\n- Pilihan warna  : Ungu, Orange, Hijau, Biru Muda, Pink Muda', 11, 0.02, 'Satu buah Bross GG Permata', 'PhotoGrid_1496568065755.png', '20170413_150127.png', '2017-06-04 17:37:28'),
(34, 1, 'Bross GG Permata BRGP01 Mini Pink', 7000, 21, '- Memiliki 26 Mutiara\r\n- Memiliki 40 Permata\r\n- Pilihan warna  : Ungu, Orange, Hijau, Biru Muda, Pink Muda', 11, 0.02, 'Satu buah Bross GG Permata', 'PhotoGrid_1496568151499.png', '20170413_150127.png', '2017-06-04 17:38:31'),
(35, 1, 'Bross Center SBRB04 Coklat', 4000, 18, 'Bros bulat dengan 19 buah permata', 8, 0.012, 'satu buat bross center coklat', 'PhotoGrid_1496566717220.png', '20170413_145910.png', '2017-06-04 17:42:36'),
(36, 1, 'Bross Center SBRB04 Ping', 4000, 15, ' Bros bulat dengan 19 buah permata', 8, 0.012, 'satu buat bross center ping', 'PhotoGrid_1496566785073.png', '20170413_145910.png', '2017-06-04 17:44:40'),
(37, 1, 'Bross Center SBRB04 Hijau', 4000, 12, ' Bros bulat dengan 19 buah permata', 8, 0.012, 'satu buat bross center hijau', 'PhotoGrid_1496566885798.png', '20170413_145910.png', '2017-06-04 17:45:40'),
(38, 1, 'Bros Bunga BRB08 Kuning', 5500, 20, 'Bros bunga dengan permata di tengah', 9, 0.012, 'satu buah bross bunga kuning', 'PhotoGrid_1496568438124.png', '20170604_174728.png', '2017-06-04 17:51:17'),
(39, 1, 'Bros Bunga BRB08 Ungu', 5500, 17, 'Bros bunga dengan permata di tengah', 9, 0.012, 'satu buah bross bunga ungu', 'PhotoGrid_1496568499379.png', '20170604_174728.png', '2017-06-04 17:53:23'),
(40, 1, 'Bros Bunga BRB08 Orange', 5500, 21, 'Bros bunga dengan permata di tengah', 9, 0.012, 'satu buah bross bunga orange', 'PhotoGrid_1496568556953.png', '20170604_174728.png', '2017-06-04 17:54:53'),
(41, 1, 'Bros Bunga BRB08 Ping', 5500, 19, 'Bros bunga dengan permata di tengah', 9, 0.012, 'satu buah bross bunga ping', 'PhotoGrid_1496568606380.png', '20170604_174728.png', '2017-06-04 17:56:09'),
(42, 1, 'Bros Bunga BRB08 Coklat', 5500, 24, 'Bros bunga dengan permata di tengah', 9, 0.012, 'satu buah bross bunga coklat', 'PhotoGrid_1496568663713.png', '20170604_174728.png', '2017-06-04 17:57:30'),
(43, 1, 'Bros Bunga BRB08 Biru', 5500, 31, 'Bros bunga dengan permata di tengah', 9, 0.012, 'satu buah bross bunga biru', 'PhotoGrid_1496568713251.png', '20170604_174728.png', '2017-06-04 17:58:39'),
(44, 1, 'Bros Juntai BRJ02 Pink', 20000, 16, 'Bros berbentuk bunga dan memiliki juntaian mutiara', 10, 0.022, 'satu buah bros juntai', 'PhotoGrid_1496567487823.png', '20170604_180151.png', '2017-06-04 18:02:45'),
(45, 1, 'Bros Juntai BRJ02 Abu-abu', 20000, 9, ' Bros berbentuk bunga dan memiliki juntaian mutiara', 10, 0.022, 'satu buah bros juntai', 'PhotoGrid_1496567292741.png', '20170604_180151.png', '2017-06-04 18:03:45'),
(46, 1, 'Bros Juntai BRJ02 Orange', 20000, 11, ' Bros berbentuk bunga dan memiliki juntaian mutiara', 10, 0.022, 'satu buah bros juntai', 'PhotoGrid_1496567429537.png', '20170604_180151.png', '2017-06-04 18:05:10'),
(47, 1, 'Bros Lingkar  Bunga BRR01 Orange', 15000, 9, 'Bros bunga lingkaran dengan bunga dan permata', 10, 0.017, 'Satu buah bros lingkar bunga', 'PhotoGrid_1496566943276.png', '20170413_150046_1.png', '2017-06-04 18:22:11'),
(48, 1, 'Bros Lingkar  Bunga BRR01 Ungu tua', 15000, 11, 'Bros bunga lingkaran dengan bunga dan permata', 10, 0.017, 'Satu buah bros lingkar bunga', 'PhotoGrid_1496567156600.png', '20170413_150046_1.png', '2017-06-04 18:23:06'),
(49, 1, 'Bros Lingkar  Bunga BRR01 Ungu Muda', 15000, 10, 'Bros bunga lingkaran dengan bunga dan permata', 10, 0.017, 'Satu buah bros lingkar bunga', 'PhotoGrid_1496567088630.png', '20170413_150046_1.png', '2017-06-04 18:25:19'),
(50, 1, 'Bros Lingkar  Bunga BRR01 Pink', 15000, 5, 'Bros bunga lingkaran dengan bunga dan permata', 10, 0.017, 'Satu buah bros lingkar bunga', 'PhotoGrid_1496567014105.png', '20170413_150046_1.png', '2017-06-04 18:26:21');
