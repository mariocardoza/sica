/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : sica

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-07-03 08:21:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for alimentos
-- ----------------------------
DROP TABLE IF EXISTS `alimentos`;
CREATE TABLE `alimentos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `unidadmedida_id` bigint(20) unsigned DEFAULT NULL,
  `fecha_recibido` date DEFAULT NULL,
  `estado` int(11) DEFAULT '1',
  `bodega_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of alimentos
-- ----------------------------
INSERT INTO `alimentos` VALUES ('2', 'Frijoles', '1', '2021-06-28', '1', '2');
INSERT INTO `alimentos` VALUES ('3', 'Arroz', '1', '2021-06-28', '1', '1');
INSERT INTO `alimentos` VALUES ('4', 'Leche', '2', '2021-06-28', '1', '1');
INSERT INTO `alimentos` VALUES ('5', 'Aceite Vegetal', '2', '2021-06-28', '1', '1');

-- ----------------------------
-- Table structure for bodegas
-- ----------------------------
DROP TABLE IF EXISTS `bodegas`;
CREATE TABLE `bodegas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `estado` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bodegas
-- ----------------------------
INSERT INTO `bodegas` VALUES ('1', 'Bodega central 2', '1');
INSERT INTO `bodegas` VALUES ('2', 'Bodega secundaria', '1');

-- ----------------------------
-- Table structure for estadoinscrip
-- ----------------------------
DROP TABLE IF EXISTS `estadoinscrip`;
CREATE TABLE `estadoinscrip` (
  `id_estadoinscrip` int(11) NOT NULL AUTO_INCREMENT,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id_estadoinscrip`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of estadoinscrip
-- ----------------------------
INSERT INTO `estadoinscrip` VALUES ('1', '1');

-- ----------------------------
-- Table structure for ingredientes
-- ----------------------------
DROP TABLE IF EXISTS `ingredientes`;
CREATE TABLE `ingredientes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `alimento_id` bigint(20) unsigned DEFAULT NULL,
  `receta_id` bigint(20) unsigned DEFAULT NULL,
  `cantidad` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ingredientes
-- ----------------------------
INSERT INTO `ingredientes` VALUES ('1', '2', '1', '1.20');
INSERT INTO `ingredientes` VALUES ('2', '3', '1', '1.30');

-- ----------------------------
-- Table structure for inventarios
-- ----------------------------
DROP TABLE IF EXISTS `inventarios`;
CREATE TABLE `inventarios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `alimento_id` bigint(20) unsigned DEFAULT NULL,
  `cantidad` double(8,2) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of inventarios
-- ----------------------------
INSERT INTO `inventarios` VALUES ('1', '2', '50.00', '1', '2021-06-28 00:00:00', '50.00');
INSERT INTO `inventarios` VALUES ('2', '2', '10.00', '1', '2021-06-28 00:00:00', '60.00');
INSERT INTO `inventarios` VALUES ('3', '3', '40.00', '1', '2021-06-28 00:00:00', '40.00');
INSERT INTO `inventarios` VALUES ('4', '3', '5.00', '1', '2021-06-28 00:00:00', '45.00');
INSERT INTO `inventarios` VALUES ('5', '2', '1.20', '2', '2021-06-28 00:00:00', '58.80');
INSERT INTO `inventarios` VALUES ('6', '3', '1.30', '2', '2021-06-28 00:00:00', '43.70');
INSERT INTO `inventarios` VALUES ('7', '2', '1.20', '2', '2021-06-28 00:00:00', '57.60');
INSERT INTO `inventarios` VALUES ('8', '3', '1.30', '2', '2021-06-28 00:00:00', '42.40');
INSERT INTO `inventarios` VALUES ('9', '2', '1.20', '2', '2021-06-28 00:00:00', '56.40');
INSERT INTO `inventarios` VALUES ('10', '3', '1.30', '2', '2021-06-28 00:00:00', '41.10');
INSERT INTO `inventarios` VALUES ('11', '2', '1.20', '2', '2021-06-28 00:00:00', '55.20');
INSERT INTO `inventarios` VALUES ('12', '3', '1.30', '2', '2021-06-28 00:00:00', '39.80');
INSERT INTO `inventarios` VALUES ('13', '2', '1.20', '2', '2021-06-28 00:00:00', '54.00');
INSERT INTO `inventarios` VALUES ('14', '3', '1.30', '2', '2021-06-28 00:00:00', '38.50');
INSERT INTO `inventarios` VALUES ('15', '2', '10.00', '1', '2021-06-28 00:00:00', '64.00');
INSERT INTO `inventarios` VALUES ('16', '2', '1.20', '2', '2021-06-28 05:15:25', '62.80');
INSERT INTO `inventarios` VALUES ('17', '3', '1.30', '2', '2021-06-28 05:15:25', '37.20');
INSERT INTO `inventarios` VALUES ('18', '4', '20.00', '1', '2021-06-28 05:17:01', '20.00');
INSERT INTO `inventarios` VALUES ('19', '5', '20.00', '1', '2021-06-28 05:33:50', '20.00');
INSERT INTO `inventarios` VALUES ('20', '2', '25.30', '1', '2021-06-28 05:48:06', '88.10');

-- ----------------------------
-- Table structure for recetas
-- ----------------------------
DROP TABLE IF EXISTS `recetas`;
CREATE TABLE `recetas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `estado` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recetas
-- ----------------------------
INSERT INTO `recetas` VALUES ('1', 'Casamiento', '1');
INSERT INTO `recetas` VALUES ('2', 'Arroz blanco', '1');

-- ----------------------------
-- Table structure for talumno
-- ----------------------------
DROP TABLE IF EXISTS `talumno`;
CREATE TABLE `talumno` (
  `eid_alumno` int(11) NOT NULL AUTO_INCREMENT,
  `ccodigo` varchar(6) NOT NULL,
  `cnie` varchar(15) NOT NULL,
  `cnombre` varchar(100) NOT NULL,
  `capellido` varchar(50) NOT NULL,
  `sexo` int(4) NOT NULL,
  `cdireccion` varchar(200) NOT NULL,
  `edepto` varchar(50) NOT NULL,
  `ffecha_nac` date NOT NULL,
  `cllegada` varchar(50) NOT NULL,
  `cbachillerato` int(11) NOT NULL,
  `canterior` varchar(100) NOT NULL,
  `cenfermedades` varchar(100) NOT NULL,
  `calergia` varchar(100) NOT NULL,
  `cdistancia` varchar(50) NOT NULL,
  `iparvularia` int(11) NOT NULL COMMENT '1=si 0=no',
  `itrabaja` int(11) NOT NULL COMMENT '1=si 0=no',
  `izona` int(11) NOT NULL COMMENT '1=si 0=no',
  `irepite` int(11) NOT NULL COMMENT '1=si 0=no',
  `ibautizo` int(11) NOT NULL,
  `icomunion` int(11) NOT NULL,
  `iconfirma` int(11) NOT NULL,
  `cnombrep` varchar(50) NOT NULL,
  `clugar_trabajop` varchar(100) NOT NULL,
  `cduip` varchar(10) NOT NULL,
  `ctelefonocp` varchar(8) NOT NULL,
  `ctelefonotp` varchar(8) NOT NULL,
  `ccelularp` varchar(8) NOT NULL,
  `cdireccionp` varchar(200) NOT NULL,
  `cestadocivilp` varchar(50) NOT NULL,
  `cconvive` varchar(50) NOT NULL,
  `cnombrem` varchar(50) NOT NULL,
  `clugar_trabajom` varchar(50) NOT NULL,
  `cprofesionm` varchar(50) NOT NULL,
  `cduim` varchar(10) NOT NULL,
  `ctelefonocm` varchar(8) NOT NULL,
  `ctelefonotm` varchar(8) NOT NULL,
  `ccelularm` varchar(8) NOT NULL,
  `cmiembros` int(11) NOT NULL,
  `creligion` int(11) NOT NULL COMMENT '1=catolico 0=otro',
  `anio` int(11) NOT NULL,
  PRIMARY KEY (`eid_alumno`),
  KEY `fk_opcion` (`cbachillerato`) USING BTREE,
  CONSTRAINT `fkop` FOREIGN KEY (`cbachillerato`) REFERENCES `topciones` (`eid_opcion`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of talumno
-- ----------------------------
INSERT INTO `talumno` VALUES ('1', '0001', '7283478', 'Marcos Aurelio', 'Martinez Olivar', '0', 'Colonia la esperanza #23 San Vicente', 'San', '1999-04-03', 'A', '1', '2017', 'ninguna', 'penicilina', '500', '1', '0', '0', '0', '1', '0', '0', 'Marcos alonso Martinez Melgar', 'AVON', '32847473-9', '23334343', '23232423', '78378487', 'colo Santa maria #32 San Vicente', 'Matrimonio', 'MamÃ¡', 'Maria de los Angeles Olivar Villalta', '', '', '32477827-4', '23334322', '', '', '7', '1', '1');
INSERT INTO `talumno` VALUES ('2', '0002', '2388829', 'Antonio Evaristo', 'Carmona Menjivar', '0', 'Colonia brisas del Bosque, #23 San Vicente', 'San Vicente', '1996-05-02', 'Autobus', '1', '2016', 'ninguna', 'Acetaminofer', '700', '1', '1', '0', '0', '1', '1', '0', '', '', '', '', '', '', '', 'Matrimonio Religioso', 'MamÃ¡', 'Maria de la paza Mejivar Gonzales', 'Mercado Central', 'cosmetologa', '21389724-9', '23333432', '23488387', '', '4', '1', '1');
INSERT INTO `talumno` VALUES ('3', '0003', '3247729', 'Fernando Alberto', 'Perez Melgar', '0', 'Colonia Ivu #23, San Vicente', 'San Vicente', '2000-06-02', 'A pie', '1', '2017', '', '', '70', '1', '1', '0', '0', '1', '1', '0', 'Marcos Vitelio Perez Olguera', 'Obrero', '32840283-4', '23334353', '23234345', '74673676', 'COlonia Ivu #45 San Vicente', 'AcompaÃ±ados', 'MamÃ¡ y PapÃ¡', '', '', '', '', '', '', '', '0', '1', '1');
INSERT INTO `talumno` VALUES ('4', '0004', '3247928', 'Luisa Maria', 'Pereira Montano', '1', 'Barrio el Santuario, #43 San Vicente', 'San Vicente', '1999-06-05', 'Autobus', '1', '2017', '', 'nada', '600', '1', '0', '0', '0', '1', '0', '1', '', '', '', '', '', '', '', 'Civil', 'Otro', 'Marcela Alejandra Moz', 'AVON', 'cosmetologa', '78797978-9', '22342342', '', '73673676', '7', '1', '1');
INSERT INTO `talumno` VALUES ('5', '0005', '8329483', 'Mabel Abigail', 'Rodriguez Alvarez', '1', 'Barrio el calvario #45 San Vicente', 'San Vicente', '1999-06-05', 'Autobus', '1', '2017', '', 'Ibuprofeno, Bic', '700', '0', '0', '0', '0', '1', '0', '0', 'Olga Maria Alvarez de Rodriguez', 'ILC', '23924739-2', '23243242', '23234234', '', 'Barrio el Calvario #45 San Vicente', 'Matrimonio Religioso', 'MamÃ¡ y PapÃ¡', '', '', '', '', '', '', '', '0', '0', '1');
INSERT INTO `talumno` VALUES ('6', '0006', '8787878', 'stefany Marianela ', 'Flores Mejia', '1', 'Colonia melgar #21, Casa #54, Sinquera', 'CabaÃ±as', '2004-06-05', 'Autobus', '1', '2017', '', '', '1700', '1', '0', '1', '0', '1', '1', '1', 'Alexander Olvidio Flores Guzman', '', '23849473-9', '28398273', '', '', 'colnia el amatillo #54, Sinquera, CabaÃ±as', 'Matrimonio Religioso', 'MamÃ¡ y PapÃ¡', 'Maria Antonieta Mejia Alvarado', '', '', '23479473-9', '', '', '78362767', '8', '1', '1');
INSERT INTO `talumno` VALUES ('7', '0007', '2347984', 'Suyapa Del Carmen', 'Torrres Maradiaga', '1', 'Colonia el porvenir #75, Cojutepeque', 'Cuscatlan', '2003-04-05', 'Autobus', '1', '2017', 'ipertometrirtis', 'nada', '5000', '1', '0', '1', '1', '1', '1', '0', '', '', '', '', '', '', '', 'Separados', 'MamÃ¡', 'Sonia de la paz Maradiaga', 'pupuseria', 'pupusera', '28340283-4', '23234234', '', '', '5', '1', '1');
INSERT INTO `talumno` VALUES ('8', '0008', '2663553', 'Gerson Bladimir', 'Palacios Alvarado', '0', 'Colonia Monserrat, #266 Cojutepeque', 'CabaÃ±as', '1998-08-07', 'Trans.Propio', '1', '2017', 'ninguna', '', '300', '1', '1', '0', '1', '1', '1', '0', 'Mariana Alverto Palacios', 'BANCOVI', '28349028-3', '', '21323423', '', 'Colonia Monserrat, #266 Cojutepeque', 'Matrimonio Religioso', 'MamÃ¡ y PapÃ¡', 'Sonia de la paz Alvarado', '', '', '23494739-3', '23324234', '', '', '5', '1', '1');
INSERT INTO `talumno` VALUES ('9', '0009', '3793874', 'Nayib Armando', 'Buckele', '0', 'Casa presidencial, San Salvador', 'San Salvador', '2005-06-03', 'Trans.Propio', '2', '2017', 'alzaimner', 'penicilina', '1300', '1', '0', '0', '0', '0', '0', '0', 'Armando Bukele', 'Yamaha Motors', '32874983-7', '23324234', '23234534', '7378478', 'colonia flor balanca, San Salvador', 'Matrimonio Religioso', 'MamÃ¡ y PapÃ¡', '', '', '', '', '', '', '', '4', '0', '1');
INSERT INTO `talumno` VALUES ('10', '0010', '7897970', 'Vanesa Abigail', 'Moran Velazques', '1', 'Barrio Concepcion, #66 San Vicente', 'San Vicente', '2009-06-05', 'A pie', '2', '2017', 'ninguna', 'ibprofeno', '600', '1', '1', '0', '1', '1', '1', '0', 'Marlon Bladimir Moran valderrama', 'Impresa Repuestos', '32747824-3', '23423532', '', '', 'Barrio Concepcion#66, San Vicente', 'Separados', 'PapÃ¡', '', '', '', '', '', '', '', '2', '1', '1');
INSERT INTO `talumno` VALUES ('11', '0011', '8837728', 'Oscar Bladimir', 'Melara Moz', '0', 'barrio la merced, #234 San Vicente,San Vicente', 'San Vicente', '1995-05-04', 'Trans.Propio', '2', '2017', 'asma', 'diclofenax', '500', '0', '0', '1', '1', '1', '1', '0', 'Marlon Antonio Alfaro', 'Taller los cheros', '23840283-4', '23423423', '23423423', '', '', 'AcompaÃ±ados', 'MamÃ¡ y PapÃ¡', 'Gloria Asucena Moz', 'Sanchos', 'Mesera', '38497247-8', '22342342', '23432523', '', '4', '1', '1');
INSERT INTO `talumno` VALUES ('12', '0012', '6635545', 'Juan de Dios', 'Castillo Ramos', '0', 'Calle el pedregal, #89 Perulapia', 'CabaÃ±as', '2000-06-05', 'Autobus', '2', '2017', 'nada', 'nada', '5000', '1', '1', '1', '0', '1', '1', '1', 'Marlon Adonay Castillo Orantes', '--', '32423479-2', '23324342', '', '', 'Calle al pedregar #45, Perulapia', 'Matrimonio Religioso', 'MamÃ¡ y PapÃ¡', '', '', '', '', '', '', '', '5', '1', '1');
INSERT INTO `talumno` VALUES ('13', '0013', '3478247', 'Julieta Emperatriz', 'Moran Beltran', '1', 'barrio el sabtuario, casa #4 San Vicente', 'San Vicente', '2001-07-06', 'A pie', '2', '2017', 'nada', '', '70', '1', '0', '0', '0', '1', '1', '0', '', '', '', '', '', '', '', 'Matrimonio Religioso', 'MamÃ¡ y PapÃ¡', 'olga aureli Moran de Beltran', 'la finca', 'obrera', '32477824-3', '23423432', '23324234', '', '6', '1', '1');
INSERT INTO `talumno` VALUES ('14', '0014', '3388828', 'Jose Oscar', 'Martinez PeÃ±ate', '0', 'Barrio San Jose, #78 San Vicente', 'San Vicente', '2000-08-05', 'Trans.Propio', '2', '2017', '', '', '600', '1', '0', '0', '0', '1', '1', '0', 'Jorge Alberto Martinez Cruz', 'tato system', '32849284-3', '23234234', '23435353', '74676377', '', 'Viudo/a', 'PapÃ¡', '', '', '', '', '', '', '', '2', '1', '1');
INSERT INTO `talumno` VALUES ('15', '0015', '6644388', 'Kevin Eduardo', 'Olivar Vasquez', '0', 'calle al tempisque #89, San Vicente', 'San Vicente', '2001-06-05', 'Trans.Propio', '2', '2017', 'ninguna', 'nada', '600', '0', '1', '0', '0', '1', '1', '1', 'Oscar Adonay Olivar Melgar', '', '32493247-4', '', '', '73874673', '', 'Matrimonio Religioso', 'MamÃ¡ y PapÃ¡', 'Marianela Elizableth Vasquez', '', '', '23474739-3', '22456524', '', '73553553', '4', '1', '1');
INSERT INTO `talumno` VALUES ('16', '0016', '2636663', 'Virna Osdalis', 'Alfaro Melgar', '1', 'calle la mascota, #89 San Miguel', 'San Miguel', '2000-06-10', 'Trans.Propio', '1', '2017', '', '', '5000', '1', '1', '0', '0', '1', '1', '1', 'Marcos Anotnio Alfaro Melgar', 'Tadeo System', '32478274-3', '23324783', '23334324', '73636767', '', 'AcompaÃ±ados', 'MamÃ¡ y PapÃ¡', '', '', '', '', '', '', '', '0', '1', '1');
INSERT INTO `talumno` VALUES ('17', '0017', '8776655', 'Marco Antonio', 'Alfaro Rivas', '0', 'Calle miralballe, #45 pasaje 5 Santa Ana', 'Santa Ana', '1999-08-05', 'Trans.Propio', '1', '2017', 'nada', 'acetaminofen', '7000', '1', '1', '0', '1', '1', '1', '0', 'Marcos Balmore Alfaro Monge', '', '89028490-8', '23234234', '28398924', '72873987', '--', 'Civil', 'PapÃ¡', 'SIlvia de los angeles Rivas de ALfaro', '', '', '23847924-9', '', '', '73663762', '7', '1', '1');
INSERT INTO `talumno` VALUES ('18', '0018', '2636366', 'Josselin Altagracia', 'Fernandez Barreto', '1', 'Barrio Candelaria #89, San Vicente', 'San Vicente', '2001-06-05', 'Autobus', '1', '2017', 'asma', 'Bic', '700', '0', '1', '0', '1', '1', '1', '0', 'Oscar Alfredo Fernandez ortega', 'FINSEPROINSEPRO', '72349799-8', '23673275', '23343423', '78378439', '--', 'Civil', 'MamÃ¡ y PapÃ¡', 'Maria Concepcion Barreto de Ortega', '', '', '23797349-2', '', '', '', '2', '1', '1');
INSERT INTO `talumno` VALUES ('19', '0019', '7387827', 'Oscar Virgilio', 'Salazar Hernandez', '0', 'Colonia los almendros, #65 Cojutepeque', 'Cuscatlan', '2001-08-06', 'Autobus', '2', '2017', 'artritis', 'aspirinas', '3500', '1', '1', '0', '0', '1', '1', '1', 'Oscar adonay Salazar Urrutia', 'ILC', '32840832-4', '', '23838838', '', '', 'Matrimonio Religioso', 'MamÃ¡ y PapÃ¡', 'Josefina de la paz Hernandez de Zalalazr', '', '', '72933483-4', '22423423', '', '78377476', '6', '1', '1');
INSERT INTO `talumno` VALUES ('20', '0020', '1128838', 'Maira Berenice', 'Orantes Rosales', '1', 'colonia la flor #45, San vicente', 'San Vicente', '2001-08-05', 'Autobus', '2', '2016', 'ninguna', '', '4055', '1', '1', '1', '1', '1', '1', '0', 'Marlon Bladimir Orantes Rosales', '--', '34734792-7', '', '', '', '', 'Matrimonio Religioso', 'MamÃ¡ y PapÃ¡', 'Maria Concepcion', '', '', '32840982-3', '23243242', '', '73664767', '8', '1', '1');
INSERT INTO `talumno` VALUES ('21', '0021', '', 'Maria Antonieta', 'Lopz Lopez', '1', 'San Vicente, Barrio San Juan de Dios', 'San Vicente', '2005-12-22', 'A pie', '3', '2017', 'Ninguna', 'Ninguna', '26', '1', '0', '1', '0', '1', '1', '1', 'Walter Lopez', 'Centro Judicial', '05450010-1', '27634632', '23932210', '76339087', 'San vicente', 'AcompaÃ±ados', 'MamÃ¡', '', '', '', '', '', '', '', '3', '1', '1');

-- ----------------------------
-- Table structure for talum_mat_not
-- ----------------------------
DROP TABLE IF EXISTS `talum_mat_not`;
CREATE TABLE `talum_mat_not` (
  `id_amn` int(11) NOT NULL AUTO_INCREMENT,
  `efk_idalumno` int(11) NOT NULL,
  `efk_idmateria` int(11) NOT NULL,
  `efk_idnota` int(11) NOT NULL,
  `efk_anio` int(11) NOT NULL,
  PRIMARY KEY (`id_amn`),
  KEY `fkalumno` (`efk_idalumno`),
  KEY `fkmaetria` (`efk_idmateria`),
  KEY `fknota` (`efk_idnota`),
  KEY `fkanio` (`efk_anio`),
  CONSTRAINT `fkalumno` FOREIGN KEY (`efk_idalumno`) REFERENCES `talumno` (`eid_alumno`),
  CONSTRAINT `fkanio` FOREIGN KEY (`efk_anio`) REFERENCES `tanio` (`eid_anio`),
  CONSTRAINT `fkmaetria` FOREIGN KEY (`efk_idmateria`) REFERENCES `tmaterias` (`eid_materia`),
  CONSTRAINT `fknota` FOREIGN KEY (`efk_idnota`) REFERENCES `tnotas` (`eid_notas`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of talum_mat_not
-- ----------------------------
INSERT INTO `talum_mat_not` VALUES ('1', '1', '1', '1', '1');
INSERT INTO `talum_mat_not` VALUES ('2', '1', '3', '2', '1');
INSERT INTO `talum_mat_not` VALUES ('3', '1', '5', '3', '1');
INSERT INTO `talum_mat_not` VALUES ('4', '1', '7', '4', '1');
INSERT INTO `talum_mat_not` VALUES ('5', '1', '9', '5', '1');
INSERT INTO `talum_mat_not` VALUES ('6', '2', '1', '6', '1');
INSERT INTO `talum_mat_not` VALUES ('7', '2', '3', '7', '1');
INSERT INTO `talum_mat_not` VALUES ('8', '2', '5', '8', '1');
INSERT INTO `talum_mat_not` VALUES ('9', '2', '7', '9', '1');
INSERT INTO `talum_mat_not` VALUES ('10', '2', '9', '10', '1');
INSERT INTO `talum_mat_not` VALUES ('11', '3', '1', '11', '1');
INSERT INTO `talum_mat_not` VALUES ('12', '3', '3', '12', '1');
INSERT INTO `talum_mat_not` VALUES ('13', '3', '5', '13', '1');
INSERT INTO `talum_mat_not` VALUES ('14', '3', '7', '14', '1');
INSERT INTO `talum_mat_not` VALUES ('15', '3', '9', '15', '1');
INSERT INTO `talum_mat_not` VALUES ('16', '4', '1', '16', '1');
INSERT INTO `talum_mat_not` VALUES ('17', '4', '3', '17', '1');
INSERT INTO `talum_mat_not` VALUES ('18', '4', '5', '18', '1');
INSERT INTO `talum_mat_not` VALUES ('19', '4', '7', '19', '1');
INSERT INTO `talum_mat_not` VALUES ('20', '4', '9', '20', '1');
INSERT INTO `talum_mat_not` VALUES ('21', '5', '1', '21', '1');
INSERT INTO `talum_mat_not` VALUES ('22', '5', '3', '22', '1');
INSERT INTO `talum_mat_not` VALUES ('23', '5', '5', '23', '1');
INSERT INTO `talum_mat_not` VALUES ('24', '5', '7', '24', '1');
INSERT INTO `talum_mat_not` VALUES ('25', '5', '9', '25', '1');
INSERT INTO `talum_mat_not` VALUES ('26', '6', '1', '26', '1');
INSERT INTO `talum_mat_not` VALUES ('27', '6', '3', '27', '1');
INSERT INTO `talum_mat_not` VALUES ('28', '6', '5', '28', '1');
INSERT INTO `talum_mat_not` VALUES ('29', '6', '7', '29', '1');
INSERT INTO `talum_mat_not` VALUES ('30', '6', '9', '30', '1');
INSERT INTO `talum_mat_not` VALUES ('31', '7', '1', '31', '1');
INSERT INTO `talum_mat_not` VALUES ('32', '7', '3', '32', '1');
INSERT INTO `talum_mat_not` VALUES ('33', '7', '5', '33', '1');
INSERT INTO `talum_mat_not` VALUES ('34', '7', '7', '34', '1');
INSERT INTO `talum_mat_not` VALUES ('35', '7', '9', '35', '1');
INSERT INTO `talum_mat_not` VALUES ('36', '8', '1', '36', '1');
INSERT INTO `talum_mat_not` VALUES ('37', '8', '3', '37', '1');
INSERT INTO `talum_mat_not` VALUES ('38', '8', '5', '38', '1');
INSERT INTO `talum_mat_not` VALUES ('39', '8', '7', '39', '1');
INSERT INTO `talum_mat_not` VALUES ('40', '8', '9', '40', '1');
INSERT INTO `talum_mat_not` VALUES ('41', '9', '2', '41', '1');
INSERT INTO `talum_mat_not` VALUES ('42', '9', '4', '42', '1');
INSERT INTO `talum_mat_not` VALUES ('43', '9', '6', '43', '1');
INSERT INTO `talum_mat_not` VALUES ('44', '9', '8', '44', '1');
INSERT INTO `talum_mat_not` VALUES ('45', '9', '10', '45', '1');
INSERT INTO `talum_mat_not` VALUES ('46', '10', '2', '46', '1');
INSERT INTO `talum_mat_not` VALUES ('47', '10', '4', '47', '1');
INSERT INTO `talum_mat_not` VALUES ('48', '10', '6', '48', '1');
INSERT INTO `talum_mat_not` VALUES ('49', '10', '8', '49', '1');
INSERT INTO `talum_mat_not` VALUES ('50', '10', '10', '50', '1');
INSERT INTO `talum_mat_not` VALUES ('51', '11', '2', '51', '1');
INSERT INTO `talum_mat_not` VALUES ('52', '11', '4', '52', '1');
INSERT INTO `talum_mat_not` VALUES ('53', '11', '6', '53', '1');
INSERT INTO `talum_mat_not` VALUES ('54', '11', '8', '54', '1');
INSERT INTO `talum_mat_not` VALUES ('55', '11', '10', '55', '1');
INSERT INTO `talum_mat_not` VALUES ('56', '12', '2', '56', '1');
INSERT INTO `talum_mat_not` VALUES ('57', '12', '4', '57', '1');
INSERT INTO `talum_mat_not` VALUES ('58', '12', '6', '58', '1');
INSERT INTO `talum_mat_not` VALUES ('59', '12', '8', '59', '1');
INSERT INTO `talum_mat_not` VALUES ('60', '12', '10', '60', '1');
INSERT INTO `talum_mat_not` VALUES ('61', '13', '2', '61', '1');
INSERT INTO `talum_mat_not` VALUES ('62', '13', '4', '62', '1');
INSERT INTO `talum_mat_not` VALUES ('63', '13', '6', '63', '1');
INSERT INTO `talum_mat_not` VALUES ('64', '13', '8', '64', '1');
INSERT INTO `talum_mat_not` VALUES ('65', '13', '10', '65', '1');
INSERT INTO `talum_mat_not` VALUES ('66', '14', '2', '66', '1');
INSERT INTO `talum_mat_not` VALUES ('67', '14', '4', '67', '1');
INSERT INTO `talum_mat_not` VALUES ('68', '14', '6', '68', '1');
INSERT INTO `talum_mat_not` VALUES ('69', '14', '8', '69', '1');
INSERT INTO `talum_mat_not` VALUES ('70', '14', '10', '70', '1');
INSERT INTO `talum_mat_not` VALUES ('71', '15', '2', '71', '1');
INSERT INTO `talum_mat_not` VALUES ('72', '15', '4', '72', '1');
INSERT INTO `talum_mat_not` VALUES ('73', '15', '6', '73', '1');
INSERT INTO `talum_mat_not` VALUES ('74', '15', '8', '74', '1');
INSERT INTO `talum_mat_not` VALUES ('75', '15', '10', '75', '1');
INSERT INTO `talum_mat_not` VALUES ('76', '16', '1', '76', '1');
INSERT INTO `talum_mat_not` VALUES ('77', '16', '3', '77', '1');
INSERT INTO `talum_mat_not` VALUES ('78', '16', '5', '78', '1');
INSERT INTO `talum_mat_not` VALUES ('79', '16', '7', '79', '1');
INSERT INTO `talum_mat_not` VALUES ('80', '16', '9', '80', '1');
INSERT INTO `talum_mat_not` VALUES ('81', '17', '1', '81', '1');
INSERT INTO `talum_mat_not` VALUES ('82', '17', '3', '82', '1');
INSERT INTO `talum_mat_not` VALUES ('83', '17', '5', '83', '1');
INSERT INTO `talum_mat_not` VALUES ('84', '17', '7', '84', '1');
INSERT INTO `talum_mat_not` VALUES ('85', '17', '9', '85', '1');
INSERT INTO `talum_mat_not` VALUES ('86', '18', '1', '86', '1');
INSERT INTO `talum_mat_not` VALUES ('87', '18', '3', '87', '1');
INSERT INTO `talum_mat_not` VALUES ('88', '18', '5', '88', '1');
INSERT INTO `talum_mat_not` VALUES ('89', '18', '7', '89', '1');
INSERT INTO `talum_mat_not` VALUES ('90', '18', '9', '90', '1');
INSERT INTO `talum_mat_not` VALUES ('91', '19', '2', '91', '1');
INSERT INTO `talum_mat_not` VALUES ('92', '19', '4', '92', '1');
INSERT INTO `talum_mat_not` VALUES ('93', '19', '6', '93', '1');
INSERT INTO `talum_mat_not` VALUES ('94', '19', '8', '94', '1');
INSERT INTO `talum_mat_not` VALUES ('95', '19', '10', '95', '1');
INSERT INTO `talum_mat_not` VALUES ('96', '20', '2', '96', '1');
INSERT INTO `talum_mat_not` VALUES ('97', '20', '4', '97', '1');
INSERT INTO `talum_mat_not` VALUES ('98', '20', '6', '98', '1');
INSERT INTO `talum_mat_not` VALUES ('99', '20', '8', '99', '1');
INSERT INTO `talum_mat_not` VALUES ('100', '20', '10', '100', '1');
INSERT INTO `talum_mat_not` VALUES ('101', '21', '11', '101', '1');
INSERT INTO `talum_mat_not` VALUES ('102', '21', '12', '102', '1');

-- ----------------------------
-- Table structure for tanio
-- ----------------------------
DROP TABLE IF EXISTS `tanio`;
CREATE TABLE `tanio` (
  `eid_anio` int(11) NOT NULL AUTO_INCREMENT,
  `canio` int(11) NOT NULL,
  `iestado` int(11) NOT NULL,
  `eclausura` int(11) NOT NULL,
  PRIMARY KEY (`eid_anio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tanio
-- ----------------------------
INSERT INTO `tanio` VALUES ('1', '2018', '0', '1');
INSERT INTO `tanio` VALUES ('2', '2019', '1', '0');

-- ----------------------------
-- Table structure for tbachilleratos
-- ----------------------------
DROP TABLE IF EXISTS `tbachilleratos`;
CREATE TABLE `tbachilleratos` (
  `eid_bachillerato` int(11) NOT NULL AUTO_INCREMENT,
  `ccodigo` varchar(20) NOT NULL,
  `cnombe` varchar(30) NOT NULL,
  `cdescripcion` varchar(200) NOT NULL,
  `efk_tipo` int(11) NOT NULL,
  `eestado` int(11) NOT NULL,
  PRIMARY KEY (`eid_bachillerato`),
  KEY `fktipo` (`efk_tipo`),
  CONSTRAINT `fktipo` FOREIGN KEY (`efk_tipo`) REFERENCES `ttipobachillerato` (`eid_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbachilleratos
-- ----------------------------
INSERT INTO `tbachilleratos` VALUES ('1', 'BAC177', 'Bachillerato General', 'Bachillerato orientado a la enseÃ±anza basica de educacion media', '2', '1');
INSERT INTO `tbachilleratos` VALUES ('2', 'ADM178', 'Administrativo contable', 'Carrera orientada a la contabilidad', '1', '1');

-- ----------------------------
-- Table structure for tbitacora
-- ----------------------------
DROP TABLE IF EXISTS `tbitacora`;
CREATE TABLE `tbitacora` (
  `eid_bitacora` int(11) NOT NULL AUTO_INCREMENT,
  `efk_idusuario` int(11) NOT NULL,
  `dtfecha` datetime NOT NULL,
  `cdescripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`eid_bitacora`),
  KEY `efkusuario` (`efk_idusuario`),
  CONSTRAINT `efkusuario` FOREIGN KEY (`efk_idusuario`) REFERENCES `tusuarios` (`eid_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbitacora
-- ----------------------------
INSERT INTO `tbitacora` VALUES ('1', '13', '2019-01-18 07:23:14', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('2', '14', '2019-01-18 07:23:19', 'IniciÃ³ sesion Docente ');
INSERT INTO `tbitacora` VALUES ('3', '14', '2019-01-18 07:23:25', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('4', '13', '2019-01-18 07:23:30', 'IniciÃ³ sesion Administrador');
INSERT INTO `tbitacora` VALUES ('5', '13', '2019-01-18 07:26:10', 'ModificÃ³ un permiso temporal');
INSERT INTO `tbitacora` VALUES ('6', '13', '2019-01-18 07:26:49', 'ModificÃ³ un permiso temporal');
INSERT INTO `tbitacora` VALUES ('7', '13', '2019-01-18 07:32:53', 'BrindÃ³ permiso temporal a un usuario');
INSERT INTO `tbitacora` VALUES ('8', '13', '2019-01-18 07:34:47', 'BrindÃ³ permiso temporal a un usuario');
INSERT INTO `tbitacora` VALUES ('9', '13', '2019-01-18 07:34:53', 'BrindÃ³ permiso temporal a un usuario');
INSERT INTO `tbitacora` VALUES ('10', '13', '2019-01-18 07:35:03', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('11', '14', '2019-01-18 07:35:16', 'IniciÃ³ sesion Docente ');
INSERT INTO `tbitacora` VALUES ('12', '14', '2019-01-18 07:35:31', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('13', '13', '2019-01-18 07:35:39', 'IniciÃ³ sesion Administrador');
INSERT INTO `tbitacora` VALUES ('14', '13', '2019-01-18 07:35:50', 'AperturÃ³ periodo de inscripcion');
INSERT INTO `tbitacora` VALUES ('15', '13', '2019-01-18 07:36:42', 'CerrÃ³ periodo de inscripcion');
INSERT INTO `tbitacora` VALUES ('16', '13', '2019-01-18 07:46:26', 'RegistrÃ³ un nuevo bachillerato');
INSERT INTO `tbitacora` VALUES ('17', '13', '2019-01-18 07:46:39', 'RegistrÃ³ una nueva Opcion de Bachillerato');
INSERT INTO `tbitacora` VALUES ('18', '13', '2019-01-18 07:46:47', 'RegistrÃ³ una nueva Opcion de Bachillerato');
INSERT INTO `tbitacora` VALUES ('19', '13', '2019-01-18 07:50:45', 'AperturÃ³ periodo de inscripcion');
INSERT INTO `tbitacora` VALUES ('20', '13', '2019-01-18 07:59:30', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('21', '13', '2019-01-18 07:59:31', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('22', '13', '2019-01-18 07:59:31', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('23', '13', '2019-01-18 07:59:31', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('24', '13', '2019-01-18 07:59:32', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('25', '13', '2019-01-18 08:03:08', 'Se editÃ³ la inscripcion del alumno: ');
INSERT INTO `tbitacora` VALUES ('26', '13', '2019-01-18 08:05:55', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('27', '13', '2019-01-18 08:05:55', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('28', '13', '2019-01-18 08:05:55', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('29', '13', '2019-01-18 08:05:56', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('30', '13', '2019-01-18 08:05:56', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('31', '13', '2019-01-18 08:09:01', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('32', '13', '2019-01-18 08:09:01', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('33', '13', '2019-01-18 08:09:02', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('34', '13', '2019-01-18 08:09:02', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('35', '13', '2019-01-18 08:09:02', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('36', '13', '2019-01-18 08:12:57', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('37', '14', '2019-01-18 08:13:04', 'IniciÃ³ sesion Docente ');
INSERT INTO `tbitacora` VALUES ('38', '14', '2019-01-18 08:15:56', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('39', '14', '2019-01-18 08:15:56', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('40', '14', '2019-01-18 08:15:57', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('41', '14', '2019-01-18 08:15:57', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('42', '14', '2019-01-18 08:15:57', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('43', '14', '2019-01-18 08:16:08', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('44', '13', '2019-01-18 08:17:03', 'IniciÃ³ sesion Administrador');
INSERT INTO `tbitacora` VALUES ('45', '13', '2019-01-18 08:23:57', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('46', '13', '2019-01-18 08:25:18', 'IniciÃ³ sesion Administrador');
INSERT INTO `tbitacora` VALUES ('47', '13', '2019-01-18 08:25:56', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('48', '16', '2019-01-18 08:26:03', 'IniciÃ³ sesion Docente ');
INSERT INTO `tbitacora` VALUES ('49', '16', '2019-01-18 08:26:09', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('50', '13', '2019-01-18 08:26:20', 'IniciÃ³ sesion Administrador');
INSERT INTO `tbitacora` VALUES ('51', '13', '2019-01-18 08:26:37', 'BrindÃ³ permiso temporal a un usuario');
INSERT INTO `tbitacora` VALUES ('52', '13', '2019-01-18 08:26:42', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('53', '16', '2019-01-18 08:26:51', 'IniciÃ³ sesion Docente ');
INSERT INTO `tbitacora` VALUES ('54', '16', '2019-01-18 08:27:04', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('55', '13', '2019-01-18 08:28:20', 'IniciÃ³ sesion Administrador');
INSERT INTO `tbitacora` VALUES ('56', '13', '2019-01-18 08:33:39', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('57', '13', '2019-01-18 08:33:39', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('58', '13', '2019-01-18 08:33:39', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('59', '13', '2019-01-18 08:33:40', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('60', '13', '2019-01-18 08:33:40', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('61', '13', '2019-01-18 08:40:54', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('62', '13', '2019-01-18 08:40:54', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('63', '13', '2019-01-18 08:40:55', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('64', '13', '2019-01-18 08:40:55', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('65', '13', '2019-01-18 08:40:55', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('66', '13', '2019-01-18 08:45:00', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('67', '13', '2019-01-18 08:45:00', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('68', '13', '2019-01-18 08:45:01', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('69', '13', '2019-01-18 08:45:01', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('70', '13', '2019-01-18 08:45:01', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('71', '13', '2019-01-18 08:55:22', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('72', '13', '2019-01-18 08:55:22', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('73', '13', '2019-01-18 08:55:22', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('74', '13', '2019-01-18 08:55:22', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('75', '13', '2019-01-18 08:55:23', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('76', '13', '2019-01-18 08:59:03', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('77', '13', '2019-01-18 08:59:03', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('78', '13', '2019-01-18 08:59:03', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('79', '13', '2019-01-18 08:59:03', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('80', '13', '2019-01-18 08:59:04', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('81', '13', '2019-01-18 09:04:06', 'IniciÃ³ sesion Administrador');
INSERT INTO `tbitacora` VALUES ('82', '13', '2019-01-18 09:07:46', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('83', '13', '2019-01-18 09:07:46', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('84', '13', '2019-01-18 09:07:46', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('85', '13', '2019-01-18 09:07:47', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('86', '13', '2019-01-18 09:07:47', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('87', '13', '2019-01-18 09:10:31', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('88', '13', '2019-01-18 09:10:31', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('89', '13', '2019-01-18 09:10:32', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('90', '13', '2019-01-18 09:10:32', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('91', '13', '2019-01-18 09:10:32', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('92', '13', '2019-01-18 09:16:49', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('93', '13', '2019-01-18 09:16:49', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('94', '13', '2019-01-18 09:16:50', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('95', '13', '2019-01-18 09:16:50', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('96', '13', '2019-01-18 09:16:51', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('97', '13', '2019-01-18 09:22:55', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('98', '13', '2019-01-18 09:22:55', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('99', '13', '2019-01-18 09:22:55', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('100', '13', '2019-01-18 09:22:56', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('101', '13', '2019-01-18 09:22:56', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('102', '13', '2019-01-18 09:29:39', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('103', '13', '2019-01-18 09:29:39', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('104', '13', '2019-01-18 09:29:39', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('105', '13', '2019-01-18 09:29:39', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('106', '13', '2019-01-18 09:29:40', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('107', '13', '2019-01-18 09:33:35', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('108', '13', '2019-01-18 09:33:35', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('109', '13', '2019-01-18 09:33:35', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('110', '13', '2019-01-18 09:33:36', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('111', '13', '2019-01-18 09:33:36', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('112', '13', '2019-01-18 09:48:30', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('113', '13', '2019-01-18 09:48:30', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('114', '13', '2019-01-18 09:48:30', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('115', '13', '2019-01-18 09:48:30', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('116', '13', '2019-01-18 09:48:30', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('117', '13', '2019-01-18 09:51:54', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('118', '13', '2019-01-18 09:51:54', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('119', '13', '2019-01-18 09:51:54', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('120', '13', '2019-01-18 09:51:54', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('121', '13', '2019-01-18 09:51:55', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('122', '13', '2019-01-18 09:55:34', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('123', '13', '2019-01-18 09:55:34', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('124', '13', '2019-01-18 09:55:34', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('125', '13', '2019-01-18 09:55:34', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('126', '13', '2019-01-18 09:55:35', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('127', '13', '2019-01-18 10:01:57', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('128', '13', '2019-01-18 10:01:57', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('129', '13', '2019-01-18 10:01:57', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('130', '13', '2019-01-18 10:01:57', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('131', '13', '2019-01-18 10:01:58', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('132', '13', '2019-01-18 10:05:15', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('133', '13', '2019-01-18 10:05:15', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('134', '13', '2019-01-18 10:05:15', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('135', '13', '2019-01-18 10:05:15', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('136', '13', '2019-01-18 10:05:15', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('137', '13', '2019-01-18 10:07:50', 'CerrÃ³ periodo de inscripcion');
INSERT INTO `tbitacora` VALUES ('138', '13', '2019-01-18 10:08:16', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('139', '14', '2019-01-18 10:08:32', 'IniciÃ³ sesion Docente ');
INSERT INTO `tbitacora` VALUES ('140', '14', '2019-01-18 10:09:15', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('141', '13', '2019-01-18 10:48:08', 'IniciÃ³ sesion Administrador');
INSERT INTO `tbitacora` VALUES ('142', '14', '2019-01-18 10:48:38', 'IniciÃ³ sesion Docente ');
INSERT INTO `tbitacora` VALUES ('143', '13', '2019-01-18 10:50:40', 'RegistrÃ³ un nuevo bachillerato');
INSERT INTO `tbitacora` VALUES ('144', '13', '2019-01-18 10:52:04', 'RegistrÃ³ una nueva Opcion de Bachillerato');
INSERT INTO `tbitacora` VALUES ('145', '13', '2019-01-18 10:54:52', 'Inserto un nuevo horario');
INSERT INTO `tbitacora` VALUES ('146', '14', '2019-01-18 11:03:54', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('147', '17', '2019-01-18 11:04:05', 'IniciÃ³ sesion Docente ');
INSERT INTO `tbitacora` VALUES ('148', '13', '2019-01-18 11:07:00', 'RegistrÃ³ una nueva materia');
INSERT INTO `tbitacora` VALUES ('149', '13', '2019-01-18 11:07:54', 'RegistrÃ³ una nueva materia');
INSERT INTO `tbitacora` VALUES ('150', '13', '2019-01-18 11:11:06', 'BrindÃ³ permiso temporal a un usuario');
INSERT INTO `tbitacora` VALUES ('151', '17', '2019-01-18 11:11:44', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('152', '13', '2019-01-18 11:11:50', 'ModificÃ³ un permiso temporal');
INSERT INTO `tbitacora` VALUES ('153', '14', '2019-01-18 11:12:22', 'IniciÃ³ sesion Docente ');
INSERT INTO `tbitacora` VALUES ('154', '13', '2019-01-18 11:12:38', 'ModificÃ³ un permiso temporal');
INSERT INTO `tbitacora` VALUES ('155', '14', '2019-01-18 11:12:58', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('156', '14', '2019-01-18 11:13:09', 'IniciÃ³ sesion Docente ');
INSERT INTO `tbitacora` VALUES ('157', '14', '2019-01-18 11:14:25', 'CerrÃ³ la sesion');
INSERT INTO `tbitacora` VALUES ('158', '17', '2019-01-18 11:14:35', 'IniciÃ³ sesion Docente ');
INSERT INTO `tbitacora` VALUES ('159', '13', '2019-01-18 11:15:18', 'AperturÃ³ periodo de inscripcion');
INSERT INTO `tbitacora` VALUES ('160', '13', '2019-01-18 11:21:03', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('161', '13', '2019-01-18 11:21:03', 'Inscribio un nuevo alumno');
INSERT INTO `tbitacora` VALUES ('162', '13', '2019-01-18 11:33:00', 'AperturÃ³ periodo');
INSERT INTO `tbitacora` VALUES ('163', '13', '2019-01-18 11:37:51', 'AperturÃ³ periodo');
INSERT INTO `tbitacora` VALUES ('164', '13', '2019-01-20 09:28:44', 'IniciÃ³ sesion Administrador');

-- ----------------------------
-- Table structure for tcargos
-- ----------------------------
DROP TABLE IF EXISTS `tcargos`;
CREATE TABLE `tcargos` (
  `eid_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `ccargo` varchar(50) NOT NULL,
  PRIMARY KEY (`eid_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tcargos
-- ----------------------------
INSERT INTO `tcargos` VALUES ('1', 'Secretaria');
INSERT INTO `tcargos` VALUES ('2', 'Director');
INSERT INTO `tcargos` VALUES ('3', 'Docente');
INSERT INTO `tcargos` VALUES ('4', 'Subdirectora');
INSERT INTO `tcargos` VALUES ('5', 'Ordenanza');

-- ----------------------------
-- Table structure for tgrado
-- ----------------------------
DROP TABLE IF EXISTS `tgrado`;
CREATE TABLE `tgrado` (
  `eid_grado` int(11) NOT NULL AUTO_INCREMENT,
  `cgrado` int(11) NOT NULL,
  PRIMARY KEY (`eid_grado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tgrado
-- ----------------------------
INSERT INTO `tgrado` VALUES ('1', '1');
INSERT INTO `tgrado` VALUES ('2', '2');
INSERT INTO `tgrado` VALUES ('3', '3');

-- ----------------------------
-- Table structure for thorarios
-- ----------------------------
DROP TABLE IF EXISTS `thorarios`;
CREATE TABLE `thorarios` (
  `eid_horario` int(11) NOT NULL AUTO_INCREMENT,
  `cdia` varchar(20) NOT NULL,
  `chora` varchar(20) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`eid_horario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of thorarios
-- ----------------------------
INSERT INTO `thorarios` VALUES ('1', 'Lunes y Martes', '7:00 AM - 10:00 AM', '1');
INSERT INTO `thorarios` VALUES ('2', 'Martes y Miercoles', '10:00 AM - 12:00 PM', '1');
INSERT INTO `thorarios` VALUES ('3', 'Miercoles y Viernes', '03:00 PM - 05:00 PM', '1');
INSERT INTO `thorarios` VALUES ('4', 'Jueves y Jueves', '01:00 PM - 03:00 PM', '0');
INSERT INTO `thorarios` VALUES ('5', 'Martes y Miercoles', '01:00 PM - 03:00 PM', '1');
INSERT INTO `thorarios` VALUES ('6', 'Jueves y Viernes', '03:00 PM - 05:00 PM', '1');
INSERT INTO `thorarios` VALUES ('7', 'Martes y Jueves', '7:00 AM - 10:00 AM', '1');
INSERT INTO `thorarios` VALUES ('8', 'Martes y Jueves', '10:00 AM - 12:00 PM', '1');
INSERT INTO `thorarios` VALUES ('9', 'Martes y Jueves', '01:00 PM - 03:00 PM', '1');
INSERT INTO `thorarios` VALUES ('10', 'Martes y Jueves', '03:00 PM - 05:00 PM', '1');
INSERT INTO `thorarios` VALUES ('11', 'Lunes y Martes', '03:00 PM - 05:00 PM', '1');

-- ----------------------------
-- Table structure for tmaterias
-- ----------------------------
DROP TABLE IF EXISTS `tmaterias`;
CREATE TABLE `tmaterias` (
  `eid_materia` int(11) NOT NULL AUTO_INCREMENT,
  `ccodigo` varchar(10) NOT NULL,
  `cnombre` varchar(30) NOT NULL,
  `cdescripcion` varchar(200) NOT NULL,
  `efk_idopcion` int(11) NOT NULL,
  `efk_idhorario` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  PRIMARY KEY (`eid_materia`),
  KEY `fkopcion` (`efk_idopcion`),
  KEY `fkhorario_idx` (`efk_idhorario`),
  CONSTRAINT `fkhorario` FOREIGN KEY (`efk_idhorario`) REFERENCES `thorarios` (`eid_horario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkopcion` FOREIGN KEY (`efk_idopcion`) REFERENCES `topciones` (`eid_opcion`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tmaterias
-- ----------------------------
INSERT INTO `tmaterias` VALUES ('1', '001', 'Matematicas', 'Materia de enseÃ±anza de las matematicas basicas', '1', '2', '1', '1');
INSERT INTO `tmaterias` VALUES ('2', '002', 'Matematica', 'Matematica orientada ala enseÃ±anza de integrales y funciones', '2', '5', '1', '1');
INSERT INTO `tmaterias` VALUES ('3', '002', 'Sociales', 'Materia que muestra la sociedad humana en El Salvador', '1', '3', '1', '1');
INSERT INTO `tmaterias` VALUES ('4', '003', 'Sociales', 'Materia orientada a la enseÃ±anza de la sociedad en la actualidad', '2', '6', '1', '1');
INSERT INTO `tmaterias` VALUES ('5', '005', 'Introduccion a la Economia', 'materia orientda a la comprencion de la economia como ciencia', '1', '6', '1', '1');
INSERT INTO `tmaterias` VALUES ('6', '005', 'Economia aplicada I', 'Materia orientada a la elaboracion de hipotesis sobre economia y negocios', '2', '2', '1', '1');
INSERT INTO `tmaterias` VALUES ('7', '007', 'Lenguaje I', 'Materia orientada a la enseÃ±annza de la lengua natal', '1', '7', '1', '1');
INSERT INTO `tmaterias` VALUES ('8', '007', 'Ingles I', 'Materia orientda a la enseÃ±anza de la lengua predominante en el mundo', '2', '9', '1', '1');
INSERT INTO `tmaterias` VALUES ('9', '007', 'Ciencias Naturales', 'Materia orientada a la enseÃ±anza de las ciencias naturales en el mundo, flora y fauna', '1', '10', '1', '1');
INSERT INTO `tmaterias` VALUES ('10', '009', 'Solidos I', 'Materia orientada mediante leguaje aplicado para solucion de problemas mediante graficas en 3D', '2', '8', '1', '1');
INSERT INTO `tmaterias` VALUES ('11', '011', 'DiseÃ±o de Sistemas II', 'Esta materia es bonita ', '3', '6', '1', '1');
INSERT INTO `tmaterias` VALUES ('12', '011', 'Matematicas II', 'Aca se da algebra', '3', '2', '1', '1');

-- ----------------------------
-- Table structure for tnotas
-- ----------------------------
DROP TABLE IF EXISTS `tnotas`;
CREATE TABLE `tnotas` (
  `eid_notas` int(11) NOT NULL AUTO_INCREMENT,
  `dnota1p1` double NOT NULL,
  `dnota2p1` double NOT NULL,
  `dnota3p1` double NOT NULL,
  `drecuperacionp1` double NOT NULL,
  `dpromediop1` double NOT NULL,
  `dnota1p2` double NOT NULL,
  `dnota2p2` double NOT NULL,
  `dnota3p2` double NOT NULL,
  `drecuperacionp2` double NOT NULL,
  `dpromediop2` double NOT NULL,
  `dnota1p3` double NOT NULL,
  `dnota2p3` double NOT NULL,
  `dnota3p3` double NOT NULL,
  `drecuperacionp3` double NOT NULL,
  `dpromediop3` double NOT NULL,
  `dnota1p4` double NOT NULL,
  `dnota2p4` double NOT NULL,
  `dnota3p4` double NOT NULL,
  `drecuperacionp4` double NOT NULL,
  `dpromediop4` double NOT NULL,
  PRIMARY KEY (`eid_notas`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tnotas
-- ----------------------------
INSERT INTO `tnotas` VALUES ('1', '7.25', '8', '9.45', '0', '8.23', '7', '2', '8', '7', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('2', '10', '10', '10', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('3', '1', '2', '3', '10', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('4', '9.9', '10', '8', '0', '9.3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('5', '4.4', '6.6', '8.9', '0', '6.63', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('6', '6.7', '8.56', '9.9', '0', '8.39', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('7', '1.5', '0.33', '5', '4', '2.71', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('8', '4.4', '10', '5', '0', '6.47', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('9', '6', '6.78', '4', '9', '6.45', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('10', '1.1', '2.5', '8', '10', '5.4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('11', '9', '10', '8', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('12', '7.9', '8', '5', '0', '6.97', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('13', '4.4', '10', '10', '0', '8.13', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('14', '10', '2', '9', '0', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('15', '10', '9', '4.4', '0', '7.8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('16', '3.45', '3.9', '7', '10', '6.09', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('17', '9.95', '4', '8.44', '0', '7.46', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('18', '1.1', '4.5', '9', '10', '6.15', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('19', '9.9', '10', '7', '0', '8.97', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('20', '1.1', '2.2', '4.4', '10', '4.43', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('21', '7', '2.3', '6.95', '8', '6.06', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('22', '9', '9', '9', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('23', '10', '10', '9', '0', '9.67', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('24', '4.4', '8', '9', '0', '7.13', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('25', '1.1', '9.97', '1.1', '10', '5.54', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('26', '5.45', '8', '9.9', '0', '7.78', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('27', '4.5', '5.6', '9', '0', '6.37', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('28', '9.9', '8', '8', '0', '8.63', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('29', '9.9', '4', '4', '10', '6.97', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('30', '9.9', '10', '1', '0', '6.97', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('31', '4.6', '1.1', '9', '10', '6.17', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('32', '2.44', '6.9', '10', '0', '6.45', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('33', '2.3', '6.6', '1', '4', '3.47', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('34', '1.44', '5.55', '7.9', '7', '5.47', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('35', '1.1', '2.2', '4.5', '10', '4.45', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('36', '4.1', '2.45', '3.1', '10', '4.91', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('37', '9.9', '4.5', '7.4', '0', '7.27', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('38', '2.2', '1', '0', '6', '2.3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('39', '8.8', '9.9', '1', '0', '6.57', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('40', '8.1', '9.9', '10', '0', '9.33', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('41', '10', '10', '10', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('42', '10', '10', '10', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('43', '7.7', '4.4', '6.6', '0', '6.23', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('44', '10', '10', '9.9', '0', '9.97', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('45', '9.9', '8', '10', '0', '9.3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('46', '0.55', '4.5', '9.9', '10', '6.24', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('47', '9', '1.55', '6', '9', '6.39', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('48', '7.7', '3.3', '1.1', '10', '5.53', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('49', '5.5', '5.6', '9', '0', '6.7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('50', '2.2', '4.4', '3.3', '10', '4.97', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('51', '1.1', '2.2', '9.9', '10', '5.8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('52', '9.9', '6', '9.9', '0', '8.6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('53', '8.8', '8.8', '9', '0', '8.87', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('54', '10', '9', '3', '0', '7.33', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('55', '1.1', '4.4', '6.6', '10', '5.53', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('56', '10', '10', '2.44', '0', '7.48', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('57', '1.1', '5.5', '9.9', '10', '6.63', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('58', '7.7', '8.8', '1', '0', '5.83', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('59', '7.7', '7.7', '6', '0', '7.13', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('60', '1.1', '4.4', '5', '9', '4.88', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('61', '9.2', '1.1', '9.4', '0', '6.57', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('62', '1.1', '2', '4', '10', '4.28', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('63', '1.1', '8.5', '6.5', '10', '6.53', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('64', '6.6', '10', '3.3', '0', '6.63', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('65', '9.9', '1.1', '5', '8', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('66', '9.9', '1.1', '2.2', '10', '5.8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('67', '9.9', '2.2', '5.5', '8', '6.4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('68', '1.1', '2.2', '4.4', '1', '2.18', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('69', '5.5', '6.6', '7.7', '0', '6.6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('70', '10', '4', '1', '8.94', '5.98', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('71', '2.2', '10', '9', '0', '7.07', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('72', '9.9', '7.7', '9.9', '0', '9.17', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('73', '6.6', '1.1', '8.8', '8', '6.13', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('74', '1.1', '5.5', '10', '10', '6.65', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('75', '4.4', '10', '1', '9', '6.1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('76', '6.6', '6.6', '9.9', '0', '7.7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('77', '6.6', '9', '6', '0', '7.2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('78', '3.43', '6', '9', '0', '6.14', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('79', '1', '1.3', '1.5', '10', '3.45', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('80', '9.9', '1.1', '9.9', '0', '6.97', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('81', '2.5', '9', '9', '0', '6.83', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('82', '1.1', '3.3', '5', '10', '4.85', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('83', '1.2', '5.5', '6.6', '10', '5.83', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('84', '9', '9', '9.99', '0', '9.33', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('85', '8', '8', '9', '0', '8.33', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('86', '3.3', '5.5', '1.1', '10', '4.97', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('87', '1.1', '3.2', '7.8', '9', '5.28', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('88', '1.1', '2.2', '4.4', '10', '4.43', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('89', '3.2', '9', '10', '0', '7.4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('90', '4', '6', '9', '0', '6.33', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('91', '4.4', '9', '9', '0', '7.47', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('92', '4.4', '5.5', '6.6', '10', '6.63', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('93', '2.2', '9', '1', '10', '5.55', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('94', '8.8', '4', '9', '0', '7.27', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('95', '5.5', '6.6', '2', '10', '6.03', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('96', '5.5', '9.9', '9', '0', '8.13', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('97', '2', '3', '5', '9', '4.75', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('98', '10', '2', '10', '0', '7.33', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('99', '9.9', '3.3', '5.5', '0', '6.23', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('100', '5.5', '1', '2', '0', '2.83', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('101', '7', '6', '2', '9', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tnotas` VALUES ('102', '8', '7', '9.5', '0', '8.17', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for topciones
-- ----------------------------
DROP TABLE IF EXISTS `topciones`;
CREATE TABLE `topciones` (
  `eid_opcion` int(11) NOT NULL AUTO_INCREMENT,
  `ecupo_maximo` int(11) NOT NULL,
  `efk_bto` int(11) NOT NULL,
  `efk_grado` int(11) NOT NULL,
  `efk_seccion` int(11) NOT NULL,
  `eestado` int(11) NOT NULL,
  `inscritos` int(11) NOT NULL,
  `anio` int(11) NOT NULL,
  PRIMARY KEY (`eid_opcion`),
  KEY `fkbto` (`efk_bto`),
  KEY `fkgrado` (`efk_grado`),
  KEY `fkseccion` (`efk_seccion`),
  CONSTRAINT `fkbto` FOREIGN KEY (`efk_bto`) REFERENCES `tbachilleratos` (`eid_bachillerato`),
  CONSTRAINT `fkgrado` FOREIGN KEY (`efk_grado`) REFERENCES `tgrado` (`eid_grado`),
  CONSTRAINT `fkseccion` FOREIGN KEY (`efk_seccion`) REFERENCES `tsecciones` (`eid_seccion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of topciones
-- ----------------------------
INSERT INTO `topciones` VALUES ('1', '39', '1', '1', '1', '1', '11', '1');
INSERT INTO `topciones` VALUES ('2', '41', '1', '2', '1', '1', '9', '1');
INSERT INTO `topciones` VALUES ('3', '19', '2', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for tperiodos
-- ----------------------------
DROP TABLE IF EXISTS `tperiodos`;
CREATE TABLE `tperiodos` (
  `eid_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `enum` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`eid_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tperiodos
-- ----------------------------
INSERT INTO `tperiodos` VALUES ('1', '1', '0');
INSERT INTO `tperiodos` VALUES ('2', '2', '0');
INSERT INTO `tperiodos` VALUES ('3', '3', '0');
INSERT INTO `tperiodos` VALUES ('4', '4', '1');

-- ----------------------------
-- Table structure for tpermisos
-- ----------------------------
DROP TABLE IF EXISTS `tpermisos`;
CREATE TABLE `tpermisos` (
  `eid_permisos` int(11) NOT NULL AUTO_INCREMENT,
  `ep_inscripciones` int(11) NOT NULL,
  `ep_estadisticas` int(11) NOT NULL,
  `efk_idusuario` int(11) NOT NULL,
  PRIMARY KEY (`eid_permisos`),
  KEY `fkusuario` (`efk_idusuario`),
  CONSTRAINT `fkusuario` FOREIGN KEY (`efk_idusuario`) REFERENCES `tusuarios` (`eid_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tpermisos
-- ----------------------------
INSERT INTO `tpermisos` VALUES ('1', '1', '1', '14');
INSERT INTO `tpermisos` VALUES ('2', '0', '1', '1');
INSERT INTO `tpermisos` VALUES ('3', '1', '0', '16');
INSERT INTO `tpermisos` VALUES ('4', '1', '1', '17');

-- ----------------------------
-- Table structure for tpersonal
-- ----------------------------
DROP TABLE IF EXISTS `tpersonal`;
CREATE TABLE `tpersonal` (
  `eid_personal` int(11) NOT NULL AUTO_INCREMENT,
  `cdui` varchar(10) NOT NULL,
  `cnombre` varchar(50) NOT NULL,
  `capellido` varchar(50) NOT NULL,
  `ctelefono` varchar(10) NOT NULL,
  `ccorreo` varchar(200) NOT NULL,
  `cdireccion` varchar(200) NOT NULL,
  `ffechanacimiento` date NOT NULL,
  `iestado` int(11) NOT NULL,
  `isexo` int(11) NOT NULL,
  `efk_idcargo` int(11) NOT NULL,
  PRIMARY KEY (`eid_personal`),
  KEY `fkcargo` (`efk_idcargo`),
  CONSTRAINT `fkcargo` FOREIGN KEY (`efk_idcargo`) REFERENCES `tcargos` (`eid_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tpersonal
-- ----------------------------
INSERT INTO `tpersonal` VALUES ('1', '05547552-8', 'Maria Jose', 'Hernandez Alvarenga', '12345678', 'fernan@hotmil.com', 'San Vicente, Barrio El Santuario , casa 2', '2000-08-04', '1', '2', '1');
INSERT INTO `tpersonal` VALUES ('4', '05547552-9', 'Walter Alexander', 'Carcamo Rivas', '12345678', 'walter_alx@hotmail.com', 'San Cayetano , San Vicente , El Salvador', '2000-07-06', '1', '2', '3');
INSERT INTO `tpersonal` VALUES ('7', '12344555-5', 'Josue Benjamin', 'Hernandez Alfaro', '12345678', 'monterrosadelgado@gmail.com', 'San Rafael', '2018-09-14', '1', '2', '2');
INSERT INTO `tpersonal` VALUES ('8', '05547552-7', 'Jessica Alexandra', 'Rosales RodrÃ­guez', '12614143', 'jess@hotmail.com', 'San Vicente,San eEsteban Catarina, BÂ° Concepcion, casa#2 ', '2000-09-04', '0', '1', '1');
INSERT INTO `tpersonal` VALUES ('9', '12345678-9', 'Jessica Abigail', 'Rodriguez Rosales', '12345678', 'jessirosales2@gmail.com', 'San Vicente , Barrio El Calvario , casa 2', '2000-09-05', '1', '1', '3');
INSERT INTO `tpersonal` VALUES ('10', '23432434-2', 'Fernando JosuÃ©', 'Hernandez Arevalo', '71558042', 'fer.aravalo1997@gmail.com', 'Barrio El santuario, 3ra. calle ote. Pasaje Zelaya, Casa #2', '2000-10-01', '1', '2', '3');
INSERT INTO `tpersonal` VALUES ('11', '23434345-3', 'Kevin Alexander ', 'Jovel Arevalo', '73232343', 'kevinjovel9@gmail.com', 'Col Santa Fe San Sebastian', '2000-01-13', '1', '2', '3');
INSERT INTO `tpersonal` VALUES ('12', '13612547-1', 'Flor de Maria', 'Rodriguez Martinez', '72131654', 'florcitademariarodriguez72@gmail.com', 'San Vicente', '2000-10-02', '1', '1', '1');
INSERT INTO `tpersonal` VALUES ('13', '05540789-5', 'Luis Antonio', 'Rosales PeÃ±ate', '23937308', 'luisitopenate@gmail.com', 'San Vicente, Barrio Santuario casa #2', '2001-01-10', '1', '2', '3');

-- ----------------------------
-- Table structure for tpersonal_materia
-- ----------------------------
DROP TABLE IF EXISTS `tpersonal_materia`;
CREATE TABLE `tpersonal_materia` (
  `eid_pm` int(11) NOT NULL AUTO_INCREMENT,
  `efk_idpersonal` int(11) NOT NULL,
  `efk_idmateria` int(11) NOT NULL,
  PRIMARY KEY (`eid_pm`),
  KEY `fk_personal` (`efk_idpersonal`),
  KEY `fk_materia` (`efk_idmateria`),
  CONSTRAINT `fk_materia` FOREIGN KEY (`efk_idmateria`) REFERENCES `tmaterias` (`eid_materia`),
  CONSTRAINT `fk_personal` FOREIGN KEY (`efk_idpersonal`) REFERENCES `tpersonal` (`eid_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tpersonal_materia
-- ----------------------------
INSERT INTO `tpersonal_materia` VALUES ('1', '11', '1');
INSERT INTO `tpersonal_materia` VALUES ('2', '11', '2');
INSERT INTO `tpersonal_materia` VALUES ('3', '9', '3');
INSERT INTO `tpersonal_materia` VALUES ('4', '9', '4');
INSERT INTO `tpersonal_materia` VALUES ('5', '11', '5');
INSERT INTO `tpersonal_materia` VALUES ('6', '10', '6');
INSERT INTO `tpersonal_materia` VALUES ('7', '11', '7');
INSERT INTO `tpersonal_materia` VALUES ('8', '9', '8');
INSERT INTO `tpersonal_materia` VALUES ('9', '10', '9');
INSERT INTO `tpersonal_materia` VALUES ('10', '11', '10');
INSERT INTO `tpersonal_materia` VALUES ('11', '13', '11');
INSERT INTO `tpersonal_materia` VALUES ('12', '13', '12');

-- ----------------------------
-- Table structure for tsecciones
-- ----------------------------
DROP TABLE IF EXISTS `tsecciones`;
CREATE TABLE `tsecciones` (
  `eid_seccion` int(11) NOT NULL AUTO_INCREMENT,
  `cseccion` varchar(10) NOT NULL,
  PRIMARY KEY (`eid_seccion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tsecciones
-- ----------------------------
INSERT INTO `tsecciones` VALUES ('1', 'A');
INSERT INTO `tsecciones` VALUES ('2', 'B');
INSERT INTO `tsecciones` VALUES ('3', 'C');

-- ----------------------------
-- Table structure for ttipobachillerato
-- ----------------------------
DROP TABLE IF EXISTS `ttipobachillerato`;
CREATE TABLE `ttipobachillerato` (
  `eid_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `ctipo` varchar(50) NOT NULL,
  PRIMARY KEY (`eid_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ttipobachillerato
-- ----------------------------
INSERT INTO `ttipobachillerato` VALUES ('1', 'Tecnico');
INSERT INTO `ttipobachillerato` VALUES ('2', 'General');

-- ----------------------------
-- Table structure for tusuarios
-- ----------------------------
DROP TABLE IF EXISTS `tusuarios`;
CREATE TABLE `tusuarios` (
  `eid_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `cusuario` varchar(10) NOT NULL,
  `cpass` varchar(50) NOT NULL,
  `etipo` int(11) NOT NULL,
  `efk_personal` int(11) NOT NULL,
  PRIMARY KEY (`eid_usuario`),
  KEY `fkpersonal` (`efk_personal`),
  CONSTRAINT `fkpersonal` FOREIGN KEY (`efk_personal`) REFERENCES `tpersonal` (`eid_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tusuarios
-- ----------------------------
INSERT INTO `tusuarios` VALUES ('1', 'Fernando97', 'ODFNakxnUjRiRThoc3Q0NE5vT2R6Zz09', '0', '1');
INSERT INTO `tusuarios` VALUES ('2', 'carcamo2', 'bnR6VzNoTkxhbnlsbzVHMEl1cCtRUT09', '1', '4');
INSERT INTO `tusuarios` VALUES ('3', 'fercho', 'RzNnUUUxLzRWYWpsMWt5clV0RVFwZz09', '0', '10');
INSERT INTO `tusuarios` VALUES ('4', 'benja', 'SE54M1dqeFZEWEUrT3JtSnVuYVJtdz09', '1', '7');
INSERT INTO `tusuarios` VALUES ('13', 'Florcita', 'dDJhSWVKMFJlcGhtMlFHc2RDdTBXUT09', '1', '12');
INSERT INTO `tusuarios` VALUES ('14', 'Kevin777', 'U0FkUnd2STl4ZjlCZFVqRWZGY28wUT09', '0', '11');
INSERT INTO `tusuarios` VALUES ('16', 'jess55', 'YVBpbDdxb3dYSHp5RWRDS01KNTk2QT09', '0', '9');
INSERT INTO `tusuarios` VALUES ('17', 'luisito5', 'amhEcW1TdnY2TEpCZitIZVZtUlFlZz09', '0', '13');

-- ----------------------------
-- Table structure for unidad_medidas
-- ----------------------------
DROP TABLE IF EXISTS `unidad_medidas`;
CREATE TABLE `unidad_medidas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_unidad` varchar(255) NOT NULL,
  `estado` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of unidad_medidas
-- ----------------------------
INSERT INTO `unidad_medidas` VALUES ('1', 'Kilogramos', '1');
INSERT INTO `unidad_medidas` VALUES ('2', 'Litros', '1');
SET FOREIGN_KEY_CHECKS=1;
