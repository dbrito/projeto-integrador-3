-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.31-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para projeto_integrador
CREATE DATABASE IF NOT EXISTS `projeto_integrador` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `projeto_integrador`;

-- Copiando estrutura para tabela projeto_integrador.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(45) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.cliente: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id`, `cpf`, `nome`, `data_nascimento`, `telefone`, `email`, `ativo`) VALUES
	(4, '616.959.819-01', 'Steve Stifler', '1990-01-01', '', '', b'0'),
	(5, '111.131.934-09', 'Paul Finch ', '1991-02-02', '', '', b'0'),
	(6, '151.162.615-14', 'Fogell Mclovin', '1993-04-04', '', '', b'0'),
	(7, '0175290458', 'Douglas dos Santos', '1993-08-27', '(11) 98094-0524', 'doug.dbrito@gmail.com', b'1'),
	(9, '105754', 'Martin Luther King', '1970-08-08', '(11) 98094-0524', 'asdadad@gmail', b'1');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_integrador.filial
CREATE TABLE IF NOT EXISTS `filial` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `endereco` varchar(20) NOT NULL,
  `numero` int(10) NOT NULL,
  `cidade` varchar(20) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.filial: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `filial` DISABLE KEYS */;
INSERT INTO `filial` (`id`, `nome`, `endereco`, `numero`, `cidade`, `estado`, `ativo`) VALUES
	(1, 'Fast - Iguatemi', 'Avenida Faria Lima', 2466, 'São Paulo', 'SP', b'1'),
	(2, 'teste', 'teste', 666, 'Salvador', 'BA', b'1');
/*!40000 ALTER TABLE `filial` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_integrador.item_venda
CREATE TABLE IF NOT EXISTS `item_venda` (
  `id_item_venda` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  PRIMARY KEY (`id_item_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.item_venda: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
INSERT INTO `item_venda` (`id_item_venda`, `id_produto`, `quantidade`, `id_venda`) VALUES
	(11, 24, 1, 16),
	(12, 25, 3, 16);
/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_integrador.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `preco` double NOT NULL,
  `quantidade` int(11) NOT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `descricao` longtext,
  `ativo` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_produto_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.produto: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`id`, `nome`, `marca`, `preco`, `quantidade`, `categoria`, `descricao`, `ativo`) VALUES
	(23, 'Inspiron 14 6000', 'Dell', 2459, 40, 'Perfume', 'Execute melhor suas tarefas em um notebook ultraportátil de 14" cheio de estilo. Repleto de potencial. Assim como você.', b'0'),
	(24, 'Galaxy J7 Prime', 'Samsung', 800, 29, 'Perfume', 'Produto de excelente qualidade', b'1'),
	(25, 'JBL GO 3W', 'JBL', 150, 57, 'Caixas de Som', '', b'0'),
	(26, 'teste', 'teste', 50, 50, 'Perfume', 'asdadsasd', b'1'),
	(27, 'teste ', 'marca teste', 500, 100, 'Perfume', 'asdas a sdas ', b'1');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_integrador.venda
CREATE TABLE IF NOT EXISTS `venda` (
  `id_venda` int(11) NOT NULL AUTO_INCREMENT,
  `data_venda` date NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venda`),
  UNIQUE KEY `id_venda_UNIQUE` (`id_venda`),
  KEY `fk_cliente_idx` (`id_cliente`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.venda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` (`id_venda`, `data_venda`, `id_cliente`) VALUES
	(16, '2017-12-09', 5);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
