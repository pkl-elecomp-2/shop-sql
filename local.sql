-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: toko_online
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `data_refund`
--

DROP TABLE IF EXISTS `data_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_refund` (
  `id_refund` int(11) NOT NULL AUTO_INCREMENT,
  `id_detail_order` int(11) NOT NULL,
  `no_rekening` varchar(50) NOT NULL,
  `ATM` varchar(50) NOT NULL,
  `nama_penerima` varchar(50) NOT NULL,
  `status_kirim` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_refund`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detail_order`
--

DROP TABLE IF EXISTS `detail_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_order` (
  `id_detail_order` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` varchar(20) DEFAULT NULL,
  `id_penjual` varchar(50) DEFAULT NULL,
  `id_ongkir_pembeli` int(11) DEFAULT NULL,
  `id_produk` varchar(15) DEFAULT NULL,
  `id_jadwal` int(11) DEFAULT NULL,
  `jumlah_produk` int(11) DEFAULT NULL,
  `berat_produk` double DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `harga_pajak` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `subtotal_pajak` double DEFAULT NULL,
  `no_resi` varchar(50) DEFAULT NULL,
  `pembayaran` double DEFAULT NULL,
  `tagihan` double DEFAULT NULL,
  `status_kirim` int(1) DEFAULT NULL,
  `status_detail_komplain` int(11) NOT NULL DEFAULT 0,
  `status_bayar` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_detail_order`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detail_pengiriman`
--

DROP TABLE IF EXISTS `detail_pengiriman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_pengiriman` (
  `id_detail_pengiriman` int(11) NOT NULL AUTO_INCREMENT,
  `id_detail_order` int(11) NOT NULL,
  `tanggal_konfirmasi` date NOT NULL,
  `tanggal_kirim` date DEFAULT NULL,
  `status_kadaluarsa` int(1) NOT NULL,
  PRIMARY KEY (`id_detail_pengiriman`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL AUTO_INCREMENT,
  `tgl_berangkat` varchar(100) NOT NULL,
  `tgl_pulang` varchar(100) NOT NULL,
  `id_produk` int(11) NOT NULL,
  PRIMARY KEY (`id_jadwal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kategori_produk`
--

DROP TABLE IF EXISTS `kategori_produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori_produk` (
  `id_kategori_produk` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori_produk` varchar(100) NOT NULL,
  `aktif_kategori_produk` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `title_kategori_produk` varchar(50) NOT NULL,
  `meta_description_kategori_produk` varchar(100) NOT NULL,
  `meta_keywords_kategori_produk` varchar(100) NOT NULL,
  `ikon_kategori` varchar(255) DEFAULT '' COMMENT 'Untuk Ikon di Android',
  PRIMARY KEY (`id_kategori_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keranjang_belanja`
--

DROP TABLE IF EXISTS `keranjang_belanja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keranjang_belanja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_keranjang_belanja` varchar(60) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `harga_produk` double DEFAULT NULL,
  `berat_bersih` int(11) DEFAULT NULL,
  `berat_kotor` int(11) NOT NULL,
  `jumlah_produk` int(11) NOT NULL,
  `berat_total` int(11) NOT NULL,
  `subtotal_belanja` double NOT NULL,
  `id_jadwal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2127575946 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `klaim_detail_order`
--

DROP TABLE IF EXISTS `klaim_detail_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klaim_detail_order` (
  `id_detail_order` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` varchar(20) NOT NULL,
  `id_penjual` varchar(50) NOT NULL,
  `id_produk` varchar(15) NOT NULL,
  `jumlah_produk` int(11) NOT NULL,
  `berat_produk` double NOT NULL,
  `harga` double NOT NULL,
  `harga_pajak` double NOT NULL,
  `subtotal` double NOT NULL,
  `subtotal_pajak` double NOT NULL,
  `no_resi` varchar(50) NOT NULL,
  `pembayaran` double NOT NULL,
  `tagihan` double NOT NULL,
  `status_kirim` int(1) NOT NULL,
  `keterangan` text NOT NULL,
  `id_ongkir_pembeli` varchar(255) NOT NULL,
  `status_detail_komplain` int(11) NOT NULL,
  PRIMARY KEY (`id_detail_order`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `komplain_barang`
--

DROP TABLE IF EXISTS `komplain_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `komplain_barang` (
  `id_komplain` int(11) NOT NULL AUTO_INCREMENT,
  `id_detail_order` varchar(50) NOT NULL,
  `id_penjual` varchar(50) DEFAULT NULL,
  `pesan_komplain` text NOT NULL,
  `bukti_komplain` varchar(50) NOT NULL,
  `jumlah_produk_komplain` int(11) NOT NULL,
  `jenis_komplain` varchar(255) NOT NULL,
  `status_komplain` varchar(50) NOT NULL DEFAULT 'Belum Ditangani',
  `tgl_komplain` date NOT NULL,
  `status_dana_kembali` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_komplain`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `konfirmasi_bayar`
--

DROP TABLE IF EXISTS `konfirmasi_bayar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `konfirmasi_bayar` (
  `id_konfirmasi` int(11) NOT NULL AUTO_INCREMENT,
  `tgl_konfirmasi` date NOT NULL,
  `id_order` varchar(255) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL,
  `bank_bayar` varchar(20) NOT NULL,
  `rekening_bayar` varchar(30) NOT NULL,
  `nama_bayar` varchar(30) NOT NULL,
  `foto` varchar(225) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id_konfirmasi`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `konfirmasi_penerimaan`
--

DROP TABLE IF EXISTS `konfirmasi_penerimaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `konfirmasi_penerimaan` (
  `id_penerimaan` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_penjual` varchar(50) NOT NULL,
  `tanggal_penerimaan` date NOT NULL,
  `foto_bukti` varchar(100) NOT NULL,
  PRIMARY KEY (`id_penerimaan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `konfirmasi_pengembalian_produk`
--

DROP TABLE IF EXISTS `konfirmasi_pengembalian_produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `konfirmasi_pengembalian_produk` (
  `id_konfirmasi_pengembalian_produk` int(11) NOT NULL AUTO_INCREMENT,
  `id_komplain_barang` int(11) NOT NULL,
  `id_detail_order` int(11) NOT NULL,
  `id_order` varchar(255) NOT NULL,
  `no_resi_pengembalian` varchar(255) DEFAULT NULL,
  `no_rek` varchar(255) NOT NULL,
  `nama_rek` varchar(255) NOT NULL,
  `jenis_bank` varchar(255) NOT NULL,
  `status_sampai` int(11) NOT NULL DEFAULT 0,
  `no_resi_ganti` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_konfirmasi_pengembalian_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kota`
--

DROP TABLE IF EXISTS `kota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kota` (
  `id_kota` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kota` varchar(50) NOT NULL,
  PRIMARY KEY (`id_kota`),
  UNIQUE KEY `nama_kota` (`nama_kota`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_aktivitas`
--

DROP TABLE IF EXISTS `log_aktivitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_aktivitas` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` varchar(255) NOT NULL,
  `aktivitas` text NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nama_menu` varchar(50) NOT NULL,
  `foto_menu` varchar(100) NOT NULL,
  `title_menu` varchar(50) NOT NULL,
  `meta_description_menu` varchar(100) NOT NULL,
  `meta_keywords_menu` varchar(100) NOT NULL,
  `aktif_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id_order` varchar(11) NOT NULL,
  `tgl_order` datetime NOT NULL,
  `total_order` int(11) NOT NULL,
  `jumlah_order` int(11) NOT NULL,
  `id_jadwal` int(11) DEFAULT NULL,
  `status_order` varchar(30) NOT NULL DEFAULT '1' COMMENT 'transaksi belum bayar,menunggu konfirmasi, sudah bayar',
  `nama_order` varchar(60) NOT NULL,
  `alamat_order` text NOT NULL,
  `tlp_order` varchar(20) NOT NULL,
  `email_order` varchar(60) DEFAULT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `status_bayar` int(11) DEFAULT 0,
  `kurir` varchar(50) NOT NULL,
  `paket_kirim` varchar(50) NOT NULL,
  `lama_kirim` varchar(50) NOT NULL,
  `link_bayar` varchar(255) DEFAULT NULL,
  `tgl_kirim` date DEFAULT NULL,
  `max_kirim` date DEFAULT NULL,
  `batas_bayar` datetime DEFAULT NULL,
  PRIMARY KEY (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produk`
--

DROP TABLE IF EXISTS `produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` varchar(50) NOT NULL DEFAULT 'Admin',
  `kode_produk` varchar(20) DEFAULT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `id_menu` int(11) NOT NULL DEFAULT 1,
  `kategori_produk` int(11) NOT NULL,
  `harga` int(255) NOT NULL,
  `berat_kotor` int(11) NOT NULL,
  `berat_bersih` int(11) NOT NULL,
  `stok_produk` varchar(20) DEFAULT NULL,
  `ket` text DEFAULT NULL,
  `deskripsi` text NOT NULL,
  `foto_produk1` varchar(50) DEFAULT NULL,
  `foto_produk2` varchar(50) NOT NULL,
  `foto_produk3` varchar(50) NOT NULL,
  `jumlah_stok` int(11) NOT NULL,
  `jumlah_terjual` int(11) DEFAULT NULL,
  `provinsi` int(11) NOT NULL DEFAULT 11,
  `kota` int(11) NOT NULL DEFAULT 255,
  `validasi` tinyint(1) NOT NULL DEFAULT 0,
  `pajak` double NOT NULL DEFAULT 5,
  PRIMARY KEY (`id_produk`)
) ENGINE=MyISAM AUTO_INCREMENT=2107300003 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review_produk`
--

DROP TABLE IF EXISTS `review_produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_produk` (
  `id_review` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk` int(11) NOT NULL,
  `nama_review` varchar(50) NOT NULL,
  `email_review` varchar(50) NOT NULL,
  `komentar` text NOT NULL,
  `rate_star` int(11) NOT NULL,
  `time_review` datetime NOT NULL,
  PRIMARY KEY (`id_review`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slider` (
  `id_slider` int(11) NOT NULL AUTO_INCREMENT,
  `gambar` varchar(256) NOT NULL,
  PRIMARY KEY (`id_slider`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_detail_pengiriman`
--

DROP TABLE IF EXISTS `t_detail_pengiriman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_detail_pengiriman` (
  `id_detail_pengiriman` int(11) NOT NULL AUTO_INCREMENT,
  `id_detail_order` int(11) NOT NULL,
  `tanggal_konfirmasi` date NOT NULL,
  `tanggal_kirim` date DEFAULT NULL,
  `status_kadaluarsa` int(1) NOT NULL,
  PRIMARY KEY (`id_detail_pengiriman`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaksi_midtrans`
--

DROP TABLE IF EXISTS `transaksi_midtrans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi_midtrans` (
  `id_order` char(20) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `kelas` varchar(6) DEFAULT NULL,
  `gross_amount` int(30) DEFAULT NULL,
  `payment_type` varchar(15) DEFAULT NULL,
  `transaction_time` varchar(19) DEFAULT NULL,
  `bank` varchar(10) DEFAULT NULL,
  `va_number` varchar(40) DEFAULT NULL,
  `pdf_url` text DEFAULT NULL,
  `status_code` char(3) DEFAULT NULL,
  PRIMARY KEY (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `waktu_bayar`
--

DROP TABLE IF EXISTS `waktu_bayar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waktu_bayar` (
  `id_waktu` int(11) NOT NULL AUTO_INCREMENT,
  `mode` varchar(50) DEFAULT NULL,
  `waktu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_waktu`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-06 19:00:36
