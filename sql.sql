/*
SQLyog Ultimate v8.32 
MySQL - 5.5.28 : Database - chen
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`chen` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `chen`;

/*Table structure for table `clmsb` */

DROP TABLE IF EXISTS `clmsb`;

CREATE TABLE `clmsb` (
  `sybm` varchar(20) NOT NULL,
  `clbh` varchar(20) NOT NULL,
  `cl` varchar(100) DEFAULT NULL,
  `clsm` text,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`clbh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `cstrhxsjbc` */

DROP TABLE IF EXISTS `cstrhxsjbc`;

CREATE TABLE `cstrhxsjbc` (
  `sybm` varchar(20) NOT NULL,
  `cycfxh` varchar(20) NOT NULL,
  `cyrq` varchar(20) NOT NULL,
  `tc` varchar(20) DEFAULT NULL,
  `yjz` float DEFAULT NULL,
  `zzyjC` float DEFAULT NULL,
  `qzyjC` float DEFAULT NULL,
  `qd` float DEFAULT NULL,
  `ql` float DEFAULT NULL,
  `qj` float DEFAULT NULL,
  `yxl` float DEFAULT NULL,
  `sxj` float DEFAULT NULL,
  `wswt` float DEFAULT NULL,
  `wswd` float DEFAULT NULL,
  `pH` float DEFAULT NULL,
  `synd` varchar(10) DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`cycfxh`,`cyrq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `cstrhxsjpm` */

DROP TABLE IF EXISTS `cstrhxsjpm`;

CREATE TABLE `cstrhxsjpm` (
  `sybm` varchar(20) NOT NULL,
  `cycfxh` varchar(20) NOT NULL,
  `cyrq` varchar(20) NOT NULL,
  `tc` varchar(20) DEFAULT NULL,
  `zlhsl` float DEFAULT NULL,
  `xtd` float DEFAULT NULL,
  `atd` float DEFAULT NULL,
  `synd` varchar(10) DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`cycfxh`,`cyrq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `cstrwlsj` */

DROP TABLE IF EXISTS `cstrwlsj`;

CREATE TABLE `cstrwlsj` (
  `sybm` varchar(20) NOT NULL,
  `cycfxh` varchar(20) NOT NULL,
  `tc` varchar(100) DEFAULT NULL,
  `trzd` varchar(100) DEFAULT NULL,
  `nl` float DEFAULT NULL,
  `fl` float DEFAULT NULL,
  `sl` float DEFAULT NULL,
  `rl` float DEFAULT NULL,
  `bhdsl` float DEFAULT NULL,
  `bhhsl` float DEFAULT NULL,
  `tjcsl` float DEFAULT NULL,
  `dwxs` float DEFAULT NULL,
  `drl` float DEFAULT NULL,
  `rrl` float DEFAULT NULL,
  `CEC` float DEFAULT NULL,
  `pH` float DEFAULT NULL,
  `EC` float DEFAULT NULL,
  `h1` int(11) DEFAULT NULL,
  `w1` float DEFAULT NULL,
  `h2` int(11) DEFAULT NULL,
  `w2` float DEFAULT NULL,
  `h3` int(11) DEFAULT NULL,
  `w3` float DEFAULT NULL,
  `h4` int(11) DEFAULT NULL,
  `w4` float DEFAULT NULL,
  `h5` int(11) DEFAULT NULL,
  `w5` float DEFAULT NULL,
  `h6` int(11) DEFAULT NULL,
  `w6` float DEFAULT NULL,
  `h7` int(11) DEFAULT NULL,
  `w7` float DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`cycfxh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ggjlb` */

DROP TABLE IF EXISTS `ggjlb`;

CREATE TABLE `ggjlb` (
  `sybm` varchar(20) NOT NULL,
  `clbh` varchar(20) NOT NULL,
  `chakou` varchar(20) NOT NULL,
  `ggrq` varchar(20) NOT NULL,
  `sy` varchar(50) DEFAULT NULL,
  `ggfs` varchar(40) DEFAULT NULL,
  `gsl` int(11) DEFAULT NULL,
  `khd` float DEFAULT NULL,
  `EC` float DEFAULT NULL,
  `pH` float DEFAULT NULL,
  `synd` varchar(10) DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`clbh`,`chakou`,`ggrq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `ghsjb` */

DROP TABLE IF EXISTS `ghsjb`;

CREATE TABLE `ghsjb` (
  `sybm` varchar(20) NOT NULL,
  `cyrq` varchar(20) NOT NULL,
  `syq` varchar(20) DEFAULT NULL,
  `clbh` varchar(20) NOT NULL,
  `xqbh` varchar(20) NOT NULL,
  `ypwz` varchar(200) DEFAULT NULL,
  `ylshl` varchar(200) DEFAULT NULL,
  `ypss` varchar(200) DEFAULT NULL,
  `qkdd` float DEFAULT '0',
  `jghsl` float DEFAULT NULL,
  `ztsd` float DEFAULT NULL,
  `bjCO2nd` float DEFAULT NULL,
  PRIMARY KEY (`sybm`,`cyrq`,`clbh`,`xqbh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `gxsjb` */

DROP TABLE IF EXISTS `gxsjb`;

CREATE TABLE `gxsjb` (
  `sybm` varchar(20) NOT NULL,
  `cyrq` varchar(20) NOT NULL,
  `clbh` varchar(20) NOT NULL,
  `xqbh` varchar(20) NOT NULL,
  `gxz` float DEFAULT NULL,
  `ggz` float DEFAULT NULL,
  `gc` float DEFAULT NULL,
  `gdtymj` float DEFAULT NULL,
  `gdbmj` float DEFAULT NULL,
  `gdpjzj` float DEFAULT NULL,
  `gdtj` float DEFAULT NULL,
  `gjs` int(11) DEFAULT NULL,
  `gszp` varchar(100) DEFAULT NULL,
  `synd` varchar(10) DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`cyrq`,`clbh`,`xqbh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `jbqkb` */

DROP TABLE IF EXISTS `jbqkb`;

CREATE TABLE `jbqkb` (
  `sybm` varchar(20) NOT NULL,
  `dz` varchar(100) DEFAULT NULL,
  `fzdw` varchar(100) DEFAULT NULL,
  `fzr` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `jingdu` varchar(100) DEFAULT NULL,
  `weidu` varchar(100) DEFAULT NULL,
  `haiba` float DEFAULT NULL,
  `zzms` varchar(100) DEFAULT NULL,
  `trzd` varchar(100) DEFAULT NULL,
  `trmc` varchar(100) DEFAULT NULL,
  `trywmc` varchar(100) DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  `cjr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sybm`),
  KEY `试验编码` (`sybm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `kzb` */

DROP TABLE IF EXISTS `kzb`;

CREATE TABLE `kzb` (
  `sybm` varchar(20) NOT NULL,
  `clbh` varchar(20) NOT NULL,
  `xqbh` varchar(20) NOT NULL,
  `cyrq` varchar(20) NOT NULL,
  `zhugao` float DEFAULT NULL,
  `jingcu` float DEFAULT NULL,
  `yepianshu` int(11) DEFAULT NULL,
  `qymianji` float DEFAULT NULL,
  `youxiaofenzhenshu` int(11) DEFAULT NULL,
  `suishu` int(11) DEFAULT NULL,
  `suilishui` int(11) DEFAULT NULL,
  `suichang` float DEFAULT NULL,
  `ymtjc` float DEFAULT NULL,
  `ymshs` float DEFAULT NULL,
  `ymszj` float DEFAULT NULL,
  `qlz` float DEFAULT NULL,
  `zlcl` float DEFAULT NULL,
  `swcl` float DEFAULT NULL,
  `zlhsl` float DEFAULT NULL,
  `N` float DEFAULT NULL,
  `P` float DEFAULT NULL,
  `K` float DEFAULT NULL,
  `synd` varchar(10) DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`clbh`,`xqbh`,`cyrq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `qxsjb` */

DROP TABLE IF EXISTS `qxsjb`;

CREATE TABLE `qxsjb` (
  `qxzdm` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  `jiangshuiliang` float DEFAULT NULL,
  `jfmjflE601` float DEFAULT NULL,
  `jfmjfl$20` float DEFAULT NULL,
  `jfs` float DEFAULT NULL,
  `rzss` float DEFAULT NULL,
  `smgfs` float DEFAULT NULL,
  `hightemp` float DEFAULT NULL,
  `lowtemp` float DEFAULT NULL,
  `avgtemp` float DEFAULT NULL,
  `kqxdsd` float DEFAULT NULL,
  `_0cmdw` float DEFAULT NULL,
  `_5cmdw` float DEFAULT NULL,
  `_10cmdw` float DEFAULT NULL,
  `_15cmdw` float DEFAULT NULL,
  `_20cmdw` float DEFAULT NULL,
  `_40cmdw` float DEFAULT NULL,
  `_80cmdw` float DEFAULT NULL,
  `_160cmdw` float DEFAULT NULL,
  `_320cmdw` float DEFAULT NULL,
  `synd` varchar(10) DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`qxzdm`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sfjlb` */

DROP TABLE IF EXISTS `sfjlb`;

CREATE TABLE `sfjlb` (
  `sybm` varchar(20) NOT NULL,
  `clbh` varchar(20) NOT NULL,
  `chakou` varchar(20) NOT NULL,
  `sfdate` varchar(20) NOT NULL,
  `sftype` varchar(10) DEFAULT NULL,
  `flname` varchar(20) DEFAULT NULL,
  `sfmethod` varchar(10) DEFAULT NULL,
  `N` float DEFAULT NULL,
  `P2O5` float DEFAULT NULL,
  `K2O` float DEFAULT NULL,
  `yjC` float DEFAULT NULL,
  `synd` varchar(10) DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`clbh`,`chakou`,`sfdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `syqjlb` */

DROP TABLE IF EXISTS `syqjlb`;

CREATE TABLE `syqjlb` (
  `sybm` varchar(20) NOT NULL,
  `clbh` varchar(20) NOT NULL,
  `chakou` varchar(20) NOT NULL,
  `wuhouqi` varchar(50) NOT NULL,
  `startdate` varchar(20) DEFAULT NULL,
  `processdate` varchar(20) DEFAULT NULL,
  `enddate` varchar(20) DEFAULT NULL,
  `synd` varchar(10) NOT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`clbh`,`chakou`,`wuhouqi`,`synd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `trhxsjbc` */

DROP TABLE IF EXISTS `trhxsjbc`;

CREATE TABLE `trhxsjbc` (
  `sybm` varchar(20) NOT NULL,
  `clbh` varchar(20) NOT NULL,
  `xqbh` varchar(20) NOT NULL,
  `cywz` varchar(50) DEFAULT NULL,
  `cyrq` varchar(20) NOT NULL,
  `tc` varchar(30) DEFAULT NULL,
  `yjz` float DEFAULT NULL,
  `zzyjC` float DEFAULT NULL,
  `qzyjC` float DEFAULT NULL,
  `qd` float DEFAULT NULL,
  `ql` float DEFAULT NULL,
  `qj` float DEFAULT NULL,
  `yxl` float DEFAULT NULL,
  `sxj` float DEFAULT NULL,
  `wswt` float DEFAULT NULL,
  `wswd` float DEFAULT NULL,
  `pH` float DEFAULT NULL,
  `synd` varchar(10) NOT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`clbh`,`xqbh`,`cyrq`,`synd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `trhxsjpm` */

DROP TABLE IF EXISTS `trhxsjpm`;

CREATE TABLE `trhxsjpm` (
  `sybm` varchar(20) NOT NULL,
  `clbh` varchar(20) NOT NULL,
  `xqbh` varchar(20) NOT NULL,
  `qywz` varchar(10) DEFAULT NULL,
  `cyrq` varchar(20) NOT NULL,
  `tc` varchar(20) DEFAULT NULL,
  `zlhsl` float DEFAULT NULL,
  `xtd` float DEFAULT NULL,
  `atd` float DEFAULT NULL,
  `synd` varchar(10) NOT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`clbh`,`xqbh`,`cyrq`,`synd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `trpmsfdtsjb` */

DROP TABLE IF EXISTS `trpmsfdtsjb`;

CREATE TABLE `trpmsfdtsjb` (
  `sybm` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  `clbh` varchar(20) NOT NULL,
  `xqbh` varchar(20) NOT NULL,
  `tcsd` varchar(20) DEFAULT NULL,
  `tjhsl` float DEFAULT NULL,
  `trwd` float DEFAULT NULL,
  `yf` float DEFAULT NULL,
  `synd` varchar(10) DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`date`,`clbh`,`xqbh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `trsrydtsjb` */

DROP TABLE IF EXISTS `trsrydtsjb`;

CREATE TABLE `trsrydtsjb` (
  `sybm` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  `clbh` varchar(20) NOT NULL,
  `xqbh` varchar(20) NOT NULL,
  `ttwz` varchar(50) DEFAULT NULL,
  `port1dy` int(11) DEFAULT NULL,
  `port1wd` float DEFAULT NULL,
  `port1yf` float DEFAULT NULL,
  `port2dy` int(11) DEFAULT NULL,
  `port2wd` float DEFAULT NULL,
  `port2yf` float DEFAULT NULL,
  `port3dy` int(11) DEFAULT NULL,
  `port3wd` float DEFAULT NULL,
  `port3yf` float NOT NULL,
  `port4dy` int(11) DEFAULT NULL,
  `port4wd` float DEFAULT NULL,
  `port4yf` float DEFAULT NULL,
  `port5dy` int(11) DEFAULT NULL,
  `port5wd` float DEFAULT NULL,
  `port5yf` float DEFAULT NULL,
  `synd` varchar(10) DEFAULT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`date`,`clbh`,`xqbh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `trwlsjb` */

DROP TABLE IF EXISTS `trwlsjb`;

CREATE TABLE `trwlsjb` (
  `sybm` varchar(20) NOT NULL,
  `clbh` varchar(20) NOT NULL,
  `xqbh` varchar(20) NOT NULL,
  `qydate` varchar(20) NOT NULL,
  `cycfxh` varchar(50) NOT NULL,
  `tc` varchar(50) DEFAULT NULL,
  `rz` float DEFAULT NULL,
  `bhdsl` float DEFAULT NULL,
  `drl` float DEFAULT NULL,
  `rrl` float DEFAULT NULL,
  `CEC` float DEFAULT NULL,
  `pH` float DEFAULT NULL,
  `h1` int(11) DEFAULT NULL,
  `w1` float DEFAULT NULL,
  `h2` int(11) DEFAULT NULL,
  `w2` float DEFAULT NULL,
  `h3` int(11) DEFAULT NULL,
  `w3` float DEFAULT NULL,
  `h4` int(11) DEFAULT NULL,
  `w4` float DEFAULT NULL,
  `h5` int(11) DEFAULT NULL,
  `w5` float DEFAULT NULL,
  `h6` int(11) DEFAULT NULL,
  `w6` float DEFAULT NULL,
  `h7` int(11) DEFAULT NULL,
  `w7` float DEFAULT NULL,
  `s1` varchar(10) DEFAULT NULL,
  `a1` float DEFAULT NULL,
  `s2` varchar(10) DEFAULT NULL,
  `a2` float DEFAULT NULL,
  `s3` varchar(10) DEFAULT NULL,
  `a3` float DEFAULT NULL,
  `s4` varchar(10) DEFAULT NULL,
  `a4` float DEFAULT NULL,
  `s5` varchar(10) DEFAULT NULL,
  `a5` float DEFAULT NULL,
  `s6` varchar(10) DEFAULT NULL,
  `a6` float DEFAULT NULL,
  `synd` varchar(10) NOT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`clbh`,`xqbh`,`qydate`,`cycfxh`,`synd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `wsqtcdb` */

DROP TABLE IF EXISTS `wsqtcdb`;

CREATE TABLE `wsqtcdb` (
  `sybm` varchar(20) NOT NULL,
  `cydate` varchar(20) NOT NULL,
  `clbh` varchar(20) NOT NULL,
  `xqbh` varchar(20) NOT NULL,
  `zwCO2pfsl` float DEFAULT NULL,
  `zwCH4pfsl` float DEFAULT NULL,
  `zwN2Opfsl` float DEFAULT NULL,
  `trCO2pfsl` float DEFAULT NULL,
  `trCH4pfsl` float DEFAULT NULL,
  `trN2Opfsl` float DEFAULT NULL,
  `bctrwd` int(11) DEFAULT NULL,
  `trhsl` float DEFAULT NULL,
  `synd` varchar(10) NOT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`cydate`,`clbh`,`xqbh`,`synd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `yhb` */

DROP TABLE IF EXISTS `yhb`;

CREATE TABLE `yhb` (
  `yhm` varchar(10) NOT NULL,
  `sf` varchar(10) DEFAULT NULL,
  `ssjs` varchar(10) DEFAULT NULL,
  `mm` varchar(10) DEFAULT NULL,
  `qx` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`yhm`),
  KEY `用户名` (`yhm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zzjlb` */

DROP TABLE IF EXISTS `zzjlb`;

CREATE TABLE `zzjlb` (
  `sybm` varchar(20) NOT NULL,
  `chakou` varchar(20) NOT NULL,
  `zwname` varchar(50) DEFAULT NULL,
  `zwtype` varchar(50) DEFAULT NULL,
  `bzdate` varchar(20) DEFAULT NULL,
  `shdate` varchar(20) DEFAULT NULL,
  `bznum` int(11) DEFAULT NULL,
  `qlz` float DEFAULT NULL,
  `bzdepth` int(11) DEFAULT NULL,
  `bztype` varchar(50) DEFAULT NULL,
  `cml` float DEFAULT NULL,
  `zhj` varchar(50) DEFAULT NULL,
  `hx` varchar(50) DEFAULT NULL,
  `gzfs` varchar(50) DEFAULT NULL,
  `synd` varchar(10) NOT NULL,
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`chakou`,`synd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zzypb` */

DROP TABLE IF EXISTS `zzypb`;

CREATE TABLE `zzypb` (
  `sybm` varchar(20) NOT NULL,
  `cydate` varchar(20) NOT NULL,
  `syq` varchar(20) NOT NULL,
  `clbh` varchar(20) NOT NULL,
  `xqbh` varchar(20) NOT NULL,
  `zhugao` float DEFAULT NULL,
  `jingcu` float DEFAULT NULL,
  `yepianshu` int(11) DEFAULT NULL,
  `dsbxz` float DEFAULT NULL,
  `dsbgz` float DEFAULT NULL,
  `fenmishu` int(11) DEFAULT NULL,
  `ymjzs` float DEFAULT NULL,
  `ghyxfs` float DEFAULT NULL,
  `gcwd` float DEFAULT NULL,
  `synd` varchar(10) DEFAULT '',
  `bz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sybm`,`cydate`,`syq`,`clbh`,`xqbh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
