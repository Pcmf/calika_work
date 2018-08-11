-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2018 at 07:23 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `calika`
--

-- --------------------------------------------------------

--
-- Table structure for table `artigo`
--

CREATE TABLE `artigo` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artigo`
--

INSERT INTO `artigo` (`id`, `nome`, `descricao`) VALUES
(1, 'Babygrow de abrir á frente', ''),
(2, 'Manta', ''),
(3, 'Babygrow de alçapão', ''),
(4, 'Babygrow 2 aberturas frente', '');

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `valorinicial` int(11) NOT NULL DEFAULT '1',
  `nome` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `contacto` varchar(15) NOT NULL,
  `responsavel` varchar(100) NOT NULL,
  `pasta` varchar(20) NOT NULL,
  `logo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`id`, `codigo`, `valorinicial`, `nome`, `email`, `contacto`, `responsavel`, `pasta`, `logo`) VALUES
(7, '608-', 1, 'Mayoral', 'geral@mayoral.com', '334223434', 'Josefina', 'logos', 'mayoral.png'),
(8, 'vfsds', 1, 'Feira Virtual', 'aefd', '2324324', 'sdsd', 'logos', 'baby.png'),
(9, 'z34', 1, 'Zara', 'qewrfer', 'd434', '343re', 'logos', 'zaralogo.jpg'),
(10, 'hh', 212, 'Teste', 'ewrfwerf', '3232', 'earfadss', 'logos', 'favicon-16x16.png');

-- --------------------------------------------------------

--
-- Table structure for table `cor`
--

CREATE TABLE `cor` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `ref` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cor`
--

INSERT INTO `cor` (`id`, `nome`, `ref`) VALUES
(1, 'Branco', '#43443'),
(2, 'Vermelho', 'rrre'),
(3, 'Azul', '#333'),
(4, 'Rosa', '#4444'),
(6, 'verde', 'esrew'),
(10, 'Cinza', 'dd'),
(12, 'Roxo', 'xxx');

-- --------------------------------------------------------

--
-- Table structure for table `detalhepedido`
--

CREATE TABLE `detalhepedido` (
  `pedido` int(11) NOT NULL,
  `linha` int(11) NOT NULL,
  `modelo` int(11) NOT NULL,
  `embalagem` int(11) NOT NULL,
  `obsCliente` blob NOT NULL,
  `obsEmbalagem` blob NOT NULL,
  `corTamanhos` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detalhepedido`
--

INSERT INTO `detalhepedido` (`pedido`, `linha`, `modelo`, `embalagem`, `obsCliente`, `obsEmbalagem`, `corTamanhos`) VALUES
(18, 1, 17, 0, '', '', ''),
(19, 2, 20, 0, '', '', ''),
(19, 3, 25, 0, '', '', ''),
(19, 4, 40, 0, '', '', ''),
(20, 2, 38, 0, '', '', ''),
(21, 1, 32, 0, '', '', ''),
(21, 2, 33, 0, '', '', ''),
(21, 3, 34, 0, '', '', ''),
(22, 1, 35, 0, '', '', ''),
(23, 1, 36, 0, '', '', ''),
(25, 1, 39, 0, '', '', ''),
(26, 1, 41, 0, '', '', ''),
(26, 2, 43, 0, '', '', ''),
(27, 1, 44, 0, '', '', ''),
(27, 2, 45, 0, '', '', ''),
(27, 3, 46, 0, '', '', ''),
(27, 4, 50, 0, '', '', ''),
(30, 1, 57, 0, '', '', ''),
(30, 2, 58, 0, '', '', ''),
(31, 1, 55, 0, '', '', ''),
(31, 2, 56, 0, '', '', ''),
(32, 1, 59, 0, '', '', ''),
(33, 1, 62, 0, '', '', ''),
(35, 1, 53, 0, '', '', ''),
(35, 2, 54, 0, '', '', ''),
(36, 1, 60, 0, '', '', ''),
(36, 2, 61, 0, '', '', ''),
(37, 1, 63, 0, '', '', ''),
(37, 2, 64, 0, '', '', ''),
(37, 3, 73, 0, '', '', ''),
(37, 4, 74, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `detpedcor`
--

CREATE TABLE `detpedcor` (
  `pedido` int(11) NOT NULL,
  `modelo` int(11) NOT NULL,
  `linha` int(11) NOT NULL,
  `cor1` varchar(100) NOT NULL,
  `cor2` varchar(100) DEFAULT NULL,
  `elem1` varchar(200) DEFAULT NULL COMMENT 'json object: elm & cor',
  `elem2` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `elem3` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `qtys` varchar(300) CHARACTER SET latin1 NOT NULL COMMENT 'json object with qtys',
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detpedcor`
--

INSERT INTO `detpedcor` (`pedido`, `modelo`, `linha`, `cor1`, `cor2`, `elem1`, `elem2`, `elem3`, `qtys`, `data`) VALUES
(18, 17, 1, '{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}', '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '{\"elemento\":{\"0\":\"2\",\"1\":\"Folhos\",\"2\":\"\",\"id\":\"2\",\"nome\":\"Folhos\",\"descricao\":\"\"},\"corElem\":{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}}', '\"\"', '\"\"', '{\"m00\":\"2\",\"m0\":\"2\",\"m1\":\"2\",\"m3\":\"3\",\"m6\":\"4\",\"m9\":\"5\",\"m12\":\"6\",\"m18\":\"6\",\"m24\":\"2\",\"m36\":\"2\"}', '2018-01-31 13:10:06'),
(18, 17, 2, '{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}', '{\"0\":\"4\",\"1\":\"Rosa\",\"2\":\"#4444\",\"id\":\"4\",\"nome\":\"Rosa\",\"ref\":\"#4444\"}', '\"\"', '\"\"', '\"\"', '{\"m00\":\"4\",\"m0\":\"4\",\"m1\":\"4\",\"m3\":\"4\",\"m36\":\"5\",\"m12\":\"5\",\"m6\":\"5\",\"m9\":\"5\",\"m18\":\"5\",\"m24\":\"5\"}', '2018-01-31 13:10:27'),
(18, 17, 3, '{\"0\":\"3\",\"1\":\"Azul\",\"2\":\"#333\",\"id\":\"3\",\"nome\":\"Azul\",\"ref\":\"#333\"}', '', '\"\"', '\"\"', '\"\"', '{\"m00\":\"5\",\"m1\":\"5\",\"m6\":\"5\",\"m12\":\"5\",\"m36\":\"5\"}', '2018-01-31 13:12:38'),
(19, 20, 1, '{\"0\":\"3\",\"1\":\"Azul\",\"2\":\"#333\",\"id\":\"3\",\"nome\":\"Azul\",\"ref\":\"#333\"}', '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '{\"elemento\":{\"0\":\"1\",\"1\":\"Clorete\",\"2\":\"\",\"id\":\"1\",\"nome\":\"Clorete\",\"descricao\":\"\"},\"corElem\":{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}}', '\"\"', '\"\"', '{\"m00\":\"4\",\"m0\":\"4\",\"m1\":\"4\",\"m3\":\"4\",\"m6\":\"4\",\"m9\":\"4\",\"m12\":\"4\"}', '2018-04-28 08:24:18'),
(19, 25, 1, '{\"0\":\"3\",\"1\":\"Azul\",\"2\":\"#333\",\"id\":\"3\",\"nome\":\"Azul\",\"ref\":\"#333\"}', '\"\"', '\"\"', '\"\"', '\"\"', '{\"TU\":\"12\"}', '2018-04-28 08:23:44'),
(19, 25, 2, '{\"0\":\"10\",\"1\":\"Cinza\",\"2\":\"dd\",\"id\":\"10\",\"nome\":\"Cinza\",\"ref\":\"dd\"}', '\"\"', '\"\"', '\"\"', '\"\"', '{\"TU\":\"12\"}', '2018-04-28 08:23:56'),
(19, 40, 1, '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}', '\"\"', '\"\"', '\"\"', '{\"m00\":\"5\",\"m0\":\"5\",\"m1\":\"5\",\"m12\":\"5\",\"m18\":\"5\"}', '2018-04-28 08:23:02'),
(19, 40, 2, '{\"0\":\"4\",\"1\":\"Rosa\",\"2\":\"#4444\",\"id\":\"4\",\"nome\":\"Rosa\",\"ref\":\"#4444\"}', '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '\"\"', '\"\"', '\"\"', '{\"m00\":\"6\",\"m1\":\"6\",\"m0\":\"6\",\"m3\":\"6\",\"m6\":\"6\",\"m9\":\"6\"}', '2018-04-28 08:23:20'),
(20, 38, 1, '{\"0\":\"3\",\"1\":\"Azul\",\"2\":\"#333\",\"id\":\"3\",\"nome\":\"Azul\",\"ref\":\"#333\"}', '{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}', '\"\"', '\"\"', '\"\"', '{\"m00\":\"7\",\"m1\":\"7\",\"m6\":\"7\",\"m12\":\"7\",\"m24\":\"7\",\"m0\":\"8\",\"m3\":\"8\",\"m9\":\"8\",\"m18\":\"8\",\"m36\":\"8\"}', '2018-03-21 14:29:42'),
(20, 38, 2, '{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}', '\"\"', '\"\"', '\"\"', '\"\"', '{\"m00\":\"6\",\"m0\":\"6\",\"m1\":\"6\",\"m3\":\"6\",\"m6\":\"6\",\"m9\":\"5\"}', '2018-04-30 23:19:11'),
(21, 32, 1, '{\"0\":\"4\",\"1\":\"Rosa\",\"2\":\"#4444\",\"id\":\"4\",\"nome\":\"Rosa\",\"ref\":\"#4444\"}', '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '{\"elemento\":{\"0\":\"1\",\"1\":\"Clorete\",\"2\":\"\",\"id\":\"1\",\"nome\":\"Clorete\",\"descricao\":\"\"},\"corElem\":{\"0\":\"4\",\"1\":\"Rosa\",\"2\":\"#4444\",\"id\":\"4\",\"nome\":\"Rosa\",\"ref\":\"#4444\"}}', '\"\"', '\"\"', '{\"m00\":\"5\",\"m0\":\"5\",\"m1\":\"5\"}', '2018-01-31 11:05:10'),
(21, 32, 2, '{\"0\":\"6\",\"1\":\"verde\",\"2\":\"esrew\",\"id\":\"6\",\"nome\":\"verde\",\"ref\":\"esrew\"}', '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '{\"elemento\":{\"0\":\"2\",\"1\":\"Folhos\",\"2\":\"\",\"id\":\"2\",\"nome\":\"Folhos\",\"descricao\":\"\"},\"corElem\":{\"0\":\"3\",\"1\":\"Azul\",\"2\":\"#333\",\"id\":\"3\",\"nome\":\"Azul\",\"ref\":\"#333\"}}', '{\"elemento\":{\"0\":\"3\",\"1\":\"Meio pé\",\"2\":\"\",\"id\":\"3\",\"nome\":\"Meio pé\",\"descricao\":\"\"},\"corElem\":{\"0\":\"10\",\"1\":\"Cinza\",\"2\":\"dd\",\"id\":\"10\",\"nome\":\"Cinza\",\"ref\":\"dd\"}}', '{\"elemento\":{\"0\":\"4\",\"1\":\"Picueta\",\"2\":\"\",\"id\":\"4\",\"nome\":\"Picueta\",\"descricao\":\"\"},\"corElem\":{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}}', '{\"m00\":\"8\",\"m0\":\"8\",\"m1\":\"8\",\"m3\":\"9\",\"m6\":\"9\",\"m12\":\"5\",\"m24\":\"5\"}', '2018-02-02 13:42:41'),
(21, 33, 4, '{\"0\":\"4\",\"1\":\"Rosa\",\"2\":\"#4444\",\"id\":\"4\",\"nome\":\"Rosa\",\"ref\":\"#4444\"}', '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '{\"elemento\":{\"0\":\"4\",\"1\":\"Picueta\",\"2\":\"\",\"id\":\"4\",\"nome\":\"Picueta\",\"descricao\":\"\"},\"corElem\":{\"0\":\"3\",\"1\":\"Azul\",\"2\":\"#333\",\"id\":\"3\",\"nome\":\"Azul\",\"ref\":\"#333\"}}', '\"\"', '\"\"', '{\"00m\":\"6\",\"0m\":\"6\",\"1m\":\"6\",\"3m\":\"6\",\"m00\":\"5\",\"m0\":\"5\",\"m1\":\"5\",\"m3\":\"5\",\"m6\":\"5\",\"m9\":\"5\"}', '2018-01-30 23:27:04'),
(21, 33, 5, '{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}', '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '{\"elemento\":{\"0\":\"2\",\"1\":\"Folhos\",\"2\":\"\",\"id\":\"2\",\"nome\":\"Folhos\",\"descricao\":\"\"},\"corElem\":{\"0\":\"4\",\"1\":\"Rosa\",\"2\":\"#4444\",\"id\":\"4\",\"nome\":\"Rosa\",\"ref\":\"#4444\"}}', '\"\"', '\"\"', '{\"00m\":\"2\",\"0m\":\"3\",\"1m\":\"4\",\"3m\":\"5\",\"6m\":\"6\",\"m9\":\"5\",\"m12\":\"5\",\"m18\":\"5\"}', '2018-01-30 23:30:44'),
(21, 33, 6, '{\"0\":\"3\",\"1\":\"Azul\",\"2\":\"#333\",\"id\":\"3\",\"nome\":\"Azul\",\"ref\":\"#333\"}', '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '{\"elemento\":{\"0\":\"2\",\"1\":\"Folhos\",\"2\":\"\",\"id\":\"2\",\"nome\":\"Folhos\",\"descricao\":\"\"},\"corElem\":{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}}', '\"\"', '\"\"', '{\"00m\":\"77\",\"0m\":\"77\",\"1m\":\"77\",\"3m\":\"77\",\"m24\":\"5\",\"m36\":\"5\",\"m00\":\"5\",\"m0\":\"5\"}', '2018-01-30 23:53:14'),
(21, 34, 1, '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '\"\"', '\"\"', '\"\"', '\"\"', '{\"m00\":\"12\",\"m0\":\"12\",\"m3\":\"12\",\"m9\":\"12\"}', '2018-04-21 12:30:46'),
(21, 34, 2, '{\"0\":\"3\",\"1\":\"Azul\",\"2\":\"#333\",\"id\":\"3\",\"nome\":\"Azul\",\"ref\":\"#333\"}', '{\"0\":\"10\",\"1\":\"Cinza\",\"2\":\"dd\",\"id\":\"10\",\"nome\":\"Cinza\",\"ref\":\"dd\"}', '\"\"', '\"\"', '\"\"', '{\"m1\":\"12\",\"m6\":\"12\",\"m12\":\"12\",\"m18\":\"12\"}', '2018-04-21 12:31:01'),
(22, 35, 1, '{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}', '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '{\"elemento\":{\"0\":\"2\",\"1\":\"Folhos\",\"2\":\"\",\"id\":\"2\",\"nome\":\"Folhos\",\"descricao\":\"\"},\"corElem\":{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}}', '\"\"', '\"\"', 'null', '2018-02-01 13:44:25'),
(22, 35, 2, '{\"0\":\"4\",\"1\":\"Rosa\",\"2\":\"#4444\",\"id\":\"4\",\"nome\":\"Rosa\",\"ref\":\"#4444\"}', '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '{\"elemento\":{\"0\":\"3\",\"1\":\"Meio pé\",\"2\":\"\",\"id\":\"3\",\"nome\":\"Meio pé\",\"descricao\":\"\"},\"corElem\":{\"0\":\"3\",\"1\":\"Azul\",\"2\":\"#333\",\"id\":\"3\",\"nome\":\"Azul\",\"ref\":\"#333\"}}', '\"\"', '\"\"', 'null', '2018-02-01 13:52:42'),
(22, 35, 3, '{\"0\":\"3\",\"1\":\"Azul\",\"2\":\"#333\",\"id\":\"3\",\"nome\":\"Azul\",\"ref\":\"#333\"}', '{\"0\":\"6\",\"1\":\"verde\",\"2\":\"esrew\",\"id\":\"6\",\"nome\":\"verde\",\"ref\":\"esrew\"}', '{\"elemento\":{\"0\":\"1\",\"1\":\"Clorete\",\"2\":\"\",\"id\":\"1\",\"nome\":\"Clorete\",\"descricao\":\"\"},\"corElem\":{\"0\":\"6\",\"1\":\"verde\",\"2\":\"esrew\",\"id\":\"6\",\"nome\":\"verde\",\"ref\":\"esrew\"}}', '\"\"', '\"\"', 'null', '2018-02-01 13:55:39'),
(22, 35, 4, '{\"0\":\"6\",\"1\":\"verde\",\"2\":\"esrew\",\"id\":\"6\",\"nome\":\"verde\",\"ref\":\"esrew\"}', '{\"0\":\"10\",\"1\":\"Cinza\",\"2\":\"dd\",\"id\":\"10\",\"nome\":\"Cinza\",\"ref\":\"dd\"}', '{\"elemento\":{\"0\":\"2\",\"1\":\"Folhos\",\"2\":\"\",\"id\":\"2\",\"nome\":\"Folhos\",\"descricao\":\"\"},\"corElem\":{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}}', '\"\"', '\"\"', '{\"m00\":\"4\",\"m0\":\"5\",\"m1\":\"5\"}', '2018-02-01 14:01:51'),
(23, 36, 1, '{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}', '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '{\"elemento\":{\"0\":\"1\",\"1\":\"Clorete\",\"2\":\"\",\"id\":\"1\",\"nome\":\"Clorete\",\"descricao\":\"\"},\"corElem\":{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}}', '\"\"', '\"\"', '{\"m00\":\"22\",\"m0\":\"22\",\"m1\":\"22\",\"m3\":\"22\"}', '2018-01-30 23:59:23'),
(23, 36, 2, '{\"0\":\"3\",\"1\":\"Azul\",\"2\":\"#333\",\"id\":\"3\",\"nome\":\"Azul\",\"ref\":\"#333\"}', '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '{\"elemento\":{\"0\":\"2\",\"1\":\"Folhos\",\"2\":\"\",\"id\":\"2\",\"nome\":\"Folhos\",\"descricao\":\"\"},\"corElem\":{\"0\":\"6\",\"1\":\"verde\",\"2\":\"esrew\",\"id\":\"6\",\"nome\":\"verde\",\"ref\":\"esrew\"}}', '\"\"', '\"\"', '{\"m00\":\"33\",\"m0\":\"33\",\"m1\":\"33\",\"m3\":\"33\"}', '2018-01-31 00:01:44'),
(23, 36, 3, '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}', '{\"elemento\":{\"0\":\"2\",\"1\":\"Folhos\",\"2\":\"\",\"id\":\"2\",\"nome\":\"Folhos\",\"descricao\":\"\"},\"corElem\":{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}}', '\"\"', '\"\"', '{\"m00\":\"77\",\"m0\":\"77\",\"m1\":\"77\"}', '2018-01-31 00:03:33'),
(23, 36, 4, '{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}', '{\"0\":\"10\",\"1\":\"Cinza\",\"2\":\"dd\",\"id\":\"10\",\"nome\":\"Cinza\",\"ref\":\"dd\"}', '{\"elemento\":{\"0\":\"2\",\"1\":\"Folhos\",\"2\":\"\",\"id\":\"2\",\"nome\":\"Folhos\",\"descricao\":\"\"},\"corElem\":{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}}', '{\"elemento\":{\"0\":\"3\",\"1\":\"Meio pé\",\"2\":\"\",\"id\":\"3\",\"nome\":\"Meio pé\",\"descricao\":\"\"},\"corElem\":{\"0\":\"10\",\"1\":\"Cinza\",\"2\":\"dd\",\"id\":\"10\",\"nome\":\"Cinza\",\"ref\":\"dd\"}}', '\"\"', '{\"m00\":\"33\",\"m0\":\"33\",\"m1\":\"33\",\"m3\":\"33\",\"m6\":\"33\"}', '2018-01-31 00:04:41'),
(23, 36, 5, '{\"0\":\"10\",\"1\":\"Cinza\",\"2\":\"dd\",\"id\":\"10\",\"nome\":\"Cinza\",\"ref\":\"dd\"}', '', '{\"elemento\":{\"0\":\"2\",\"1\":\"Folhos\",\"2\":\"\",\"id\":\"2\",\"nome\":\"Folhos\",\"descricao\":\"\"},\"corElem\":{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}}', '{\"elemento\":{\"0\":\"3\",\"1\":\"Meio pé\",\"2\":\"\",\"id\":\"3\",\"nome\":\"Meio pé\",\"descricao\":\"\"},\"corElem\":{\"0\":\"6\",\"1\":\"verde\",\"2\":\"esrew\",\"id\":\"6\",\"nome\":\"verde\",\"ref\":\"esrew\"}}', '\"\"', '{\"m00\":\"33\",\"m1\":\"33\",\"m3\":\"33\",\"m6\":\"33\",\"m9\":\"44\"}', '2018-01-31 00:07:37'),
(23, 36, 6, '{\"0\":\"6\",\"1\":\"verde\",\"2\":\"esrew\",\"id\":\"6\",\"nome\":\"verde\",\"ref\":\"esrew\"}', '', '\"\"', '\"\"', '\"\"', '{\"m00\":\"3\",\"m1\":\"4\",\"m9\":\"5\",\"m24\":\"5\"}', '2018-01-31 00:30:35'),
(25, 39, 1, '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}', '{\"corElem\":{\"0\":\"10\",\"1\":\"Cinza\",\"2\":\"dd\",\"id\":\"10\",\"nome\":\"Cinza\",\"ref\":\"dd\"},\"elemento\":{\"0\":\"3\",\"1\":\"Meio pu00e9\",\"2\":\"\",\"id\":\"3\",\"nome\":\"Meio pu00e9\",\"descricao\":\"\"}}', '\"\"', '\"\"', '{\"m00\":\"10\",\"m1\":\"10\",\"m6\":\"10\",\"m18\":\"10\"}', '2018-03-22 19:04:13'),
(26, 41, 1, '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '\"\"', '{\"elemento\":{\"0\":\"1\",\"1\":\"Clorete\",\"2\":\"\",\"id\":\"1\",\"nome\":\"Clorete\",\"descricao\":\"\"},\"corElem\":{\"0\":\"3\",\"1\":\"Azul\",\"2\":\"#333\",\"id\":\"3\",\"nome\":\"Azul\",\"ref\":\"#333\"}}', '{\"elemento\":{\"0\":\"2\",\"1\":\"Folhos\",\"2\":\"\",\"id\":\"2\",\"nome\":\"Folhos\",\"descricao\":\"\"}}', '\"\"', '{\"m00\":\"5\",\"m3\":\"5\"}', '2018-04-27 23:54:50'),
(26, 41, 2, '{\"0\":\"3\",\"1\":\"Azul\",\"2\":\"#333\",\"id\":\"3\",\"nome\":\"Azul\",\"ref\":\"#333\"}', '\"\"', '{\"elemento\":{\"0\":\"2\",\"1\":\"Folhos\",\"2\":\"\",\"id\":\"2\",\"nome\":\"Folhos\",\"descricao\":\"\"},\"corElem\":{\"0\":\"10\",\"1\":\"Cinza\",\"2\":\"dd\",\"id\":\"10\",\"nome\":\"Cinza\",\"ref\":\"dd\"}}', '\"\"', '\"\"', '{\"m00\":\"15\"}', '2018-04-27 23:55:27'),
(26, 43, 1, '{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}', '{\"0\":\"4\",\"1\":\"Rosa\",\"2\":\"#4444\",\"id\":\"4\",\"nome\":\"Rosa\",\"ref\":\"#4444\"}', '\"\"', '\"\"', '\"\"', '{\"m00\":\"1\",\"m0\":\"1\",\"m1\":\"1\",\"m3\":\"1\",\"m6\":\"1\"}', '2018-04-27 23:58:36'),
(31, 55, 1, '{\"0\":\"2\",\"1\":\"Vermelho\",\"2\":\"rrre\",\"id\":\"2\",\"nome\":\"Vermelho\",\"ref\":\"rrre\"}', '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '\"\"', '\"\"', '\"\"', '{\"m00\":\"4\",\"m0\":\"4\",\"m1\":\"4\",\"m3\":\"4\",\"m6\":\"4\",\"m9\":\"4\",\"m12\":\"4\",\"m18\":\"4\"}', '2018-05-13 23:52:50'),
(31, 55, 2, '{\"0\":\"3\",\"1\":\"Azul\",\"2\":\"#333\",\"id\":\"3\",\"nome\":\"Azul\",\"ref\":\"#333\"}', '{\"0\":\"1\",\"1\":\"Branco\",\"2\":\"#43443\",\"id\":\"1\",\"nome\":\"Branco\",\"ref\":\"#43443\"}', '\"\"', '\"\"', '\"\"', '{\"m00\":\"10\",\"m0\":\"10\",\"m1\":\"10\",\"m3\":\"10\",\"m6\":\"10\",\"m9\":\"10\"}', '2018-05-13 23:53:26');

-- --------------------------------------------------------

--
-- Table structure for table `elemento`
--

CREATE TABLE `elemento` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `elemento`
--

INSERT INTO `elemento` (`id`, `nome`, `descricao`) VALUES
(1, 'Clorete', ''),
(2, 'Folhos', ''),
(3, 'Meio pé', ''),
(4, 'Picueta', ''),
(5, 'Fato', 'Parte principal do artigo');

-- --------------------------------------------------------

--
-- Table structure for table `embalagem`
--

CREATE TABLE `embalagem` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `embalagem`
--

INSERT INTO `embalagem` (`id`, `nome`, `descricao`) VALUES
(1, 'Caixa Pequena', 'Dobrar em quatro. Papel separador no meio'),
(2, 'Caixa Grande', 'Conjunto Babygrow e Manta.\nManta e por cima o babygrow'),
(3, 'Cabide', 'Pendurar por fora');

-- --------------------------------------------------------

--
-- Table structure for table `escala`
--

CREATE TABLE `escala` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `tamanhos` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `escala`
--

INSERT INTO `escala` (`id`, `nome`, `tamanhos`) VALUES
(1, 'Meses', 'm00,m0,m1,m3,m6,m9,m12,m18,m24,m36'),
(2, 'Anos', 'a2,a3,a4,a5,a6'),
(3, 'Tamanho Unico', 'TU');

-- --------------------------------------------------------

--
-- Table structure for table `modelo`
--

CREATE TABLE `modelo` (
  `id` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `refinterna` varchar(20) NOT NULL,
  `refcliente` varchar(20) DEFAULT NULL,
  `pedido` int(11) NOT NULL,
  `artigo` int(11) NOT NULL,
  `pasta` varchar(100) NOT NULL,
  `mainimg` varchar(100) NOT NULL,
  `imagens` varchar(1000) NOT NULL,
  `descricao` varchar(2000) NOT NULL,
  `obscliente` blob NOT NULL,
  `obsinternas` blob NOT NULL,
  `cores` varchar(500) NOT NULL,
  `escala` int(11) DEFAULT NULL,
  `preco` decimal(6,2) NOT NULL DEFAULT '0.00',
  `linkcorte` varchar(500) NOT NULL,
  `linksbordados` varchar(1000) NOT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modelo`
--

INSERT INTO `modelo` (`id`, `ano`, `refinterna`, `refcliente`, `pedido`, `artigo`, `pasta`, `mainimg`, `imagens`, `descricao`, `obscliente`, `obsinternas`, `cores`, `escala`, `preco`, `linkcorte`, `linksbordados`, `data`) VALUES
(17, 2018, '608-180011', NULL, 8, 1, 'modelos', 'babygrow1.jpg', '[\"baleia2.jpg\",\"baleia.jpg\"]', 'hffdhfdhx', 0x4c6f72656d497073756d3336302074616d62c3a96d206c68652064c3a1206120636170616369646164652064652061646963696f6e6172206d617263617320646520706f6e747561c3a7c3a36f2c206163656e746f7320652063617261637465726573206573706563696169732c2070617261206573746172206d61697320706572746f20646f73206964696f6d6173206672616e63c3aa73206f75206f75747261732e20416cc3a96d20646973736f2c20736520766f63c3aa2071756973657220766572206f7320726573756c7461646f7320656d206469666572656e746573207469706f73206465206c657472612c20766f63c3aa2076616920656e636f6e74726172206d7569746f73207265637572736f73207061726120646566696e697220636f6d6f20666f6e742d66616d696c792c20666f6e742d73697a652c20746578742d616c69676e206f75206c696e652d68656967682e, '', '', 1, '7.00', '', '', '2018-01-11 17:18:43'),
(18, 2018, '608-180012', NULL, 8, 1, 'modelos', 'babygrow2.jpg', '[\"header.PNG\",\"calikaLogo.PNG\"]', '45wegdbdrt', 0x6f627365727661c3a7c3b5657320646f20636c69656e74652070617261206f206d6f64656c6f2032, '', '', 1, '5.00', '', '', '2018-01-11 17:27:44'),
(20, 2018, 'vfsds180012', NULL, 9, 3, 'modelos', 'babygrow2.jpg', '[\"Barco.jpg\",\"f305a3c00f5faf3f4660c3055634e24a.jpg\"]', '43rewrswesrd', 0x7771727765, '', '', 1, '4.00', '', '', '2018-01-11 17:38:30'),
(25, 2018, 'vfsds180013', NULL, 9, 2, 'modelos', 'manta-polar-menino-stories.jpg', '[\"15291_04_00.jpg\",\"Barco.jpg\",\"f305a3c00f5faf3f4660c3055634e24a.jpg\"]', 'tdhrtdhreth  wetuwehgwe\nekjskfjlekf7ewokwefkwek', 0x67737267657267776572, '', '', 3, '5.99', '', '', '2018-01-13 18:11:00'),
(32, 2018, '608-180021', NULL, 11, 1, 'modelos', 'babygrow1.jpg', '[\"ursinho marinheiro-800x800.png\"]', '3wferfaew\nweqwe', 0x4c6f72656d497073756d33363020c2b02074616d62c3a96d206c68652064c3a1206120636170616369646164652064652061646963696f6e6172206d617263617320646520706f6e747561c3a7c3a36f2c206163656e746f7320652063617261637465726573206573706563696169732c200a70617261206573746172206d61697320706572746f20646f73206964696f6d6173206672616e63c3aa73206f75206f75747261732e20416cc3a96d20646973736f2c20736520766f63c3aa2071756973657220766572206f7320726573756c7461646f7320656d206469666572656e746573207469706f73206465206c657472612c20766f63c3aa200a76616920656e636f6e74726172206d7569746f73207265637572736f73207061726120646566696e697220636f6d6f20666f6e742d66616d696c792c20666f6e742d73697a652c20746578742d616c69676e206f75206c696e652d68656967682e, '', '', 1, '4.00', '', '', '2018-01-18 11:36:09'),
(33, 2018, '608-180022', NULL, 11, 3, 'modelos', 'babygrow2.jpg', '[\"urso_barco.jpg\",\"urso1.jpg\",\"detalhe.jpg\"]', 'ergwer', 0x4c6f72656d497073756d333630202074616d62c3a96d206c68652064c3a1206120636170616369646164652064652061646963696f6e6172206d617263617320646520706f6e747561c3a7c3a36f2c206163656e746f7320652063617261637465726573206573706563696169732c2070617261206573746172206d61697320706572746f20646f73206964696f6d6173206672616e63c3aa73206f75206f75747261732e20416cc3a96d20646973736f2c20736520766f63c3aa2071756973657220766572206f7320726573756c7461646f7320656d206469666572656e746573207469706f73206465206c657472612c20766f63c3aa2076616920656e636f6e74726172206d7569746f73207265637572736f73207061726120646566696e697220636f6d6f20666f6e742d66616d696c792c20666f6e742d73697a652c20746578742d616c69676e206f75206c696e652d68656967682e, '', '', 1, '3.00', '', '', '2018-01-18 11:37:38'),
(34, 2018, '608-180023', NULL, 11, 4, 'modelos', 'babygrow-favos-abertura-frente.jpg', '[\"Babygrow-Castor_pormenor1.jpg\",\"Babygrow-Castor_pormenor3.jpg\"]', 'erfqwefqw\nweweqwe', 0x4c6f72656d497073756d2074616d62c3a96d206c68652064c3a1206120636170616369646164652064652061646963696f6e6172206d617263617320646520706f6e747561c3a7c3a36f2c206163656e746f7320652063617261637465726573206573706563696169732c2070617261206573746172206d61697320706572746f20646f73206964696f6d6173206672616e63c3aa73206f75206f75747261732e20416cc3a96d20646973736f2c20736520766f63c3aa2071756973657220766572206f7320726573756c7461646f7320656d206469666572656e746573207469706f73206465206c657472612c20766f63c3aa2076616920656e636f6e74726172206d7569746f73207265637572736f73207061726120646566696e697220636f6d6f20666f6e742d66616d696c792c20666f6e742d73697a652c20746578742d616c69676e206f75206c696e652d68656967682e, '', '', 1, '4.00', '', '', '2018-01-18 11:46:21'),
(35, 2018, '608-180031', NULL, 12, 1, 'modelos', 'IMG_7286.jpg', '[\"santa-claus-1866616_640.png\",\"cartao-de-feliz-natal-e-ano-novo-c7f3aa.jpg\"]', 'keksfdlkkldf\njmelrlerle', 0x6d61697320756d6173200a6f627365727661c3a7c3b5657320646f200a636c69656e746520706172610a7465737465, '', '', 1, '6.00', '', '', '2018-01-24 22:51:05'),
(36, 2018, '608-180041', NULL, 13, 1, 'modelos', 'IMG_7286.jpg', '[\"santa-claus-1866616_640.png\"]', 'rbstwertwert\nysajfjajksfjkejasfk\nkaefjkwajefs\nwekalkfalsf fgdfgdfgdgfgfg', 0x7973616a666a616a6b73666a6b656a6173666b0a6b6165666a6b77616a6566730a77656b616c6b66616c7366206667646667646667646766676667, '', '', 1, '5.00', '', '', '2018-01-30 23:58:22'),
(38, 2018, 'z34180012', NULL, 10, 3, 'modelos', '72V-8008AC_1.jpg', '[\"Babygrow-Castor_pormenor1.jpg\",\"detalhe.jpg\"]', 'wqwewqee', 0x4d6f64656c6f2064652064756173207065c3a761732073656d207269736361732e200a5465737465, '', '', 1, '4.00', '', '', '2018-03-21 11:52:50'),
(39, 2018, 'z34180031', NULL, 15, 3, 'modelos', 'babygrow2.jpg', '', 'fghjkl', '', '', '', 1, '4.50', '', '', '2018-03-22 19:00:57'),
(40, 2018, 'vfsds180014', NULL, 9, 1, 'modelos', 'babygrow1.jpg', '', 'dsd', 0x65726765726765727467657274, '', '', 1, '2.00', '', '', '2018-04-04 22:36:44'),
(41, 2018, 'vfsds180021', NULL, 21, 1, 'modelos', 'babygrow1.jpg', '[\"15291_04_00.jpg\"]', 'dfxgfgcvftghv', 0x65727377736572676572, '', '', 1, '4.00', '', '', '2018-04-14 14:08:12'),
(43, 2018, 'vfsds180022', NULL, 21, 3, 'modelos', 'DSC_2224.JPG', '[]', 'sdfgrshdftg', 0x65726765727467, '', '', 1, '3.00', '', '', '2018-04-14 14:09:30'),
(44, 2018, 'vfsds180031', NULL, 22, 1, 'modelos', 'IMG_7286.jpg', '[\"flores.jpg\"]', 'Teste de novo formato', '', '', '', 1, '5.00', '', '', '2018-04-21 16:18:55'),
(45, 2018, 'vfsds180032', NULL, 22, 3, 'modelos', 'babygrow-favos-abertura-frente.jpg', '', 'teste sem preço nem escala', '', '', '', 0, '0.00', '', '', '2018-04-21 16:42:44'),
(46, 2018, 'vfsds180033', NULL, 22, 3, 'modelos', 'babygrow2.jpg', '', 'segundo teste sem preço nem escala', '', '', '', 0, '0.00', '', '', '2018-04-21 16:43:50'),
(50, 2018, 'vfsds180034', NULL, 22, 2, 'modelos', 'Babygrow-Castor_pormenor1.jpg', '[\"Babygrow-Castor_pormenor3.jpg\"]', '6 tent', '', '', '', 0, '0.00', '', '', '2018-04-21 16:57:36'),
(53, 2018, 'z34180041', NULL, 34, 1, 'modelos', 'babygrow1.jpg', '[]', 'tetsdhaskjdckasdcasd', '', '', '', 1, '0.00', '', '', '2018-05-01 19:07:14'),
(54, 2018, 'z34180042', NULL, 34, 4, 'modelos', 'babygrow-favos-abertura-frente.jpg', '[\"Babygrow-Castor_pormenor1.jpg\",\"Babygrow-Castor_pormenor3.jpg\",\"baleia.jpg\",\"baleia2.jpg\"]', 'uiyui90ipol+', '', '', '', 1, '0.00', '', '', '2018-05-01 19:11:01'),
(55, 2018, 'hh182131', NULL, 28, 1, 'modelos', 'babygrow2.jpg', '[]', '2223ffvdzf', 0x676666676e6e206766686e67682066666d0a646665727468200a6b2c686a6b0a6b6a68686b75757479, '', '', 1, '5.00', '', '', '2018-05-02 22:47:43'),
(56, 2018, 'hh182132', NULL, 28, 4, 'modelos', 'babygrow1.jpg', '[]', 'ASXD<SD', '', '', '', 0, '0.00', '', '', '2018-05-02 22:48:19'),
(57, 2018, 'vfsds180041', NULL, 27, 1, 'modelos', 'babygrow-favos-abertura-frente.jpg', '[]', 'eu e tu estamos a r aprender a escrever com cl caneta  mas a não e  .facil.teste pedro .muito bem está conoto _ cordoa ado. melhor amito cadax. ..dem-%o reta', '', '', '', 1, '0.00', '', '', '2018-05-05 00:18:19'),
(58, 2018, 'vfsds180042', NULL, 27, 2, 'modelos', 'manta-polar-menino-stories.jpg', '[]', 'ii conto. c imitirei gau', '', '', '', 3, '0.00', '', '', '2018-05-05 00:19:15'),
(59, 2018, '608-180051', NULL, 31, 1, 'modelos', 'babygrow2.jpg', '[]', 'dfsvdsdf', '', '', '', 1, '4.00', '', '', '2018-05-05 16:21:44'),
(60, 2018, '608-180081', NULL, 35, 3, 'modelos', 'babygrow2.jpg', '[]', 'fdgdfsdfsd', '', '', '', 1, '0.00', '', '', '2018-05-05 16:35:25'),
(61, 2018, '608-180082', NULL, 35, 1, 'modelos', 'babygrow1.jpg', '[]', 'erwesrgwe', '', '', '', 1, '0.00', '', '', '2018-05-05 16:35:38'),
(62, 2018, '608-180061', NULL, 32, 1, 'modelos', 'babygrow1.jpg', '[]', 'xdvsfv', '', '', '', 1, '5.00', '', '', '2018-05-05 16:43:18'),
(63, 2018, '608-180091', NULL, 37, 4, 'modelos', 'babygrow-favos-abertura-frente.jpg', '[\"Babygrow-Castor_pormenor1.jpg\"]', 'dasdcsd', '', '', '', 1, '3.00', '', '', '2018-05-13 23:29:00'),
(64, 2018, '608-180092', NULL, 36, 2, 'modelos', 'manta1.jpg', '[]', 'avz xvsdz', '', '', '', 3, '3.00', '', '', '2018-05-13 23:37:04'),
(69, 2018, '373', NULL, 37, 1, 'modelos', 'babygrow1.jpg', '', 'fbfgb', '', '', '', 1, '0.00', '', '', '2018-08-02 23:28:04'),
(73, 2018, '608-201893', NULL, 37, 1, 'modelos', 'babygrow1.jpg', '', 'gsdg', '', '', '', 1, '4.00', '', '', '2018-08-06 00:50:19'),
(74, 2018, '608-201894', NULL, 37, 3, 'modelos', 'babygrow2.jpg', '[\"b250-bordados-computadorizados-coleco-carrinhos-na-estrada-D_NQ_NP_20454-MLB20190629749_112014-O.jpg\"]', 'fdfbdf', '', '', '', 1, '5.00', '', '', '2018-08-06 00:55:14');

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `clienteId` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `refInterna` varchar(20) NOT NULL,
  `refCliente` varchar(50) DEFAULT NULL,
  `tema` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `folder` varchar(50) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `dataPedido` datetime NOT NULL,
  `situacao` int(11) NOT NULL,
  `dataSituacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pedido`
--

INSERT INTO `pedido` (`id`, `clienteId`, `ano`, `refInterna`, `refCliente`, `tema`, `descricao`, `folder`, `imagem`, `dataPedido`, `situacao`, `dataSituacao`) VALUES
(18, 7, 2018, '1', '', 'Baleia', 'dfsklkfdfd', 'temas', 'baleia.jpg', '2018-01-11 17:18:16', 2, '2018-01-11 17:18:16'),
(19, 8, 2018, '1', '', 'Barco', 'sdfsdf', 'temas', '15291_04_00.jpg', '2018-01-11 17:20:55', 5, '2018-01-11 17:20:55'),
(20, 9, 2018, '1', '', 'Urso', 'daaerfaes', 'temas', 'urso1.jpg', '2018-01-11 17:45:25', 5, '2018-01-11 17:45:25'),
(21, 7, 2018, '2', '', 'Urso', 'ursos', 'temas', 'urso1.jpg', '2018-01-18 10:50:00', 3, '2018-01-18 10:50:00'),
(22, 7, 2018, '3', '', 'Natal', 'tewagwas\ndshsoksd', 'temas', 'cartao-de-feliz-natal-e-ano-novo-c7f3aa.jpg', '2018-01-24 22:37:26', 3, '2018-01-24 22:37:26'),
(23, 7, 2018, '4', '', 'Pai Natal', 'gdfberter', 'temas', 'Emblemas-Living-Natal-Cabeça-Pai-Natal.jpg', '2018-01-30 23:58:02', 5, '2018-01-30 23:58:02'),
(25, 9, 2018, '3', '', 'baleia', 'tema em algodao appaoaoaooaoa', 'temas', 'baleia.jpg', '2018-03-22 18:59:15', 3, '2018-03-22 18:59:15'),
(26, 8, 2018, '2', '', 'Amarela', '', 'temas', '15291_04_00.jpg', '2018-04-14 14:07:33', 3, '2018-04-14 14:07:33'),
(27, 8, 2018, '3', '', 'Flores', '', 'temas', 'flores.jpg', '2018-04-21 16:17:29', 3, '2018-04-21 16:17:29'),
(28, 10, 2018, '212', '', 'Comboio', '', 'temas', 'b250-bordados-computadorizados-coleco-carrinhos-na-estrada-D_NQ_NP_20454-MLB20190629749_112014-O.jpg', '2018-04-28 08:45:20', 2, '2018-04-28 08:45:20'),
(30, 8, 2018, '4', '', 'Pirata', '', 'temas', '15291_04_00.jpg', '2018-04-28 11:41:35', 5, '2018-04-28 11:41:35'),
(31, 10, 2018, '213', '', 'Pirata', '', 'temas', '15291_04_00.jpg', '2018-04-28 11:41:57', 5, '2018-04-28 11:41:57'),
(32, 7, 2018, '5', '', 'bebé', '', 'temas', 'babygrow1.jpg', '2018-05-01 16:52:12', 2, '2018-05-01 16:52:12'),
(33, 7, 2018, '6', '', 'Pirata', '', 'temas', '15291_04_00.jpg', '2018-05-01 16:52:58', 5, '2018-05-01 16:52:58'),
(35, 9, 2018, '4', '', 'Vela', '', 'temas', 'f305a3c00f5faf3f4660c3055634e24a.jpg', '2018-05-01 17:30:16', 2, '2018-05-01 17:30:16'),
(36, 7, 2018, '8', '', 'Comboinho', '', 'temas', 'b250-bordados-computadorizados-coleco-carrinhos-na-estrada-D_NQ_NP_20454-MLB20190629749_112014-O.jpg', '2018-05-05 16:34:58', 2, '2018-05-05 16:34:58'),
(37, 7, 2018, '9', '', 'barquinho', '', 'temas', 'images.jpg', '2018-05-13 23:27:58', 1, '2018-05-13 23:27:58'),
(38, 7, 2018, '10', '', 'test', NULL, 'temas', 'Screenshot_3.jpg', '2018-08-05 21:57:14', 1, '2018-08-05 21:57:14'),
(39, 7, 2018, '11', '', 'teste2', NULL, 'temas', 't shirt costas.jpg', '2018-08-05 22:08:33', 1, '2018-08-05 22:08:33'),
(40, 7, 2018, '12', '', 'teste3', NULL, 'temas', 'fifas.jpg', '2018-08-05 22:09:55', 1, '2018-08-05 22:09:55'),
(41, 7, 2018, '13', NULL, 'teste3', NULL, 'temas', 'fifas.jpg', '2018-08-05 22:11:35', 1, '2018-08-05 22:11:35'),
(42, 7, 2018, '14', '', 'teste3', NULL, 'temas', 'fifas.jpg', '2018-08-05 22:12:15', 1, '2018-08-05 22:12:15'),
(43, 7, 2018, '15', '', 'teste3', NULL, 'temas', 'fifas.jpg', '2018-08-05 22:12:44', 1, '2018-08-05 22:12:44'),
(44, 7, 2018, '16', '', 'Baleia Azul', NULL, 'temas', 'baleia.jpg', '2018-08-05 22:28:39', 1, '2018-08-05 22:28:39'),
(45, 7, 2018, '17', '', 'Baleia Azul', NULL, 'temas', 'baleia.jpg', '2018-08-05 22:29:01', 1, '2018-08-05 22:29:01'),
(46, 7, 2018, '18', '', 'Baleia Azul2', NULL, 'temas', 'baleia.jpg', '2018-08-05 22:30:30', 1, '2018-08-05 22:30:30'),
(47, 7, 2018, '19', 'my32423', 'Comboio', NULL, 'temas', 'b250-bordados-computadorizados-coleco-carrinhos-na-estrada-D_NQ_NP_20454-MLB20190629749_112014-O.jpg', '2018-08-05 23:51:34', 1, '2018-08-05 23:51:34'),
(48, 7, 2018, '20', 'may42434', 'Comboio', NULL, 'temas', 'b250-bordados-computadorizados-coleco-carrinhos-na-estrada-D_NQ_NP_20454-MLB20190629749_112014-O.jpg', '2018-08-05 23:59:52', 1, '2018-08-05 23:59:52');

-- --------------------------------------------------------

--
-- Table structure for table `qtycor`
--

CREATE TABLE `qtycor` (
  `id` int(11) NOT NULL,
  `refModelo` varchar(20) NOT NULL,
  `cor` int(11) NOT NULL,
  `tamanho` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qtycor`
--

INSERT INTO `qtycor` (`id`, `refModelo`, `cor`, `tamanho`, `qty`) VALUES
(1, 'asdf', 2, 0, 5),
(1, 'asdf', 2, 1, 5),
(1, 'bre3', 1, 0, 4),
(1, 'bre3', 1, 1, 5),
(1, 'bre3', 1, 2, 5),
(1, 'bre3', 1, 3, 5),
(1, 'bre3', 1, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `situacao`
--

CREATE TABLE `situacao` (
  `id` int(11) NOT NULL,
  `situacao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `situacao`
--

INSERT INTO `situacao` (`id`, `situacao`) VALUES
(1, 'Aberto'),
(2, 'Para Aprovação'),
(3, 'Aprovada'),
(4, 'Alterações'),
(5, 'Produção'),
(6, 'Concluida'),
(7, 'Eliminado');

-- --------------------------------------------------------

--
-- Table structure for table `tamanho`
--

CREATE TABLE `tamanho` (
  `escala` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `valor` varchar(6) NOT NULL,
  `unidade` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tamanho`
--

INSERT INTO `tamanho` (`escala`, `id`, `valor`, `unidade`) VALUES
(2, 0, '0', 'M'),
(2, 1, '2', 'M'),
(2, 2, '4', 'M'),
(2, 3, '6', 'M'),
(6, 0, '0', 'M'),
(6, 1, '2', 'M'),
(6, 2, '4', 'M'),
(6, 3, '6', 'M'),
(6, 4, '9', 'M'),
(6, 5, '12', 'M'),
(7, 0, '00', 'M'),
(7, 1, '0', 'M'),
(7, 2, '3', 'M'),
(7, 3, '6', 'M'),
(7, 4, '9', 'M'),
(7, 5, '12', 'M'),
(7, 6, '18', 'M'),
(7, 7, '24', 'M'),
(8, 0, '100', 'cm'),
(9, 0, '00', 'M'),
(9, 1, '0', 'M'),
(9, 2, '3', 'M'),
(9, 3, '6', 'M'),
(9, 4, '9', 'M'),
(9, 5, '12', 'M'),
(9, 6, '18', 'M'),
(9, 7, '24', 'M'),
(9, 8, '36', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nome`, `username`, `password`) VALUES
(1, 'Pedro', 'teste', 'pass');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artigo`
--
ALTER TABLE `artigo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `code` (`codigo`);

--
-- Indexes for table `cor`
--
ALTER TABLE `cor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detalhepedido`
--
ALTER TABLE `detalhepedido`
  ADD PRIMARY KEY (`pedido`,`linha`);

--
-- Indexes for table `detpedcor`
--
ALTER TABLE `detpedcor`
  ADD PRIMARY KEY (`pedido`,`modelo`,`linha`,`cor1`),
  ADD KEY `modelo` (`modelo`);

--
-- Indexes for table `elemento`
--
ALTER TABLE `elemento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Indexes for table `embalagem`
--
ALTER TABLE `embalagem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `escala`
--
ALTER TABLE `escala`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Indexes for table `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `refinterna` (`refinterna`),
  ADD UNIQUE KEY `refcliente` (`refcliente`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `refInterna_4` (`refInterna`);

--
-- Indexes for table `qtycor`
--
ALTER TABLE `qtycor`
  ADD PRIMARY KEY (`id`,`refModelo`,`cor`,`tamanho`);

--
-- Indexes for table `situacao`
--
ALTER TABLE `situacao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tamanho`
--
ALTER TABLE `tamanho`
  ADD PRIMARY KEY (`escala`,`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artigo`
--
ALTER TABLE `artigo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cor`
--
ALTER TABLE `cor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `elemento`
--
ALTER TABLE `elemento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `embalagem`
--
ALTER TABLE `embalagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `escala`
--
ALTER TABLE `escala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `situacao`
--
ALTER TABLE `situacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detpedcor`
--
ALTER TABLE `detpedcor`
  ADD CONSTRAINT `detpedcor_ibfk_1` FOREIGN KEY (`modelo`) REFERENCES `modelo` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `detpedcor_ibfk_2` FOREIGN KEY (`pedido`) REFERENCES `detalhepedido` (`pedido`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
