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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.cliente: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id`, `cpf`, `nome`, `data_nascimento`, `telefone`, `email`, `ativo`) VALUES
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.filial: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `filial` DISABLE KEYS */;
INSERT INTO `filial` (`id`, `nome`, `endereco`, `numero`, `cidade`, `estado`, `ativo`) VALUES
	(1, 'Fast - Iguatemi', 'Avenida Faria Lima', 2466, 'São Paulo', 'SP', b'1'),
	(3, 'Fast - Morumbi', 'Avenida Morumbi', 666, 'São Paulo', 'SP', b'1');
/*!40000 ALTER TABLE `filial` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_integrador.item_venda
CREATE TABLE IF NOT EXISTS `item_venda` (
  `id_item_venda` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `preco` double DEFAULT NULL,
  PRIMARY KEY (`id_item_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.item_venda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
INSERT INTO `item_venda` (`id_item_venda`, `id_produto`, `quantidade`, `id_venda`, `preco`) VALUES
	(17, 27, 2, 21, 1000);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.produto: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`id`, `nome`, `marca`, `preco`, `quantidade`, `categoria`, `descricao`, `ativo`) VALUES
	(23, 'Inspiron 14 6000', 'Dell', 2459, 40, 'Perfume', 'Execute melhor suas tarefas em um notebook ultraportátil de 14" cheio de estilo. Repleto de potencial. Assim como você.', b'0'),
	(24, 'Galaxy J7 Prime', 'Samsung', 800, 27, 'Perfume', 'Produto de excelente qualidade', b'1'),
	(25, 'JBL GO 3W', 'JBL', 150, 57, 'Caixas de Som', '', b'0'),
	(26, 'teste', 'teste', 50, 42, 'Perfume', 'asdadsasd', b'0'),
	(27, 'teste  4', 'marca teste', 500, 98, 'Perfume', 'asdas a sdas ', b'1'),
	(28, 'teste 3', 'asdasd', 44, 55, 'Perfume', 'adasdasd', b'1');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_integrador.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `ativo` bit(1) NOT NULL,
  `perfil` varchar(50) DEFAULT 'caixa',
  `filial_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.usuarios: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `user`, `pass`, `ativo`, `perfil`, `filial_id`) VALUES
	(73, 'Silvio Santos', '666', 'admin', 'admin', b'1', 'gerente', 3),
	(74, 'Eliana', '888', 'eli', 'eli', b'0', 'estoquista', 1),
	(75, 'teste', '4523145', 'teste', 'teste', b'1', 'caixa', 1),
	(76, 'Champs', '45612154', 'estoq', 'estoq', b'1', 'estoquista', 1),
	(77, 'Skiners Jr', '789', 'skiners', 'skiners', b'1', 'estoquista', 3);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_integrador.venda
CREATE TABLE IF NOT EXISTS `venda` (
  `id_venda` int(11) NOT NULL AUTO_INCREMENT,
  `data_venda` date NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_vendedor` int(11) DEFAULT NULL,
  `id_filial` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venda`),
  UNIQUE KEY `id_venda_UNIQUE` (`id_venda`),
  KEY `fk_cliente_idx` (`id_cliente`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.venda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` (`id_venda`, `data_venda`, `id_cliente`, `id_vendedor`, `id_filial`) VALUES
	(21, '2018-05-16', 7, 73, 3);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
