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
  `cpf` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id`, `cpf`, `nome`, `data_nascimento`, `telefone`, `email`, `ativo`) VALUES
	(16, '139.104.129-18', 'Kevin Caleb Vicente Araújo', '1996-04-15', '(11) 9809-4052', 'user1@uol.com', b'1'),
	(18, '970.168.604-77', 'Guilherme Davi da Costa', '1996-10-13', '(47) 2814-6313', '', b'1'),
	(19, '006.053.111-88', 'Murilo Fábio Fernando Pinto', '1996-11-15', '', '', b'1');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_integrador.filial
CREATE TABLE IF NOT EXISTS `filial` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `numero` int(10) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `ativo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.filial: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `filial` DISABLE KEYS */;
INSERT INTO `filial` (`id`, `nome`, `endereco`, `numero`, `cidade`, `estado`, `ativo`) VALUES
	(1, 'PerfmumeShop - Iguatemi', 'Avenida Faria Lima', 2465, 'São Paulo', 'SP', b'1'),
	(3, 'PerfumeShop - Morumbi', 'Avenida Morumbi', 666, 'São Paulo', 'SP', b'1');
/*!40000 ALTER TABLE `filial` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_integrador.item_venda
CREATE TABLE IF NOT EXISTS `item_venda` (
  `id_item_venda` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `preco` double DEFAULT NULL,
  PRIMARY KEY (`id_item_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.item_venda: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `item_venda` DISABLE KEYS */;
INSERT INTO `item_venda` (`id_item_venda`, `id_produto`, `quantidade`, `id_venda`, `preco`) VALUES
	(21, 30, 1, 24, 299),
	(22, 31, 1, 24, 299),
	(23, 32, 1, 25, 252),
	(24, 33, 1, 25, 139),
	(25, 34, 1, 26, 279),
	(26, 31, 1, 27, 299),
	(27, 30, 1, 27, 299),
	(28, 33, 1, 27, 139);
/*!40000 ALTER TABLE `item_venda` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_integrador.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `preco` double NOT NULL,
  `quantidade` int(11) NOT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `descricao` longtext,
  `ativo` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_produto_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.produto: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`id`, `nome`, `marca`, `preco`, `quantidade`, `categoria`, `descricao`, `ativo`) VALUES
	(30, 'Perfume Lancôme La Vie', 'Lancôme', 299, 98, 'Perfume', 'Um resplandecente sorriso, inspirado na nobreza rara da Íris Gourmand (a flor da felicidade) revela uma fragrância envolvente e sofisticada para uma mulher livre e realizada.\r\n\r\nLa Vie Est Belle, francês para \\"a vida é bela\\", representa uma escolha: a escolha para criar o seu próprio caminho para a felicidade. Feito com os ingredientes naturais mais preciosos, a fragrância entrelaça a elegância da íris com a força da Patchouli e a doçura do Pralinê. Notas florais de íris, jasmim e flor de laranjeira tunisina são adicionados na forma de absolutos sublimes.\r\n\r\nLa Vie Est Belle é a fragrância da feminilidade alegre que torna a vida mais bonita. É para a mulher que vive no presente, que é preenchida com honestidade, verdade e gratidão, e que está livre para enaltecer o seu próprio caminho único.\r\n\r\nNotas: Íris e Patchouli.\r\nEstilo: Livre e Feliz.\r\n', b'1'),
	(31, 'Perfume Carolina Herrera', 'Carolina Herrera', 299, 48, 'Perfume', 'A Fragrância:\r\nPor um lado, ela é Boa, por outro, é Má.\r\nA fragrância Good Girl foi inspirada pela visão única de Carolina Herrera sobre a mulher moderna: audaciosa, sexy, elegante e enigmática. Sempre atravessando os limites.', b'1'),
	(32, 'CK One', 'Calvin Klein', 252, 99, 'Perfume', 'Cítrica e refrescante, esta fragrância abre com uma combinação vívida e efervescente de bergamota, cardamomo, tangerina, freesia e lavanda.', b'1'),
	(33, 'Azzaro Pour Homme', 'Azzaro', 139, 98, 'Perfume', 'Azzaro Pour Homme é um coquetel exclusivo de humor, vitalidade, modernidade e elegância masculina, espelhado em seu criador Loris Azzaro.', b'1'),
	(34, 'Lady Million', 'Paco Rabanne', 279, 99, 'Perfume', 'Uma aventura apaixonante iniciada com o perfume 1 Million, desse dandy sedutor. Agora, o seu alter ego avança em direção a ele. Uma jovem mulher envolvente, radiosa, de fragilidade aparente, mas possuidora de um caráter incrivelmente sensual e fogoso. Em conformidade com a sua fragrância e com o diamante, esta Lady Million possui múltiplas facetas. Uma nota de cabeça floral e fresca, à qual sucede, numa alquimia misteriosa, um corpo encantador, poderoso e amadeirado.\r\n', b'1'),
	(35, 'Moschina I Love', 'Moschino', 139, 100, 'Perfume', 'I Love Love é luxuoso e divertido: o último presente de Moschino para a mulher apaixonada, cheia de vida, diferente e divertida. I Love Love é tão jovem quanto os sentimentos que o inspiraram.', b'1');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela projeto_integrador.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `ativo` bit(1) NOT NULL,
  `perfil` varchar(255) DEFAULT 'caixa',
  `filial_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.usuarios: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `user`, `pass`, `ativo`, `perfil`, `filial_id`) VALUES
	(73, 'Silvio Santos', '666', 'admin', 'admin', b'1', 'gerente', 3),
	(75, 'Luke Valentine', '4523145', 'caixa', 'caixa', b'1', 'caixa', 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela projeto_integrador.venda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` (`id_venda`, `data_venda`, `id_cliente`, `id_vendedor`, `id_filial`) VALUES
	(24, '2018-05-31', 16, 73, 3),
	(25, '2018-05-31', 18, 73, 3),
	(26, '2018-05-31', 18, 73, 3),
	(27, '2018-05-31', 19, 75, 1);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
