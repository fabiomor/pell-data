-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pelldb
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sc_area`
--

DROP TABLE IF EXISTS `sc_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_area` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `sc_gml_Polygon_id` int unsigned NOT NULL COMMENT '(1-1)\nClass: Estensione\nLabel: META_SUP\nCode: 000202101\nDefinition: GU_CPSurface2D - Composite Surface 2D',
  `Extension` enum('01','02','95') NOT NULL COMMENT '(1-1)\nClass: tipo di estensione\nLabel: META_ES\nCode: 00020201\nDefinition: definisce la tipologia di estensione della porzione diterritorio considerata',
  `AreaID` varchar(100) NOT NULL COMMENT '(1-1)\nClass: nome/codice\nLabel: META_NC\nCode: 00020202\nDefinition: specifica il nome o il codice della porzione di territorioconsiderata (indicata nell''attributo META_ES (elementoExtension))',
  `Scale` enum('01','02','03','04','05','06','07','95') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sc_Area_sc_gml_Polygon1_idx` (`sc_gml_Polygon_id`),
  KEY `fk_sc_Area_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_area`
--

LOCK TABLES `sc_area` WRITE;
/*!40000 ALTER TABLE `sc_area` DISABLE KEYS */;
INSERT INTO `sc_area` VALUES (134,146,433,'95','Area Test','04');
/*!40000 ALTER TABLE `sc_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_censustechsheet`
--

DROP TABLE IF EXISTS `sc_censustechsheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_censustechsheet` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `SchedeType` varchar(45) DEFAULT NULL,
  `SchedeCurrent` varchar(45) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `submitted` timestamp NULL DEFAULT NULL,
  `is_hibernated` int NOT NULL DEFAULT '0',
  `bad_formed` int NOT NULL DEFAULT '0',
  `start_hibernation` int NOT NULL DEFAULT '365',
  `namespaces` varchar(100) DEFAULT 'gml,xsi,xlink',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_censustechsheet`
--

LOCK TABLES `sc_censustechsheet` WRITE;
/*!40000 ALTER TABLE `sc_censustechsheet` DISABLE KEYS */;
INSERT INTO `sc_censustechsheet` VALUES (146,'test_2020_02_02_001','01','true',1,NULL,0,0,365,'gml,xsi,xlink','2020-02-02 10:57:00','2020-02-02 14:03:55');
/*!40000 ALTER TABLE `sc_censustechsheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_city`
--

DROP TABLE IF EXISTS `sc_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_city` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `SC_PLSystemGeneralData_id` int unsigned NOT NULL COMMENT '(1-unbounded)\nClass: nome comune\nLabel: AN_IP_NOM\nCode: 07080102\nDefinition: Nome del Comune a cui si riferisce l''anagraficadell''illuminazione pubblica (l''elemento puo'' essere ripetuto perspecificare il nome in piu'' lingue)',
  `City` varchar(100) NOT NULL,
  `ln` enum('01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sc_City_SC_PLSystemGeneralData1_idx` (`SC_PLSystemGeneralData_id`),
  KEY `fk_sc_City_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_city`
--

LOCK TABLES `sc_city` WRITE;
/*!40000 ALTER TABLE `sc_city` DISABLE KEYS */;
INSERT INTO `sc_city` VALUES (178,146,128,'Cesano di Roma','10'),(179,146,128,'Cesano of Rome','08');
/*!40000 ALTER TABLE `sc_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_electricpanel`
--

DROP TABLE IF EXISTS `sc_electricpanel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_electricpanel` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `ElectricPanelID` varchar(50) NOT NULL COMMENT '(1-1)\nClass: id quadro elettrico\nLabel: QE_ID\nCode: 07080501\nDefinition: indica l''identificativo del quadro elettrico',
  `sc_POD_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sc_ElectricPanel_sc_POD1_idx` (`sc_POD_id`),
  KEY `fk_sc_ElectricPanel_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`),
  CONSTRAINT `fk_podid_electricalpanel_pod` FOREIGN KEY (`sc_POD_id`) REFERENCES `sc_pod` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_electricpanel`
--

LOCK TABLES `sc_electricpanel` WRITE;
/*!40000 ALTER TABLE `sc_electricpanel` DISABLE KEYS */;
INSERT INTO `sc_electricpanel` VALUES (456,146,'UVAXPANELID',366),(457,146,'QEID2',366),(458,146,'IT000000000ID2',367);
/*!40000 ALTER TABLE `sc_electricpanel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_electricpanelgeneraldata`
--

DROP TABLE IF EXISTS `sc_electricpanelgeneraldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_electricpanelgeneraldata` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `sc_ElectricPanel_id` int unsigned NOT NULL COMMENT '(1-1)\nClass: Quadro elettrico anagrafica\nLabel: QE_A\nCode: 070805\nDefinition: Il quadro elettrico rappresenta il punto dal quale partono lelinee di diramazione dell''alimentazione dell''impianto di illuminazionepubblica. Ad ogni quadro elettrico possono essere associate una o piùlinee di diramazione, a ciascuna delle quali può corrispondere uno o piùpunti luce',
  `sc_Metadata_id` int unsigned NOT NULL,
  `sc_gml_Point_id` int unsigned NOT NULL COMMENT '(1-1)\nClass: Posizione\nLabel: QE_A_POS\nCode: 070805101\nDefinition: corrisponde alla localizzazione geografica del quadroelettrico',
  `DetectionDate` date NOT NULL COMMENT '(1-1)\nClass: data del rilievo quadro elettrico\nLabel: QE_A_RIL\nCode: 07080503\nDefinition: indica la data in cui e'' stato effettuato il rilievodella situazione del quadro elettrico',
  `OnlyPublicLighitingFlag` enum('true','false') NOT NULL COMMENT '(1-1)\nClass: quadro misto\nLabel: QE_A_PR\nCode: 07080504\nDefinition: indica se al quadro elettrico afferiscono solodispositivi relativi all''illuminazione pubblica (true = solodispositivi illuminazione pubblica, false = quadromisto)',
  `ConstructionYear` int DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: anno di costruzione\nLabel: QE_A_COS\nCode: 07080505\nDefinition: indica l''anno (aaaa) di costruzione del quadroelettrico',
  `ConstructionYear_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `AccessibilityType` enum('01','02') NOT NULL COMMENT '(1-1)\nClass: tipologia accessibilita''\nLabel: QE_A_TIP\nCode: 07080506\nDefinition: indica la tipologia e l''accessibilita'' del quadroelettrico',
  `KeyLockFlag` enum('true','false') DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: chiusura a chiave dell''involucro\nLabel: QE_A_CHIU\nCode: 07080507\nDefinition: Indica se l''involucro e'' dotato di chiusura a chiave(true) o no (false)',
  `KeyLockFlag_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `PreservationStatus` enum('01','02','03','04') NOT NULL COMMENT '(1-1)\nClass: stato di conservazione\nLabel: QE_A_CONS\nCode: 07080508\nDefinition: indica lo stato di conservazione del quadroelettrico',
  `BoxPreservationStatus` enum('01','02','03','91','93','94','95') DEFAULT NULL COMMENT '(0-1)\nClass: stato di conservazione armadio\nLabel: QE_A_ARM\nCode: 07080509\nDefinition: indica lo stato di conservazionedell''armadio',
  `ElectricPanelInstalledPower` double NOT NULL COMMENT '(1-1)\nClass: potenza installata\nLabel: QE_A_KW\nCode: 07080510\nDefinition: indica la potenza [kW]installata a livello di quadro,intesa al lordo delle perdine ausiliarie e delle utenze sotteseall''impianto',
  `OperatingStatus` enum('01','02','0201','0202','0203') NOT NULL COMMENT '(1-1)\nClass: stato funzionamento\nLabel: QE_A_STAT\nCode: 07080511\nDefinition: indica lo stato di funzionamento del quadroelettrico',
  `ElectricSystemStatus` enum('01','02','03','04','05') NOT NULL COMMENT '(1-1)\nClass: stato dell''impianto elettrico da riqualificare\nLabel: QE_A_ST_IM\nCode: 07080512\nDefinition: linee da riqualificare in m lineari sultotale',
  `NumberOfConnectedLightSpots` int NOT NULL COMMENT '(1-1)\nClass: numero totale di punti luce\nLabel: QE_A_NAPT\nCode: 07080513\nDefinition: Numero di punti luce (apparecchi) associati al quadroelettrico',
  `NumberOfOwnedLightSpots` int NOT NULL COMMENT '(1-1)\nClass: numero di punti luce di proprieta''\nLabel: QE_A_NAPP\nCode: 07080514\nDefinition: Numero di punti luce (apparecchi) di proprieta''associati al quadro elettrico',
  `NumberOfNotOwnedLightSpots` int NOT NULL COMMENT '(1-1)\nClass: numero di punti luce non di proprieta''\nLabel: QE_A_NAPNP\nCode: 07080515\nDefinition: Numero di punti luce (apparecchi) non di proprieta''associati al quadro elettrico',
  `ExogenousElectricalLoads` enum('01','0101','0102','02') NOT NULL COMMENT '(1-1)\nClass: carichi esogeni elettrici\nLabel: QE_A_CAR_E\nCode: 07080516',
  `SupportRedevelopingNeeds` enum('01','02','03','04','05') NOT NULL COMMENT '(1-1)\nClass: sostegni da riqualificare\nLabel: QE_A_ST_RQ\nCode: 07080517',
  `NumberOfOverheadLines` int NOT NULL COMMENT '(1-1)\nClass: numero linee aeree\nLabel: QE_A_N_LA\nCode: 07080518\nDefinition: indica il numero di linee aeree associate al quadroelettrico',
  `PercentageOfOverheadLines` int NOT NULL COMMENT '(1-1)\nClass: percentuale di linee aeree sul totale delle linee\nLabel: QE_A_PE_LA\nCode: 07080519',
  `NumberOfSupports` int NOT NULL COMMENT '(1-1)\nClass: numero sostegni\nLabel: QE_A_N_SO\nCode: 07080520\nDefinition: numero sostegni associati al quadroelettrico',
  PRIMARY KEY (`id`),
  KEY `fk_sc_ElectricPanelGeneralData_sc_ElectricPanel1_idx` (`sc_ElectricPanel_id`),
  KEY `fk_sc_ElectricPanelGeneralData_sc_gml_Point1_idx` (`sc_gml_Point_id`),
  KEY `fk_sc_ElectricPanelGeneralData_sc_Metadata1_idx` (`sc_Metadata_id`),
  KEY `fk_sc_ElectricPanelGeneralData_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`),
  CONSTRAINT `fk_epid_epgeneral_ep` FOREIGN KEY (`sc_ElectricPanel_id`) REFERENCES `sc_electricpanel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_electricpanelgeneraldata`
--

LOCK TABLES `sc_electricpanelgeneraldata` WRITE;
/*!40000 ALTER TABLE `sc_electricpanelgeneraldata` DISABLE KEYS */;
INSERT INTO `sc_electricpanelgeneraldata` VALUES (456,146,456,50627,15778,'2019-03-22','false',1970,0,'02','true',0,'04','02',0.2,'02','03',3,2,1,'0102','02',1,50,3),(457,146,457,50631,15779,'2019-06-21','false',NULL,0,'01',NULL,0,'03',NULL,1,'01','01',4,2,2,'01','01',7,2,4),(458,146,458,50635,15780,'2019-06-21','false',NULL,0,'01',NULL,0,'04',NULL,1,'01','01',3,2,1,'01','01',7,2,3);
/*!40000 ALTER TABLE `sc_electricpanelgeneraldata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_electricpanelmaintenance`
--

DROP TABLE IF EXISTS `sc_electricpanelmaintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_electricpanelmaintenance` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `sc_ElectricPanel_id` int unsigned NOT NULL COMMENT '(1-1)\nClass: Quadro elettrico manutenzione\nLabel: QE_M\nCode: 070808\nDefinition: Specifica i dati relativi alla manutenzione del quadroelettrico. Classe priva di componente spaziale, essendo relazionata aglioggetti contenuti nella Classe QE_A - 070805',
  `sc_Metadata_id` int unsigned NOT NULL,
  `MaintenanceYear` int DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: anno di riferimento manutenzione\nLabel: QE_M_DAT\nCode: 07080802\nDefinition: indica l''anno di riferimento sulla base del quale sonocompilati i campi relativi alla manutenzione (annoprecedente)',
  `MaintenanceYear_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `ItemOfExpenditure` varchar(40) DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: voce di spesa\nLabel: QE_M_SP\nCode: 07080803\nDefinition: indica la voce di spesa all''interno della quale ricadel''attivita'' che si sta procedendo a rendicontare',
  `ItemOfExpenditure_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `ServiceContractType` enum('01','02','95') NOT NULL COMMENT '(1-1)\nClass: tipologia di contratto\nLabel: QE_M_AF\nCode: 07080804\nDefinition: indica la modalita'' di affidamento con la quale si e''aggiudicata all''affidatario l''attivita'' che si sta procedendo arendicontare',
  `ServiceOperatorName` varchar(40) NOT NULL COMMENT '(1-1)\nClass: denominazione affidatario\nLabel: QE_M_DAF\nCode: 07080805\nDefinition: indica il nome della societa'' alla quale il Comune haaffidato l''esecuzione dell''attivita'' che si sta procedendo arendicontare',
  `TaskDescription` varchar(40) DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: attivita''\nLabel: QE_M_AT\nCode: 07080806\nDefinition: indica la descrizione dei lavori che sono eseguitidall''affidatario in virtù dell''attivita'' che si sta procedendo arendicontare',
  `TaskDescription_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `PaymentMode` enum('01','02','91','93','94') DEFAULT NULL COMMENT '(0-1)\nClass: remunerazione\nLabel: QE_M_REM\nCode: 07080807\nDefinition: indica la modalita'' di pagamento con la quale il Comuneprovvede a saldare l''aggiudicatario per l''attivita''realizzata',
  `MaterialProcurementInclusionFlag` enum('true','false') DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: approvvigionamento materiali\nLabel: QE_M_APM\nCode: 07080808\nDefinition: indica se, in sede contrattuale il Comune el''affidatario hanno stabilito che i materiali utilizzati per losvolgimento del lavoro che si sta procedendo a rendicontare sonocompresi nel corrispettivo riconosciuto dall''amministrazione(true) oppure no (false)',
  `MaterialProcurementInclusionFlag_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `PreviousYearOrdinaryMaintenanceAmount` double DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: importo manutenzione ordinaria annua per impianti diproprieta'' laddove disponibile (anno precedente)\nLabel: QE_M_IMO\nCode: 07080809\nDefinition: importo manutenzione ordinaria annua per impianti diproprietà laddove disponibile (anno precedente). €/anno - ivaesclusa',
  `PreviousYearOrdinaryMaintenanceAmount_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `PreviousYearOtherOrdinaryMaintenanceAmount` double DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: importo manutenzione ordinaria annua per impianti non diproprieta'' (anno precedente)\nLabel: QE_M_IONPP\nCode: 07080810\nDefinition: importo manutenzione ordinaria annua per impianti non diproprieta'' laddove disponibile (annoprecedente). €/anno - ivaesclusa',
  `PreviousYearOtherOrdinaryMaintenanceAmount_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `PreviousYearExtraordinaryMaintenanceAmount` double DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: importo manutenzione straordinaria annua (annoprecedente)\nLabel: QE_M_IMS\nCode: 07080811\nDefinition: specifica i dati relativi alla manutenzione a partiredal quadro elettrico compreso (QE, punto luce, elementi statici,etc..). €/anno - iva esclusa',
  `PreviousYearExtraordinaryMaintenanceAmount_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `CurrentYearOrdinaryMaintenanceAmount` double DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: importo manutenzione ordinaria annua per impianti diproprieta'' (anno attuale)\nLabel: QE_M_IOPA\nCode: 07080812\nDefinition: importo manutenzione ordinaria annua per impianti diproprieta'' laddove disponibile (anno attuale). €/anno - ivaesclusa',
  `CurrentYearOrdinaryMaintenanceAmount_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `CurrentYearOtherOrdinaryMaintenanceAmount` double DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: importo manutenzione ordinaria annua per impianti non diproprieta'' (anno attuale)\nLabel: QE_M_IONPA\nCode: 07080813\nDefinition: importo manutenzione ordinaria annua per impianti non diproprieta'' laddove disponibile (anno attuale). €/anno - ivaesclusa',
  `CurrentYearOtherOrdinaryMaintenanceAmount_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `CurrentYearExtraordinaryMaintenanceAmount` double DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: importo manutenzione straordinaria annua (annoattuale)\nLabel: QE_M_ISA\nCode: 07080814\nDefinition: importo manutenzione straordinaria annua laddovedisponibile (anno attuale). €/anno - iva esclusa',
  `CurrentYearExtraordinaryMaintenanceAmount_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_sc_ElectricPanelMaintenance_sc_ElectricPanel1_idx` (`sc_ElectricPanel_id`),
  KEY `fk_sc_ElectricPanelMaintenance_sc_Metadata1_idx` (`sc_Metadata_id`),
  KEY `fk_sc_ElectricPanelMaintenance_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`),
  CONSTRAINT `fk_epid_epMaintenance_ep` FOREIGN KEY (`sc_ElectricPanel_id`) REFERENCES `sc_electricpanel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_electricpanelmaintenance`
--

LOCK TABLES `sc_electricpanelmaintenance` WRITE;
/*!40000 ALTER TABLE `sc_electricpanelmaintenance` DISABLE KEYS */;
INSERT INTO `sc_electricpanelmaintenance` VALUES (456,146,456,50630,1990,0,NULL,1,'02','Pippo 4',NULL,1,'02',NULL,1,15000,0,5000,0,4000,0,8000,0,2000,0,3000,0),(457,146,457,50634,NULL,0,NULL,0,'01','Pluto',NULL,0,NULL,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0),(458,146,458,50638,NULL,0,NULL,0,'01','Pluto',NULL,0,NULL,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `sc_electricpanelmaintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_electricpaneloperatingdata`
--

DROP TABLE IF EXISTS `sc_electricpaneloperatingdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_electricpaneloperatingdata` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `sc_ElectricPanel_id` int unsigned NOT NULL COMMENT '(1-1)\nClass: Dati funzionamento e gestione del quadro elettrico\nLabel: QE_FG\nCode: 070807\nDefinition: Specifica i dati di funzionamento e gestione del quadroelettrico. Classe priva di componente spaziale, essendo relazionata aglioggetti contenuti nella Classe QE_A - 070805',
  `sc_Metadata_id` int unsigned NOT NULL,
  `PowerOnMeans` enum('01','02','03','04','05') NOT NULL COMMENT '(1-1)\nClass: tipo di accensione\nLabel: QE_FG_ACC\nCode: 07080702\nDefinition: indica la modalita'' di accensione/spegnimentodell''impianto',
  `NumberOfOperatingHours` int NOT NULL COMMENT '(1-1)\nClass: ore di accensione dell''impianto\nLabel: QE_FG_ORE\nCode: 07080703\nDefinition: indica il numero di ore annue di funzionamentodell''impianto (ore/anno)',
  `PowerOnPartializationFlag` enum('true','false') NOT NULL COMMENT '(1-1)\nClass: parzializzazione accensione tutta notte – mezza notte\nLabel: QE_FG_PAR\nCode: 07080704\nDefinition: Indica se l''accesione e'' mezza notte (true) o tuttanotte (false)',
  `NumberOfPartialOperatingHours` double DEFAULT NULL COMMENT '(1-1) [nillable]\nClass: durata accensione parzializzata\nLabel: QE_FG_PARD\nCode: 07080705\nDefinition: indica il numero di ore annue di funzionamentodell''impianto in modalita'' parzializzata (ore/anno). Nel caso diaccensione non parzializzata deve essere utilizzato il valore diindeterminatezza',
  `LuminousFluxReducingFlag` enum('true','false') DEFAULT NULL COMMENT '(1-1) [nillable]\nClass: riduzione del flusso luminoso\nLabel: QE_FG_RID\nCode: 07080706\nDefinition: indica l''eventuale utilizzo di strategie di riduzionedel flusso luminoso; in questo caso valorizzare con true. Nelcaso di accensione parzializzata deve essere utilizzato ilvalore di indeterminatezza; in tutti gli altri casi valorizzarecon false',
  `NumberOfReducedFluxOperatingHours` double DEFAULT NULL COMMENT '(1-1) [nillable]\nClass: durata di riduzione del flusso luminoso\nLabel: QE_FG_RIDD\nCode: 07080707\nDefinition: indica il numero di ore annue di funzionamentodell''impianto con riduzione del flusso luminoso (ore/anno). Nelcaso di non riduzione del flusso luminoso deve essere utilizzatoil valore di indeterminatezza',
  `ReductionRate` int DEFAULT NULL COMMENT '(1-1) [nillable]\nClass: valore medio di riduzione del flusso luminoso\nLabel: QE_FG_RIDP\nCode: 07080708\nDefinition: indica la percentuale media di riduzione del flussoluminoso; il valore deve essere compreso tra 0 e 100 [%]. Nelcaso di non riduzione del flusso luminoso deve essere utilizzatoil valore di indeterminatezza',
  `LightFluxRegulationType` enum('01','02','91','93','94') NOT NULL COMMENT '(1-1)\nClass: tipo di regolazione del flusso luminoso\nLabel: QE_FG_REGF\nCode: 07080709\nDefinition: indica la modalita'' in cui e'' effettuata la regolazionedel flusso luminoso. Nel caso di non riduzione del flussoluminoso deve essere utilizzato il valore diindeterminatezza',
  `PowerReductionRate` int DEFAULT NULL COMMENT '(1-1) [nillable]\nClass: percentuale di riduzione della potenza\nLabel: QE_FG_POW\nCode: 0708070x\nDefinition: indica la percentuale di riduzione della potenza di unimpianto con parzializzazione dell''accensione tutta notte mezzanotte [%]',
  `PowerAverageReductionRate` int DEFAULT NULL COMMENT '(1-1) [nillable]\nClass: percentuale di riduzione media della potenza\nLabel: QE_FG_RIMP\nCode: 0708070x\nDefinition: indica la percentuale di riduzione media della potenzadi un impianto con riduzione del flusso luminoso[%]',
  `RemoteAccessFlag` enum('true','false') NOT NULL COMMENT '(1-1)\nClass: sistema di telegestione (gestione real-time)\nLabel: QE_FG_TELG\nCode: 07080710\nDefinition: indica se l''impianto e'' gestito da remoto (true) o no(false)',
  `RemoteControl` enum('01','0101','0102','0103','02') NOT NULL COMMENT '(1-1)\nClass: telecontrollo su quadro elettrico\nLabel: QE_FG_TELQ\nCode: 07080711\nDefinition: indica se e'' possibile modificare parametri difunzionamento dell''impianto e gestirne l''operativita'' funzionaleda un centro di gestione remoto',
  `RemoteDiagnosisFlag` enum('true','false') NOT NULL COMMENT '(1-1)\nClass: sistema di telediagnosi remota\nLabel: QE_FG_TELR\nCode: 07080712\nDefinition: indica se e'' possibile gestire allarmi ed effettuareanalisi e diagnosi energetiche da un centro di gestione remoto(true) o no (false)',
  `MeterID` varchar(50) DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: id meter\nLabel: QE_FG_IDME\nCode: 07080713\nDefinition: identificativo del misuratore installato per la raccoltadei dati elettrici ed energetici. Se presente richiede ilpopolamento dell''attributo classe del meter',
  `MeterID_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `MeterClass` enum('01','02','03','91','93','94') DEFAULT NULL COMMENT '(0-1)\nClass: classe del meter\nLabel: QE_FG_CLME\nCode: 07080714',
  PRIMARY KEY (`id`),
  KEY `fk_sc_ElectricPanelOperatingData_sc_ElectricPanel1_idx` (`sc_ElectricPanel_id`),
  KEY `fk_sc_ElectricPanelOperatingData_sc_Metadata1_idx` (`sc_Metadata_id`),
  KEY `fk_sc_ElectricPanelOperatingData_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`),
  CONSTRAINT `fk_epid_epOperating_ep` FOREIGN KEY (`sc_ElectricPanel_id`) REFERENCES `sc_electricpanel` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_electricpaneloperatingdata`
--

LOCK TABLES `sc_electricpaneloperatingdata` WRITE;
/*!40000 ALTER TABLE `sc_electricpaneloperatingdata` DISABLE KEYS */;
INSERT INTO `sc_electricpaneloperatingdata` VALUES (456,146,456,50629,'04',4000,'true',2500,NULL,NULL,NULL,'02',30,NULL,'false','0102','true',NULL,1,NULL),(457,146,457,50633,'01',4250,'false',NULL,'true',2000,47,'01',NULL,20,'false','01','false',NULL,0,NULL),(458,146,458,50637,'01',4000,'false',NULL,'true',2500,40,'01',NULL,25,'false','01','false',NULL,0,NULL);
/*!40000 ALTER TABLE `sc_electricpaneloperatingdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_electricpaneltechnicaldata`
--

DROP TABLE IF EXISTS `sc_electricpaneltechnicaldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_electricpaneltechnicaldata` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `sc_ElectricPanel_id` int unsigned NOT NULL COMMENT '(1-1)\nClass: Dati tecnici quadro elettrico\nLabel: QE_DT\nCode: 070806\nDefinition: Specifica i dati tecnici relativi al quadro elettrico. Classepriva di componente spaziale, essendo relazionata agli oggetti contenutinella Classe QE_A - 070805',
  `sc_Metadata_id` int unsigned NOT NULL,
  `ElectricPhases` enum('01','02','03') NOT NULL COMMENT '(1-1)\nClass: numero fasi\nLabel: QE_DT_FASI\nCode: 07080602\nDefinition: indica il numero di fasi del quadroelettrico',
  `NumberOfOutgoingCircuits` int NOT NULL COMMENT '(1-1)\nClass: numero circuiti in uscita dal quadro elettrico\nLabel: QE_DT_CIR\nCode: 07080603',
  `ProtectionSystemType` enum('01','02','03','04','95') NOT NULL COMMENT '(1-1)\nClass: tipo di protezione generale\nLabel: QE_DT_PROT\nCode: 07080604\nDefinition: indica il sistema di protezione del quadroelettrico',
  `NominalVoltage` int NOT NULL COMMENT '(1-1)\nClass: tensione nominale del quadro elettrico\nLabel: QE_DT_TEN\nCode: 07080605\nDefinition: [V]',
  `NumberOfElectricSubPanels` int DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: numero sottoquadri\nLabel: QE_DT_NSQ\nCode: 07080606',
  `NumberOfElectricSubPanels_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `Ipei2013` enum('01','02','03','04','05','06','07','08','91','93','94') NOT NULL COMMENT '(1-1)\nClass: indice ipei (cam 2013)\nLabel: QE_DT_IP13\nCode: 07080607\nDefinition: indice parametrizzato di efficienza dell''impianto diilluminazione pubblica',
  `Ipei2018` enum('01','02','03','04','05','06','07','08','09','10','91','93','94') NOT NULL COMMENT '(1-1)\nClass: indice ipei* (cam 2018)\nLabel: QE_DT_IP18\nCode: 07080608\nDefinition: indice parametrizzato di efficienza dell''impianto diilluminazione pubblica',
  `LineType` varchar(50) NOT NULL COMMENT '(1-1)\nClass: tipo di linea\nLabel: QE_DT_TY_L\nCode: 07080609\nDefinition: indica il tipo di linea quale ad esempio interrata,tesata, aerea, graffata a muro, etc.',
  `TransformerFlag` enum('true','false') DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: presenza di trasformatore di tensione in cabinaelettrica\nLabel: QE_DT_TRAS\nCode: 07080610\nDefinition: true = trasformatore presente; false = trasformatore nonpresente',
  `TransformerFlag_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `TransformerPower` double DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: potenza del trasformatore\nLabel: QE_DT_PW_T\nCode: 07080611\nDefinition: [kV*A]',
  `TransformerPower_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `SystemType` enum('01','02','91','93','94') DEFAULT NULL COMMENT '(0-1)\nClass: tipo di impianto\nLabel: QE_DT_TY_I\nCode: 07080612',
  `MediumVoltageSystemFlag` enum('true','false') DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: presenza impianto in media tensione\nLabel: QE_DT_MT\nCode: 07080613',
  `MediumVoltageSystemFlag_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `SpdFlag` enum('true','false') DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: presenza di spd\nLabel: QE_DT_SPD\nCode: 07080614\nDefinition: da popolare solo in presenza di LED; true = spdpresente; false = spd non presente',
  `SpdFlag_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `GroundingSystemFlag` enum('true','false') DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: presenza di impianto di terra\nLabel: QE_DT_TER\nCode: 07080615\nDefinition: true = impianto di terra presente; false = impianto diterra non presente',
  `GroundingSystemFlag_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_sc_ElectricPanelTechnicalData_sc_ElectricPanel1_idx` (`sc_ElectricPanel_id`),
  KEY `fk_sc_ElectricPanelTechnicalData_sc_Metadata1_idx` (`sc_Metadata_id`),
  KEY `fk_sc_ElectricPanelTechnicalData_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`),
  CONSTRAINT `fk_epid_eptechdata_ep` FOREIGN KEY (`sc_ElectricPanel_id`) REFERENCES `sc_electricpanel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_electricpaneltechnicaldata`
--

LOCK TABLES `sc_electricpaneltechnicaldata` WRITE;
/*!40000 ALTER TABLE `sc_electricpaneltechnicaldata` DISABLE KEYS */;
INSERT INTO `sc_electricpaneltechnicaldata` VALUES (456,146,456,50628,'03',2,'04',230,2,0,'94','94','aerea','false',0,NULL,0,'02','false',0,'false',0,'false',0),(457,146,457,50632,'01',2,'01',90,NULL,0,'01','94','aerea',NULL,0,NULL,0,NULL,NULL,0,NULL,0,NULL,0),(458,146,458,50636,'01',2,'01',90,NULL,0,'01','94','aerea',NULL,0,NULL,0,NULL,NULL,0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `sc_electricpaneltechnicaldata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_gml_multipoint`
--

DROP TABLE IF EXISTS `sc_gml_multipoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_gml_multipoint` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `gml_id` varchar(45) DEFAULT '',
  `gml_srsName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sc_gml_MultiPoint_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2770 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_gml_multipoint`
--

LOCK TABLES `sc_gml_multipoint` WRITE;
/*!40000 ALTER TABLE `sc_gml_multipoint` DISABLE KEYS */;
INSERT INTO `sc_gml_multipoint` VALUES (2762,146,'MPT01','http://www.opengis.net/def/crs/EPSG/0/4936'),(2763,146,'MP1','http://www.opengis.net/def/crs/EPSG/0/4936'),(2764,146,'MPT9','http://www.opengis.net/def/crs/EPSG/0/4936'),(2765,146,'MPT21','http://www.opengis.net/def/crs/EPSG/0/4936'),(2766,146,'MPT2','http://www.opengis.net/def/crs/EPSG/0/4936'),(2767,146,'MPT8','http://www.opengis.net/def/crs/EPSG/0/4936'),(2768,146,'MPT3','http://www.opengis.net/def/crs/EPSG/0/4936'),(2769,146,'MPT4','http://www.opengis.net/def/crs/EPSG/0/4936');
/*!40000 ALTER TABLE `sc_gml_multipoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_gml_point`
--

DROP TABLE IF EXISTS `sc_gml_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_gml_point` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `gml_id` varchar(45) DEFAULT NULL COMMENT '[optional]\nIdentificatore univoco del punto.',
  `gml_srsDimension` enum('2','3') NOT NULL COMMENT '[required]\nDimensione delle coordinate (2 = x y; 3 = x y z)',
  `gml_srsName` varchar(45) NOT NULL COMMENT '[required]\nSistema di riferimento in cui sono espresse le coordinate (si raccomanda l''utilizzo del sistemahttp://www.opengis.net/def/crs/EPSG/0/4936)',
  `gml_pos` varchar(45) NOT NULL COMMENT '(1-1)\nCoordinate geografiche di un punto.',
  PRIMARY KEY (`id`),
  KEY `fk_sc_gml_Point_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15791 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_gml_point`
--

LOCK TABLES `sc_gml_point` WRITE;
/*!40000 ALTER TABLE `sc_gml_point` DISABLE KEYS */;
INSERT INTO `sc_gml_point` VALUES (15776,146,'PT01','2','http://www.opengis.net/def/crs/EPSG/0/4936','-30.7 134.1'),(15777,146,'PT0','2','http://www.opengis.net/def/crs/EPSG/0/4936','-30.7 134.1'),(15778,146,'PT05','2','http://www.opengis.net/def/crs/EPSG/0/4936','-30.7 134.5'),(15779,146,'SU99','2','http://www.opengis.net/def/crs/EPSG/0/4936)','44.57 11.372'),(15780,146,'SU100','2','http://www.opengis.net/def/crs/EPSG/0/4936)','44.57 11.372'),(15781,146,'PTLS1','2','http://www.opengis.net/def/crs/EPSG/0/4936','-30.7 134.2'),(15782,146,'PTLS2','2','http://www.opengis.net/def/crs/EPSG/0/4936)','12 12'),(15783,146,'PTLS3','2','http://www.opengis.net/def/crs/EPSG/0/4936)','12 12'),(15784,146,'PTLS4','2','http://www.opengis.net/def/crs/EPSG/0/4936)','12 12'),(15785,146,'PTLS5','2','http://www.opengis.net/def/crs/EPSG/0/4936)','44.565 11.353'),(15786,146,'PTLS6','2','http://www.opengis.net/def/crs/EPSG/0/4936)','44.565 11.353'),(15787,146,'PTLS7','2','http://www.opengis.net/def/crs/EPSG/0/4936)','44.565 11.353'),(15788,146,'PTLS8','2','http://www.opengis.net/def/crs/EPSG/0/4936)','44.565 11.353'),(15789,146,'PTLS9','2','http://www.opengis.net/def/crs/EPSG/0/4936)','44.565 11.353'),(15790,146,'PTLS10','2','http://www.opengis.net/def/crs/EPSG/0/4936)','44.565 11.353');
/*!40000 ALTER TABLE `sc_gml_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_gml_pointmember`
--

DROP TABLE IF EXISTS `sc_gml_pointmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_gml_pointmember` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `sc_gml_MultiPoint_id` int unsigned NOT NULL,
  `gml_href` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sc_gml_pointMember_sc_gml_MultiPoint1_idx` (`sc_gml_MultiPoint_id`),
  KEY `fk_sc_gml_pointMember_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11988 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_gml_pointmember`
--

LOCK TABLES `sc_gml_pointmember` WRITE;
/*!40000 ALTER TABLE `sc_gml_pointmember` DISABLE KEYS */;
INSERT INTO `sc_gml_pointmember` VALUES (11978,146,2762,'PTLS1'),(11979,146,2763,'PTLS5'),(11980,146,2764,'PTLS2'),(11981,146,2765,'PTLS6'),(11982,146,2766,'PTLS4'),(11983,146,2767,'PTLS8'),(11984,146,2767,'PTLS9'),(11985,146,2767,'PTLS10'),(11986,146,2768,'PTLS3'),(11987,146,2769,'PTLS7');
/*!40000 ALTER TABLE `sc_gml_pointmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_gml_polygon`
--

DROP TABLE IF EXISTS `sc_gml_polygon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_gml_polygon` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `gml_id` varchar(45) DEFAULT '',
  `gml_srsName` varchar(255) NOT NULL,
  `gml_posList` varchar(255) NOT NULL,
  `gml_srsDimension` enum('2','3') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sc_gml_Polygon_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=435 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_gml_polygon`
--

LOCK TABLES `sc_gml_polygon` WRITE;
/*!40000 ALTER TABLE `sc_gml_polygon` DISABLE KEYS */;
INSERT INTO `sc_gml_polygon` VALUES (433,146,'POL1','http://www.opengis.net/def/crs/EPSG/0/4936','45.256 -110.45 46.46 -109.48 43.84 -109.86 45.256 -110.45','2'),(434,146,'POL2','http://www.opengis.net/def/crs/EPSG/0/4936','45.256 -110.45 46.46 -109.48 43.84 -109.86 45.256 -110.45','2');
/*!40000 ALTER TABLE `sc_gml_polygon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_homogeneousarea`
--

DROP TABLE IF EXISTS `sc_homogeneousarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_homogeneousarea` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `sc_Metadata_id` int unsigned NOT NULL,
  `sc_gml_MultiPoint_id` int unsigned NOT NULL,
  `HomogeneousAreaID` varchar(50) NOT NULL,
  `DetectionDate` date NOT NULL,
  `AreaTypology` enum('01','02','03') NOT NULL,
  `OtherAreaTypology` varchar(50) DEFAULT NULL,
  `RoadClassificationCode` enum('01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','43','44','45','46','47','48','49','50','51','52') NOT NULL,
  `RoadBlanketType` enum('01','02','95') NOT NULL,
  `OtherRoadBlanketType` varchar(50) DEFAULT NULL,
  `GridLength` double DEFAULT NULL,
  `GridWidth` double DEFAULT NULL,
  `AreaSurface` double DEFAULT NULL,
  `AreaSurface_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `RoadwayType` enum('01','02','03','91','93','94') NOT NULL,
  `NumberOfFirstRoadwayLanes` int DEFAULT NULL,
  `NumberOfFirstRoadwayLanes_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `NumberOfSecondRoadwayLanes` int DEFAULT NULL,
  `NumberOfSecondRoadwayLanes_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `Footpath` enum('01','02','03','91','93','94') DEFAULT NULL,
  `FootpathWidth` double DEFAULT NULL,
  `FootpathWidth_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `RoadLightSpotAllocation` enum('01','0101','0102','0103','02','0201','0202','0203','0204','0205','03','0301','0302','0303','0304','0305','0306','0307','0308','91','93','94') NOT NULL,
  `OtherRoadLightSpotAllocation` varchar(50) DEFAULT NULL,
  `OtherRoadLightSpotAllocation_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `OtherLightSpotAllocation` varchar(50) DEFAULT NULL,
  `OtherLightSpotAllocation_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `DistanceBetweenLightSpots` double NOT NULL,
  `NumberOfSupports` int NOT NULL,
  `NumberOfLightSpots` int NOT NULL,
  `RoadCategoryCode` enum('01','02','03','04','05','06','91','93','94') DEFAULT NULL,
  `OtherFootpathWidth` double DEFAULT NULL,
  `OtherFootpathWidth_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `IlluminanceLevelValue` double DEFAULT NULL,
  `LuminanceValue` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sc_HomogeneousArea_sc_gml_MultiPoint1_idx` (`sc_gml_MultiPoint_id`),
  KEY `fk_sc_HomogeneousArea_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`),
  KEY `fk_sc_HomogeneousArea_sc_Metadata1_idx` (`sc_Metadata_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2766 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_homogeneousarea`
--

LOCK TABLES `sc_homogeneousarea` WRITE;
/*!40000 ALTER TABLE `sc_homogeneousarea` DISABLE KEYS */;
INSERT INTO `sc_homogeneousarea` VALUES (2758,146,50615,2762,'via roma','2019-04-23','01',NULL,'34','02',NULL,35,8,NULL,1,'02',1,0,1,0,'02',2,0,'0101',NULL,1,NULL,1,15,1,1,'06',NULL,0,5,NULL),(2759,146,50616,2763,'via roma 2','2019-04-23','01',NULL,'34','02',NULL,35,8,NULL,0,'02',1,0,1,0,'02',2,0,'0101',NULL,0,NULL,1,15,1,1,'06',NULL,0,5,NULL),(2760,146,50617,2764,'via firenze','2019-04-23','01',NULL,'34','02',NULL,35,8,NULL,0,'02',1,0,1,0,'02',2,0,'0101',NULL,0,NULL,1,15,1,1,'06',NULL,0,5,NULL),(2761,146,50618,2765,'via firenze 2','2019-04-23','01',NULL,'34','02',NULL,35,8,NULL,0,'02',1,0,1,0,'02',2,0,'0101',NULL,0,NULL,1,15,1,1,'06',NULL,0,5,NULL),(2762,146,50619,2766,'via padova','2019-04-23','01',NULL,'34','02',NULL,35,8,NULL,0,'02',1,0,1,0,'02',2,0,'0101',NULL,1,NULL,1,15,1,1,'06',NULL,0,5,NULL),(2763,146,50620,2767,'via padova 2','2019-04-23','01',NULL,'34','02',NULL,35,8,NULL,0,'02',1,0,1,0,'02',2,0,'0101',NULL,0,NULL,1,15,3,3,'06',NULL,0,5,NULL),(2764,146,50621,2768,'via genova','2019-04-23','03',NULL,'34','02',NULL,1,1,560,0,'91',1,0,NULL,1,'02',2,0,'94',NULL,1,'alternato',0,15,1,1,'06',NULL,0,5,NULL),(2765,146,50622,2769,'via genova 2','2019-04-23','02',NULL,'34','02',NULL,1,1,560,0,'93',1,0,NULL,0,'02',2,0,'94',NULL,0,'alternato',0,15,1,1,'06',NULL,0,5,NULL);
/*!40000 ALTER TABLE `sc_homogeneousarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_homogeneousareaext`
--

DROP TABLE IF EXISTS `sc_homogeneousareaext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_homogeneousareaext` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `sc_HomogeneousArea_id` int unsigned NOT NULL,
  `sc_gml_Polygon_id` int unsigned DEFAULT NULL,
  `LightedAreaID` varchar(50) NOT NULL,
  `LightedAreaName` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sc_HomogeneousAreaExt_sc_HomogeneousArea1_idx` (`sc_HomogeneousArea_id`),
  KEY `fk_sc_HomogeneousAreaExt_sc_gml_Polygon1_idx` (`sc_gml_Polygon_id`),
  KEY `fk_sc_HomogeneousAreaExt_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_homogeneousareaext`
--

LOCK TABLES `sc_homogeneousareaext` WRITE;
/*!40000 ALTER TABLE `sc_homogeneousareaext` DISABLE KEYS */;
/*!40000 ALTER TABLE `sc_homogeneousareaext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_lightsource`
--

DROP TABLE IF EXISTS `sc_lightsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_lightsource` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `sc_LightSpotDevice_id` int unsigned NOT NULL,
  `sc_Metadata_id` int unsigned NOT NULL,
  `LightSourceID` varchar(50) NOT NULL COMMENT '(1-1)\nClass: id sorgente luminosa\nLabel: PL_SL_ID\nCode: 07081101',
  `LightSourceType` enum('01','02','03','04','05','06','07','08','09','95') NOT NULL COMMENT '(1-1)\nClass: tipologia sorgente luminosa\nLabel: PL_SL_TY\nCode: 07081102\nDefinition: indica la tipologia di lampada o modulo LED',
  `NominalPower` double NOT NULL COMMENT '(1-1)\nClass: potenza caratteristica della sorgente luminosa (lampada omodulo provvisto di attacco - intercambiabile)\nLabel: PL_SL_POW\nCode: 07081103\nDefinition: per potenza caratteristica si intende quella "rated"come indicato nelle norme di armonizzazione dei Regolamenti diEcodesign [W]',
  `NominalLuminousFlux` double NOT NULL COMMENT '(1-1)\nClass: flusso luminoso caratteristico della sorgente luminosa(lampada o modulo provvisto di attacco –intercambiabile)\nLabel: PL_SL_FLU\nCode: 07081104',
  `LightSourceBrand` varchar(50) DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: marca sorgente luminosa\nLabel: PL_SL_MAR\nCode: 07081105',
  `LightSourceBrand_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `LightSourceModel` varchar(50) DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: modello sorgente luminosa\nLabel: PL_SL_MOD\nCode: 07081106',
  `LightSourceModel_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `CCT` double DEFAULT NULL,
  `CCT_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_sc_LightSource_sc_Metadata1_idx` (`sc_Metadata_id`),
  KEY `fk_sc_LightSource_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`),
  KEY `fk_sc_LightSource_sc_LightSpotDevice1_idx` (`sc_LightSpotDevice_id`),
  CONSTRAINT `fk_lsID_lightSource_lightSpotDevice` FOREIGN KEY (`sc_LightSpotDevice_id`) REFERENCES `sc_lightspotdevice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_lightsource`
--

LOCK TABLES `sc_lightsource` WRITE;
/*!40000 ALTER TABLE `sc_lightsource` DISABLE KEYS */;
INSERT INTO `sc_lightsource` VALUES (15114,146,15101,50641,'SORG01','09',50,5000,'Pluto',0,'Topolino',0,NULL,0),(15115,146,15102,50644,'SORG02','05',70,5200,NULL,0,NULL,0,NULL,0),(15116,146,15103,50647,'SORG03','07',90,5500,NULL,0,NULL,0,NULL,0),(15117,146,15104,50650,'SORG04','01',250,5100,NULL,0,NULL,0,NULL,0),(15118,146,15105,50653,'SORG05','09',50,5000,NULL,0,NULL,0,NULL,0),(15119,146,15106,50656,'SORG06','05',70,5200,NULL,0,NULL,0,NULL,0),(15120,146,15107,50659,'SORG07','07',90,5500,NULL,0,NULL,0,NULL,0),(15121,146,15108,50662,'SORG08','01',250,5100,NULL,0,NULL,0,NULL,0),(15122,146,15109,50665,'SORG09','01',250,5100,NULL,0,NULL,0,NULL,0),(15123,146,15110,50668,'SORG14','01',250,5100,NULL,0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `sc_lightsource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_lightspot`
--

DROP TABLE IF EXISTS `sc_lightspot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_lightspot` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `LightSpotID` varchar(50) NOT NULL COMMENT '(1-1)\nClass: id punto luce\nLabel: PL_ID\nCode: 07080901\nDefinition: indica l''identificativo del punto luce a cui sono associate le informazioni relative all''installazione',
  `sc_ElectricPanel_id` int unsigned NOT NULL,
  `sc_HomogeneousArea_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sc_LightSpot_sc_HomogeneousArea1_idx` (`sc_HomogeneousArea_id`),
  KEY `fk_sc_LightSpot_sc_ElectricPanel1_idx` (`sc_ElectricPanel_id`),
  KEY `fk_sc_LightSpot_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`),
  CONSTRAINT `fk_lsID_ep` FOREIGN KEY (`sc_ElectricPanel_id`) REFERENCES `sc_electricpanel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14967 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_lightspot`
--

LOCK TABLES `sc_lightspot` WRITE;
/*!40000 ALTER TABLE `sc_lightspot` DISABLE KEYS */;
INSERT INTO `sc_lightspot` VALUES (14957,146,'PL001',456,2758),(14958,146,'PL002',456,2760),(14959,146,'PL003',456,2764),(14960,146,'PL004',457,2762),(14961,146,'PL005',457,2759),(14962,146,'PL006',457,2761),(14963,146,'PL007',457,2765),(14964,146,'PL008',458,2763),(14965,146,'PL009',458,2763),(14966,146,'PL0010',458,2763);
/*!40000 ALTER TABLE `sc_lightspot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_lightspotdevice`
--

DROP TABLE IF EXISTS `sc_lightspotdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_lightspotdevice` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `sc_LightSpotEquipment_id` int unsigned NOT NULL COMMENT '(1-unbounded)\nClass: Punto luce – apparecchio\nLabel: PL_AP\nCode: 070810\nDefinition: L''apparecchio di illuminazione e'' un dispositivo chedistribuisce, filtra o trasforma la luce emessa da una o più sorgentiluminose e che include tutte le parti necessarie per sostenere, fissaree proteggere le sorgenti luminose e, ove necessario, i circuitiausiliari e gli strumenti per collegarle all''alimentazione elettrica.Nel concetto di punto luce e'' escluso il sostegno (che rientra nellaClasse "020208 - PALO", del DataBase Geotopografico, limitatamente aivalori e sottovalori "08 – illuminazione pubblica" dell''attributo"02020802 – PALO_IMP") al quale possono essere associati più punti luce(es. torre faro in una rotonda/piazza)',
  `sc_Metadata_id` int unsigned NOT NULL,
  `LightSpotDeviceID` varchar(50) NOT NULL COMMENT '(1-1)\nClass: id apparecchio\nLabel: PL_AP_ID\nCode: 07081000',
  `LightSpotType` enum('01','02','03','04','05','06','95') NOT NULL COMMENT '(1-1)\nClass: tipologia di apparecchio\nLabel: PL_AP_TY\nCode: 07081002\nDefinition: indica la tipologia di apparecchioinstallato',
  `LightSpotAge` enum('01','02','03','04') DEFAULT NULL COMMENT '(0-1)\nClass: tipologia di apparecchio\nLabel: PL_AP_TY\nCode: 07081002\nDefinition: indica la tipologia di apparecchioinstallato',
  `LightSpotBrand` enum('01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','43','44','45','46','47','48','49','50','51','52','53','54','55','56','57','58','59','60','61','62','63','64','65','66','67','68','69','70','71','72','73','74','75','76','77','78','79','80','81','82','83','91','93','94','95') DEFAULT NULL COMMENT '(0-1)\nClass: eta'' operativa in impianto dell''apparecchio alla data delrilievo\nLabel: PL_AP_AGE\nCode: 07081003\nDefinition: indica il periodo di costruzionedell''apparecchio',
  `LightSpotModel` varchar(40) DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: modello di apparecchio\nLabel: PL_AP_MOD\nCode: 07081005\nDefinition: indica lo specifico modello di apparecchio',
  `LightSpotModel_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `Lock` enum('01','02','03','04','91','93','94','95') DEFAULT NULL COMMENT '(0-1)\nClass: tipo di chiusura dell''apparecchio\nLabel: PL_AP_CHIU\nCode: 07081006',
  `NumberOfLamps` int NOT NULL COMMENT '(1-1)\nClass: numero di lampade o moduli per singolo apparecchio\nLabel: PL_AP_LAMP\nCode: 07081007',
  `TerminalPower` double NOT NULL COMMENT '(1-1)\nClass: potenza ai morsetti dell''apparecchio\nLabel: PL_AP_MOR\nCode: 07081008\nDefinition: [W]comprende anche le perdite dell''alimentatoredell''apparecchio',
  `Status` enum('01','02','03','04') NOT NULL COMMENT '(1-1)\nClass: stato dell''apparecchio alla data del rilievo\nLabel: PL_AP_ST\nCode: 07081009',
  `Owner` enum('01','02','91','93','94') NOT NULL COMMENT '(1-1)\nClass: proprietà del punto luce\nLabel: PL_AP_PRO\nCode: 07081010',
  `Ipea2013` enum('01','02','03','04','05','06','07','08','09','91','93','94') NOT NULL COMMENT '(1-1)\nClass: indice ipea (cam 2013)\nLabel: PL_AP_IP13\nCode: 07081011\nDefinition: indice parametrizzato di efficienza dell''apparecchioilluminante',
  `Ipea2018` enum('01','02','03','04','05','06','07','08','09','10','91','93','94') NOT NULL COMMENT '(1-1)\nClass: indice ipea* (cam 2018)\nLabel: PL_AP_IP18\nCode: 07081012',
  `UpwardEmission` double DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: emissione diretta verso l''alto dell''apparecchio\nLabel: PL_AP_EM\nCode: 07081013',
  `UpwardEmission_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `UpwardEmission_uom` varchar(50) DEFAULT NULL COMMENT '[optional]\nClass: unita'' di misura del valore immesso nel campo pl_ap_em\nLabel: PL_AP_EM_U\nCode: 07081014',
  `CutOffFlag` enum('true','false') DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: apparecchio cut off\nLabel: PL_AP_C_O\nCode: 07081015\nDefinition: indica se l''apparecchio e'' cut off (true) o no(false)',
  `CutOffFlag_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `Flux` double DEFAULT NULL COMMENT '(1-1) [nillable]\nClass: flusso caratteristico dell''apparecchio\nLabel: PL_AP_FLU\nCode: 07081016\nDefinition: per flusso luminoso caratteristico si intende quella"rated" come indicato nelle norme di armonizzazione deiRegolamenti di Ecodesign [lm]',
  PRIMARY KEY (`id`),
  KEY `fk_sc_LightSpotDevice_sc_LightSpotEquipment1_idx` (`sc_LightSpotEquipment_id`),
  KEY `fk_sc_LightSpotDevice_sc_Metadata1_idx` (`sc_Metadata_id`),
  KEY `fk_sc_LightSpotDevice_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`),
  CONSTRAINT `fk_lsID_lightSpotDevice_lightSpotEquipment` FOREIGN KEY (`sc_LightSpotEquipment_id`) REFERENCES `sc_lightspotequipment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_lightspotdevice`
--

LOCK TABLES `sc_lightspotdevice` WRITE;
/*!40000 ALTER TABLE `sc_lightspotdevice` DISABLE KEYS */;
INSERT INTO `sc_lightspotdevice` VALUES (15101,146,14956,50640,'AP01','06','03','13',NULL,1,NULL,1,240,'03','02','94','94',45,0,'gradi','true',0,5000),(15102,146,14957,50643,'AP03','01',NULL,NULL,NULL,0,NULL,1,230,'01','01','94','94',NULL,0,NULL,NULL,0,NULL),(15103,146,14958,50646,'AP05','01',NULL,NULL,NULL,0,NULL,1,240,'01','01','01','94',NULL,0,NULL,NULL,0,NULL),(15104,146,14959,50649,'AP07','01',NULL,NULL,NULL,0,NULL,1,290,'01','01','94','01',NULL,0,NULL,NULL,0,NULL),(15105,146,14960,50652,'AP09','01',NULL,NULL,NULL,0,NULL,1,50,'01','01','94','01',NULL,0,NULL,NULL,0,NULL),(15106,146,14961,50655,'AP10','01',NULL,NULL,NULL,0,NULL,1,80,'01','01','01','94',NULL,0,NULL,NULL,0,NULL),(15107,146,14962,50658,'AP11','01',NULL,NULL,NULL,0,NULL,1,118,'01','01','01','94',NULL,0,NULL,NULL,0,NULL),(15108,146,14963,50661,'AP12','01',NULL,NULL,NULL,0,NULL,1,290,'01','01','02','94',NULL,0,NULL,NULL,0,NULL),(15109,146,14964,50664,'AP13','01',NULL,NULL,NULL,0,NULL,1,290,'01','01','02','94',NULL,0,NULL,NULL,0,NULL),(15110,146,14965,50667,'AP14','01',NULL,NULL,NULL,0,NULL,1,290,'01','01','02','94',NULL,0,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `sc_lightspotdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_lightspotequipment`
--

DROP TABLE IF EXISTS `sc_lightspotequipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_lightspotequipment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `sc_LightSpot_id` int unsigned NOT NULL COMMENT '(1-1)\nClass: Punto luce – installazione\nLabel: PL_IS\nCode: 070809\nDefinition: Specifica i dati relativi all''installazione del punto luce.Classe priva di componente spaziale, essendo relazionata agli oggetticontenuti nella Classe PL_AP - 070808',
  `sc_Metadata_id` int unsigned NOT NULL,
  `sc_gml_Point_id` int unsigned NOT NULL COMMENT '(1-1)\nClass: Posizione\nLabel: PL_IS_POS\nCode: 070809101\nDefinition: corrisponde alla localizzazione geograficadell''installazione',
  `EquipmentType` enum('01','02','03','04','05','06','95') NOT NULL COMMENT '(1-1)\nClass: tipologia installazione\nLabel: PL_IS_SOS\nCode: 07080904\nDefinition: indica la tipologia di installazione',
  `Height` double NOT NULL COMMENT '(1-1)\nClass: altezza apparecchio\nLabel: PL_IS_ALT\nCode: 07080905\nDefinition: altezza dalla sede stradale [m]',
  `Incline` double DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: inclinazione\nLabel: PL_IS_TILT\nCode: 07080906\nDefinition: inclinazione rispetto all''asse orizzontale della sedestradale [gradi]',
  `Incline_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `Distance` double DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: distanza sostegno dall''inizio della carreggiata\nLabel: PL_IS_CAR\nCode: 07080907\nDefinition: Indica la distanza tra la base del sostegno e l''iniziodella carreggiata [m]. Per tipologie di sostegno diverse da supalo o su braccio deve essere valorizzato con valorenullo',
  `Distance_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `Length` double DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: lunghezza braccio\nLabel: PL_IS_BRA\nCode: 07080908\nDefinition: Nel caso di sostegno su braccio, indica la lunghezza diquest''ultimo [m]. Per tipologie di sostegno diverse da su palo osu braccio non deve essere valorizzato o valorizzato con valorenullo',
  `Length_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  `Age` enum('01','02','03','91','93','94') DEFAULT NULL COMMENT '(0-1)\nClass: eta'' sostegno\nLabel: PL_IS_AGE\nCode: 07080909',
  `SupportMaterial` enum('01','02','03','04','05','06','07','08','09') NOT NULL COMMENT '(1-1)\n',
  `AdditionalDevice` enum('01','02','03','04','05','06','07','91','93','94','95') NOT NULL COMMENT '(1-1)\n',
  `AdditionalElement` enum('01','02','91','93','94') DEFAULT NULL COMMENT '(0-1)\n',
  `SupportStatus` enum('01','02','03','04') NOT NULL COMMENT '(1-1)\n',
  PRIMARY KEY (`id`),
  KEY `fk_sc_LightSpotEquipment_sc_LightSpot1_idx` (`sc_LightSpot_id`),
  KEY `fk_sc_LightSpotEquipment_sc_gml_Point1_idx` (`sc_gml_Point_id`),
  KEY `fk_sc_LightSpotEquipment_sc_Metadata1_idx` (`sc_Metadata_id`),
  KEY `fk_sc_LightSpotEquipment_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`),
  CONSTRAINT `fk_lsID_lightSpotEquipment_lightSpot` FOREIGN KEY (`sc_LightSpot_id`) REFERENCES `sc_lightspot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14966 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_lightspotequipment`
--

LOCK TABLES `sc_lightspotequipment` WRITE;
/*!40000 ALTER TABLE `sc_lightspotequipment` DISABLE KEYS */;
INSERT INTO `sc_lightspotequipment` VALUES (14956,146,14957,50639,15781,'03',6,NULL,1,3,0,4,0,'03','04','04','02','03'),(14957,146,14958,50642,15782,'01',6,NULL,0,NULL,0,NULL,0,NULL,'01','01',NULL,'01'),(14958,146,14959,50645,15783,'01',6,NULL,0,NULL,0,NULL,0,NULL,'01','01',NULL,'01'),(14959,146,14960,50648,15784,'01',6,NULL,0,NULL,0,NULL,0,NULL,'01','01',NULL,'01'),(14960,146,14961,50651,15785,'01',6,NULL,0,NULL,0,NULL,0,NULL,'01','01',NULL,'01'),(14961,146,14962,50654,15786,'01',6,NULL,0,NULL,0,NULL,0,NULL,'01','01',NULL,'01'),(14962,146,14963,50657,15787,'01',6,NULL,0,NULL,0,NULL,0,NULL,'01','01',NULL,'01'),(14963,146,14964,50660,15788,'01',6,NULL,0,NULL,0,NULL,0,NULL,'01','01',NULL,'01'),(14964,146,14965,50663,15789,'01',6,NULL,0,NULL,0,NULL,0,NULL,'01','01',NULL,'01'),(14965,146,14966,50666,15790,'01',6,NULL,0,NULL,0,NULL,0,NULL,'01','01',NULL,'01');
/*!40000 ALTER TABLE `sc_lightspotequipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_metadata`
--

DROP TABLE IF EXISTS `sc_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_metadata` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `ValidityStartDate` date DEFAULT NULL COMMENT '(1-1) [nillable]\nClass: inizio validita'' del dato\nLabel: DATA_INI\nCode: 01',
  `ValidityEndDate` date DEFAULT NULL COMMENT '(1-1) [nillable]\nClass: fine validita'' del dato\nLabel: DATA_FIN\nCode: 02',
  `Source` enum('01','02','03','04','05','06','95') NOT NULL COMMENT '(1-1)\nClass: fonte del dato\nLabel: FONTE\nCode: 03',
  `Scale` enum('01','02','03','04','05','06','07','95') NOT NULL COMMENT '(1-1)\nClass: scala\nLabel: SCALA\nCode: 04\nDefinition: scala di riferimento dell''oggetto',
  PRIMARY KEY (`id`),
  KEY `fk_sc_Metadata_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50669 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_metadata`
--

LOCK TABLES `sc_metadata` WRITE;
/*!40000 ALTER TABLE `sc_metadata` DISABLE KEYS */;
INSERT INTO `sc_metadata` VALUES (50614,146,'2019-05-03','2019-06-02','01','04'),(50615,146,'2019-05-03','2019-06-02','01','04'),(50616,146,'2019-05-03','2019-06-02','01','04'),(50617,146,'2019-05-03','2019-06-02','01','04'),(50618,146,'2019-05-03','2019-06-02','01','04'),(50619,146,'2019-05-03','2019-06-02','01','04'),(50620,146,'2019-05-03','2019-06-02','01','04'),(50621,146,'2019-05-03','2019-06-02','01','04'),(50622,146,'2019-05-03','2019-06-02','01','04'),(50623,146,'2019-05-03','2019-06-02','01','04'),(50624,146,'2019-05-03','2019-06-02','01','04'),(50625,146,'2019-05-03','2019-06-02','01','04'),(50626,146,'2019-05-03','2019-06-02','01','04'),(50627,146,'2019-05-03','2019-06-02','01','04'),(50628,146,'2019-05-03','2019-06-02','01','04'),(50629,146,'2019-05-03','2019-06-02','01','04'),(50630,146,'2019-05-03','2019-06-02','01','04'),(50631,146,'2019-05-03','2019-06-02','01','04'),(50632,146,'2019-05-03','2019-06-02','01','04'),(50633,146,'2019-05-03','2019-06-02','01','04'),(50634,146,'2019-05-03','2019-06-02','01','04'),(50635,146,'2019-05-03','2019-06-02','01','04'),(50636,146,'2019-05-03','2019-06-02','01','04'),(50637,146,'2019-05-03','2019-06-02','01','04'),(50638,146,'2019-05-03','2019-06-02','01','04'),(50639,146,'2019-05-03','2019-06-02','01','04'),(50640,146,'2019-05-03','2019-06-02','01','04'),(50641,146,'2019-05-03','2019-06-02','01','04'),(50642,146,NULL,NULL,'01','04'),(50643,146,NULL,NULL,'01','04'),(50644,146,NULL,NULL,'01','04'),(50645,146,NULL,NULL,'01','04'),(50646,146,NULL,NULL,'01','04'),(50647,146,NULL,NULL,'01','04'),(50648,146,NULL,NULL,'01','04'),(50649,146,NULL,NULL,'01','04'),(50650,146,NULL,NULL,'01','04'),(50651,146,NULL,NULL,'01','04'),(50652,146,NULL,NULL,'01','04'),(50653,146,NULL,NULL,'01','04'),(50654,146,NULL,NULL,'01','04'),(50655,146,NULL,NULL,'01','04'),(50656,146,NULL,NULL,'01','04'),(50657,146,NULL,NULL,'01','04'),(50658,146,NULL,NULL,'01','04'),(50659,146,NULL,NULL,'01','04'),(50660,146,NULL,NULL,'01','04'),(50661,146,NULL,NULL,'01','04'),(50662,146,NULL,NULL,'01','04'),(50663,146,NULL,NULL,'01','04'),(50664,146,NULL,NULL,'01','04'),(50665,146,NULL,NULL,'01','04'),(50666,146,NULL,NULL,'01','04'),(50667,146,NULL,NULL,'01','04'),(50668,146,NULL,NULL,'01','04');
/*!40000 ALTER TABLE `sc_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `sc_municipality`
--

DROP TABLE IF EXISTS `sc_municipality`;
/*!50001 DROP VIEW IF EXISTS `sc_municipality`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sc_municipality` AS SELECT 
 1 AS `logo`,
 1 AS `provider_logo`,
 1 AS `name`,
 1 AS `province_id`,
 1 AS `regione_id`,
 1 AS `inhabitants`,
 1 AS `area`,
 1 AS `responsible`,
 1 AS `contact_phone`,
 1 AS `contact_email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sc_option_label`
--

DROP TABLE IF EXISTS `sc_option_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_option_label` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `index` varchar(4) NOT NULL,
  `field` varchar(10) NOT NULL,
  `text` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_index` (`index`,`field`),
  KEY `field` (`index`)
) ENGINE=InnoDB AUTO_INCREMENT=3592 DEFAULT CHARSET=latin1 COMMENT='Tabella di decodifica delle opzioni presenti nei campi ENUM di tutte le tabelle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_option_label`
--

LOCK TABLES `sc_option_label` WRITE;
/*!40000 ALTER TABLE `sc_option_label` DISABLE KEYS */;
INSERT INTO `sc_option_label` VALUES (338,'01','scala','scala 1:1000'),(339,'02','scala','scala 1:2000'),(340,'03','scala','scala 1:5000'),(341,'04','scala','scala 1:10000'),(342,'05','scala','scala 1:25000'),(343,'06','scala','> scala 1:500'),(344,'07','scala','scala 1:500'),(345,'91','global','Non conosciuto'),(346,'93','global','Non definito'),(347,'94','global','Non applicabile'),(348,'01','fonte','Rilievo diretto'),(349,'02','fonte','Editing SINFI'),(350,'03','fonte','Archivio storico'),(351,'04','fonte','Riposizionamento su DBGT o CTR'),(352,'05','fonte','Fotogrammetria'),(353,'06','fonte','Ortoimmagini'),(354,'95','fonte','Altro'),(3181,'01','meta_es','limite amministrativo'),(3182,'02','meta_es','taglio cartografico'),(3183,'95','meta_es','altro'),(3184,'01','meta_sc','scala 1:1000'),(3185,'02','meta_sc','scala 1:2000'),(3186,'03','meta_sc','scala 1:5000'),(3187,'04','meta_sc','scala 1:10000'),(3188,'05','meta_sc','scala 1:25000'),(3189,'06','meta_sc','> scala 1:500'),(3190,'07','meta_sc','scala 1:500'),(3191,'95','meta_sc','altro'),(3192,'01','qe_a_tip','esterna'),(3193,'02','qe_a_tip','interna'),(3194,'01','qe_a_cons','buono'),(3195,'02','qe_a_cons','da mettere a norma'),(3196,'03','qe_a_cons','da manutenere'),(3197,'04','qe_a_cons','da sostituire'),(3198,'01','qe_a_arm','nuovo'),(3199,'02','qe_a_arm','accettabile'),(3200,'03','qe_a_arm','da sostituire'),(3201,'91','qe_a_arm','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3202,'93','qe_a_arm','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3203,'94','qe_a_arm','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3204,'95','qe_a_arm','altro'),(3205,'01','qe_a_stat','in esercizio'),(3206,'02','qe_a_stat','non in esercizio'),(3207,'0201','qe_a_stat','in costruzione'),(3208,'0202','qe_a_stat','in disuso'),(3209,'0203','qe_a_stat','in manutenzione'),(3210,'01','qe_a_st_im','pessimo'),(3211,'02','qe_a_st_im','insufficiente'),(3212,'03','qe_a_st_im','sufficiente'),(3213,'04','qe_a_st_im','buono'),(3214,'05','qe_a_st_im','ottimo'),(3215,'01','qe_a_car_e','presenti'),(3216,'0101','qe_a_car_e','elettrico permanente'),(3217,'0102','qe_a_car_e','elettrico temporaneo'),(3218,'02','qe_a_car_e','assenti'),(3219,'01','qe_a_st_rq','pessimo'),(3220,'02','qe_a_st_rq','insufficiente'),(3221,'03','qe_a_st_rq','sufficiente'),(3222,'04','qe_a_st_rq','buono'),(3223,'05','qe_a_st_rq','ottimo'),(3224,'01','qe_m_af','Consip servizio Luce'),(3225,'02','qe_m_af','servizio manutenzione semplice'),(3226,'95','qe_m_af','altro'),(3227,'01','qe_m_rem','Canone annuo'),(3228,'02','qe_m_rem','A SAL'),(3229,'91','qe_m_rem','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3230,'93','qe_m_rem','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3231,'94','qe_m_rem','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3232,'01','qe_fg_acc','Crepuscolare'),(3233,'02','qe_fg_acc','Orologio'),(3234,'03','qe_fg_acc','Orologio astronomico'),(3235,'04','qe_fg_acc','Manuale'),(3236,'05','qe_fg_acc','Telecontrollo'),(3237,'01','qe_fg_regf','Centralizzato'),(3238,'02','qe_fg_regf','Punto a punto'),(3239,'91','qe_fg_regf','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3240,'93','qe_fg_regf','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3241,'94','qe_fg_regf','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3242,'01','qe_fg_telq','si'),(3243,'0101','qe_fg_telq','statico'),(3244,'0102','qe_fg_telq','adattivo'),(3245,'0103','qe_fg_telq','statico/adattivo'),(3246,'02','qe_fg_telq','no'),(3247,'01','qe_fg_clme','I'),(3248,'02','qe_fg_clme','II'),(3249,'03','qe_fg_clme','III'),(3250,'91','qe_fg_clme','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3251,'93','qe_fg_clme','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3252,'94','qe_fg_clme','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3253,'01','qe_dt_fasi','monofase'),(3254,'02','qe_dt_fasi','trifase'),(3255,'03','qe_dt_fasi','corrente continua'),(3256,'01','qe_dt_prot','nessuna'),(3257,'02','qe_dt_prot','protezione differenziale'),(3258,'03','qe_dt_prot','protezione magnetotermica'),(3259,'04','qe_dt_prot','entrambi gli interruttori'),(3260,'95','qe_dt_prot','altro'),(3261,'01','qe_dt_ip13','A+'),(3262,'02','qe_dt_ip13','A'),(3263,'03','qe_dt_ip13','B'),(3264,'04','qe_dt_ip13','C'),(3265,'05','qe_dt_ip13','D'),(3266,'06','qe_dt_ip13','E'),(3267,'07','qe_dt_ip13','F'),(3268,'08','qe_dt_ip13','G'),(3269,'91','qe_dt_ip13','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3270,'93','qe_dt_ip13','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3271,'94','qe_dt_ip13','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3272,'01','qe_dt_ip18','An+'),(3273,'02','qe_dt_ip18','A++'),(3274,'03','qe_dt_ip18','A+'),(3275,'04','qe_dt_ip18','A'),(3276,'05','qe_dt_ip18','B'),(3277,'06','qe_dt_ip18','C'),(3278,'07','qe_dt_ip18','D'),(3279,'08','qe_dt_ip18','E'),(3280,'09','qe_dt_ip18','F'),(3281,'10','qe_dt_ip18','G'),(3282,'91','qe_dt_ip18','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3283,'93','qe_dt_ip18','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3284,'94','qe_dt_ip18','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3285,'01','qe_dt_ty_i','in serie'),(3286,'02','qe_dt_ty_i','in derivazione'),(3287,'91','qe_dt_ty_i','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3288,'93','qe_dt_ty_i','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3289,'94','qe_dt_ty_i','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3290,'01','zo_ty','Area di Circolazione veicolare'),(3291,'02','zo_ty','Area di Circolazione pedonale'),(3292,'03','zo_ty','Area di Circolazione ciclabile'),(3293,'01','zo_cs_ci','A1 – Autostrade extraurbane – Limite di velocità 130-150 km/h –\n                            ME1'),(3294,'02','zo_cs_ci','A1 – Autostrade urbane – Limite di velocità 130 km/h –\n                            ME1'),(3295,'03','zo_cs_ci','A2 – Strade di servizio alle autostrade extraurbane – Limite di\n                            velocità 70-90 km/h – ME2'),(3296,'04','zo_cs_ci','A2 – Strade di servizio alle autostrade urbane – Limite di\n                            velocità 50 km/h – ME2'),(3297,'05','zo_cs_ci','B – Strade extraurbane principali – Limite di velocità 110 km/h\n                            – ME2'),(3298,'06','zo_cs_ci','B – Strade di servizio alle strade extraurbane principali –\n                            Limite di velocità 70-90 km/h – ME3b'),(3299,'07','zo_cs_ci','C – Strade extraurbane secondarie (tipi C1 e C2) – Limite di\n                            velocità 70-90 km/h – ME2'),(3300,'08','zo_cs_ci','C – Strade extraurbane secondarie – Limite di velocità 50 km/h –\n                            ME3b'),(3301,'09','zo_cs_ci','C – Strade extraurbane secondarie con limiti particolari –\n                            Limite di velocità 70-90 km/h – ME2'),(3302,'10','zo_cs_ci','D – Strade urbane di scorrimento – Limite di velocità 70 km/h –\n                            ME2'),(3303,'11','zo_cs_ci','D – Strade urbane di scorrimento – Limite di velocità 50 km/h –\n                            ME2'),(3304,'12','zo_cs_ci','E – Strade urbane interquartiere – Limite di velocità 50 km/h –\n                            ME2'),(3305,'13','zo_cs_ci','E – Strade urbane di quartiere – Limite di velocità 50 km/h –\n                            ME3b'),(3306,'14','zo_cs_ci','F – Strade locali extraurbane (tipi F1 e F2) – Limite di\n                            velocità 70-90 km/h – ME2'),(3307,'15','zo_cs_ci','F – Strade locali extraurbane – Limite di velocità 50 km/h –\n                            ME3b'),(3308,'16','zo_cs_ci','F – Strade locali extraurbane – Limite di velocità 30 km/h –\n                            S2'),(3309,'17','zo_cs_ci','F – Strade locali urbane – Limite di velocità 50 km/h –\n                            ME3b'),(3310,'18','zo_cs_ci','F – Strade locali urbane: centri storici, isole ambientali, zone\n                            30 – Limite di velocità 30 km/h – CE3'),(3311,'19','zo_cs_ci','F – Strade locali urbane: altre situazioni – Limite di velocità\n                            30 km/h – CE4/S2'),(3312,'20','zo_cs_ci','F – Strade locali urbane: aree pedonali – Limite di velocità 5\n                            km/h – CE4/S2'),(3313,'21','zo_cs_ci','F – Strade locali urbane: centri storici (utenti principali:\n                            pedoni, ammessi gli altri utenti) – Limite di velocità 5 km/h –\n                            CE4/S2'),(3314,'22','zo_cs_ci','F – Strade locali interzonali – Limite di velocità 50 km/h –\n                            CE4/S2'),(3315,'23','zo_cs_ci','F – Strade locali interzonali – Limite di velocità 30 km/h –\n                            CE4/S2'),(3316,'24','zo_cs_ci','Fbis – Piste ciclabili – Limite di velocità non dichiarato –\n                            S2'),(3317,'26','zo_cs_ci','A1– Autostrade extraurbane – limite di velocità 130-150 Km/h –\n                            M1'),(3318,'27','zo_cs_ci','A1– Autostrade urbane – limite di velocità 130 Km/h –\n                            M1'),(3319,'28','zo_cs_ci','A2–Strade di servizio alle autostrade extraurbane – limite di\n                            velocità 70-90 Km/h – M2'),(3320,'29','zo_cs_ci','A2–Strade di servizio alle autostrade urbane – limite di\n                            velocità 50 Km/h – M2'),(3321,'30','zo_cs_ci','B – Strade extraurbane principali – limite di velocità 110 Km/h\n                            – M2'),(3322,'31','zo_cs_ci','B – Strade di servizio alle strade extraurbane principali –\n                            limite di velocità 70-90 Km/h – M3'),(3323,'32','zo_cs_ci','C – Strade extraurbane secondarie (tipici C1 e C2)– limite di\n                            velocità 70-90 Km/h – M2'),(3324,'33','zo_cs_ci','C – Strade extraurbane secondarie – limite di velocità 50 Km/h –\n                            M3'),(3325,'34','zo_cs_ci','C – Strade extraurbane secondarie con limiti particolari– limite\n                            di velocità 70-90 Km/h – M2'),(3326,'35','zo_cs_ci','D – Strade urbane di scorrimento– limite di velocità 70 Km/h –\n                            M2'),(3327,'36','zo_cs_ci','D – Strade urbane di scorrimento– limite di velocità 50 Km/h –\n                            M2'),(3328,'37','zo_cs_ci','E – Strade urbane di quartiere– limite di velocità 50 Km/h –\n                            M3'),(3329,'38','zo_cs_ci','F – Strade locali extraurbane (tipi F1 e F2) – limite di\n                            velocità 70-90 Km/h – M2'),(3330,'39','zo_cs_ci','F – Strade locali extraurbane – limite di velocità 50 Km/h –\n                            M4'),(3331,'40','zo_cs_ci','F – Strade locali extraurbane – limite di velocità 30 Km/h –\n                            C4/P2'),(3332,'41','zo_cs_ci','F – Strade locali urbane – limite di velocità 50 Km/h –\n                            M4'),(3333,'42','zo_cs_ci','F – Strade locali urbane: centri storici, isole ambientali, zone\n                            30 – limite di velocità 30 Km/h – C3/P1'),(3334,'43','zo_cs_ci','F – Strade locali urbane: altre situazioni limite di velocità 30\n                            Km/h – C4/P2'),(3335,'44','zo_cs_ci','F – Strade locali urbane: aree pedonali, centri storici (utenti\n                            principali: pedoni, ammessi gli altri utenti)limite di velocità 5 Km/h –\n                            C4/P2'),(3336,'45','zo_cs_ci','F – Strade locali interzonali limite di velocità 50 Km/h –\n                            M3'),(3337,'46','zo_cs_ci','F – Strade locali interzonali limite di velocità 30 Km/h –\n                            C4/P2'),(3338,'47','zo_cs_ci','Fbis –Itinerari ciclo-pedonali limite di velocità non dichiarati\n                            – P2'),(3339,'48','zo_cs_ci','Fbis –Strade a destinazione particolare limite di velocità 30\n                            Km/h– P2'),(3340,'01','zo_ty_ms','calcestruzzo (C1)'),(3341,'02','zo_ty_ms','asfalto (C2)'),(3342,'95','zo_ty_ms','altro'),(3343,'01','zo_ty_car','carreggiata singola'),(3344,'02','zo_ty_car','due carreggiate simmetriche'),(3345,'03','zo_ty_car','due carreggiate asimmetriche'),(3346,'01','zo_mar','Sì, su un lato'),(3347,'02','zo_mar','Sì, su ambo i lati'),(3348,'03','zo_mar','no'),(3349,'91','zo_mar','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3350,'93','zo_mar','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3351,'94','zo_mar','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3352,'01','zo_ds_s','carreggiata singola'),(3353,'0101','zo_ds_s','carreggiata singola - unilaterale'),(3354,'0102','zo_ds_s','carreggiata singola - due file affacciate'),(3355,'0103','zo_ds_s','carreggiata singola - due file a quinconce'),(3356,'02','zo_ds_s','due carreggiate simmetriche'),(3357,'0201','zo_ds_s','due carreggiate simmetriche - due file affacciate'),(3358,'0202','zo_ds_s','due carreggiate simmetriche - due file a quinconce'),(3359,'0203','zo_ds_s','due carreggiate simmetriche - una fila centrale in ogni\n                            carreggiata'),(3360,'0204','zo_ds_s','due carreggiate simmetriche - due file affacciate su ogni\n                            carreggiata'),(3361,'0205','zo_ds_s','due carreggiate simmetriche - due file a quinconce su ogni\n                            carreggiata'),(3362,'03','zo_ds_s','due carreggiate asimmetriche'),(3363,'0301','zo_ds_s','due carreggiate asimmetriche - due file affacciate'),(3364,'0302','zo_ds_s','due carreggiate asimmetriche - due file a quinconce'),(3365,'0303','zo_ds_s','due carreggiate asimmetriche - una fila centrale in ogni\n                            carreggiata'),(3366,'0304','zo_ds_s','due carreggiate asimmetriche - una fila per ogni\n                            carreggiata'),(3367,'0305','zo_ds_s','due carreggiate asimmetriche - due file affacciate su carr. A -\n                            Una fila su marciapiede carr. B'),(3368,'0306','zo_ds_s','due carreggiate asimmetriche - due file a quinconce su carr. A -\n                            Una fila su marciapiede carr. B'),(3369,'0307','zo_ds_s','due carreggiate asimmetriche - una fila su marciapiede carr. A -\n                            Due file nella mediana'),(3370,'0308','zo_ds_s','due carreggiate asimmetriche - una fila a quinconce su\n                            marciapiede carr.A - Due file nella mediana centrale'),(3371,'01','zo_ty_put','autostrada'),(3372,'02','zo_ty_put','strada extraurbana principale'),(3373,'03','zo_ty_put','strada extraurbana secondaria'),(3374,'04','zo_ty_put','strada urbana di scorrimento'),(3375,'05','zo_ty_put','strada urbana di quartiere'),(3376,'06','zo_ty_put','strada locale'),(3377,'91','zo_ty_put','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3378,'93','zo_ty_put','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3379,'94','zo_ty_put','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3380,'01','pl_ap_ty','armatura stradale'),(3381,'02','pl_ap_ty','sfera'),(3382,'03','pl_ap_ty','proiettore'),(3383,'04','pl_ap_ty','arredo urbano'),(3384,'05','pl_ap_ty','a incasso'),(3385,'06','pl_ap_ty','lanterna'),(3386,'95','pl_ap_ty','altro'),(3387,'01','pl_ap_age','< 3 anni'),(3388,'02','pl_ap_age','>= 3 < 5 anni'),(3389,'03','pl_ap_age','>= 5 < 10 anni'),(3390,'04','pl_ap_age','>= 10 anni'),(3391,'01','pl_ap_mar','3F FILIPPI SpA (I)'),(3392,'02','pl_ap_mar','AEC ILLUMINAZIONE SRL (I)'),(3393,'03','pl_ap_mar','AGABEKOV SA (CH)'),(3394,'04','pl_ap_mar','ALDABRA SRL (I)'),(3395,'05','pl_ap_mar','ALMECO SpA (I)'),(3396,'06','pl_ap_mar','ARCLUCE SPA (I)'),(3397,'07','pl_ap_mar','AREALITE SRL (I)'),(3398,'08','pl_ap_mar','ARES SRL (I)'),(3399,'09','pl_ap_mar','ARIANNA SPA (I)'),(3400,'10','pl_ap_mar','ARTEMIDE SPA (I)'),(3401,'11','pl_ap_mar','AUGENTI ILLUMINAZIONE SPA (I)'),(3402,'12','pl_ap_mar','BEGHELLI SPA (I)'),(3403,'13','pl_ap_mar','C. & G. CARANDINI SA (E)'),(3404,'14','pl_ap_mar','CARIBONI LITE SRL (I)'),(3405,'15','pl_ap_mar','CASTALDI LIGHTING SPA (I)'),(3406,'16','pl_ap_mar','C LUCE SRL (I)'),(3407,'17','pl_ap_mar','CITY DESIGN'),(3408,'18','pl_ap_mar','CREE EUROPE SRL A SU (I-USA)'),(3409,'19','pl_ap_mar','DETAS SPA (I)'),(3410,'20','pl_ap_mar','DISANO ILLUMINAZIONE SPA (I)'),(3411,'21','pl_ap_mar','EWO SRL (I)'),(3412,'22','pl_ap_mar','FAEBER LIGHTING SYSTEM SPA (I)'),(3413,'23','pl_ap_mar','FAEL SPA (I)'),(3414,'24','pl_ap_mar','FASTLED SRL (I)'),(3415,'25','pl_ap_mar','FEAM SRL (I)'),(3416,'26','pl_ap_mar','FIVEP LITE SPA (I)'),(3417,'27','pl_ap_mar','FLOS SPA (I)'),(3418,'28','pl_ap_mar','FONDERIE VITERBESI SRL (I)'),(3419,'29','pl_ap_mar','FONTANA ARTE SPA (I)'),(3420,'30','pl_ap_mar','FRAEN CORPORATION SRL (I)'),(3421,'31','pl_ap_mar','F.lli RANCESCONI & C Srl (I)'),(3422,'32','pl_ap_mar','FUMAGALLI SRL (I)'),(3423,'33','pl_ap_mar','GEWISS SPA (I)'),(3424,'34','pl_ap_mar','GHIDINI ILLUMINAZIONE SRL (I)'),(3425,'35','pl_ap_mar','GHISAMESTIERI SRL (I)'),(3426,'36','pl_ap_mar','GOCCIA ILLUMINAZIONE SRL (I)'),(3427,'37','pl_ap_mar','GORE'),(3428,'38','pl_ap_mar','GRECHI LIGHTING INTERNATIONAL SRL (I)'),(3429,'39','pl_ap_mar','GRECHI LIGHT AND ENERGY SRL (I)'),(3430,'40','pl_ap_mar','GRIVEN SRL (I)'),(3431,'41','pl_ap_mar','IDEALLUX SRL (I)'),(3432,'42','pl_ap_mar','IGUZZINI ILLUMINAZIONE SPA (I)'),(3433,'43','pl_ap_mar','INVERLIGHT SRL'),(3434,'44','pl_ap_mar','ITALPRESS SRL (I)'),(3435,'45','pl_ap_mar','IVELA SPA (I)'),(3436,'46','pl_ap_mar','LEG ILLUMINATION SRL (I)'),(3437,'47','pl_ap_mar','LOMBARDO SRL (I)'),(3438,'48','pl_ap_mar','MARECO LUCE SRL (I)'),(3439,'49','pl_ap_mar','MARINO CRISTAL'),(3440,'50','pl_ap_mar','MARLANVIL SPA (I)'),(3441,'51','pl_ap_mar','MARTINELLI LUCE SPA (I)'),(3442,'52','pl_ap_mar','MARTINI SPA (I)'),(3443,'53','pl_ap_mar','MEGAMAN (HK) ELECTRICAL & LIGHTING LTD. (HK)'),(3444,'54','pl_ap_mar','NERI SPA (I)'),(3445,'55','pl_ap_mar','NOBILE ITALIA SPA'),(3446,'56','pl_ap_mar','NOVALUX SRL (I)'),(3447,'57','pl_ap_mar','PALAZZOLI SPA (I)'),(3448,'58','pl_ap_mar','PALI CAMPION SRL (I)'),(3449,'59','pl_ap_mar','PHILIPS'),(3450,'60','pl_ap_mar','PLATEK LIGHT SRL (I)'),(3451,'61','pl_ap_mar','PERFORMANCE IN LIGHTING SpA (I)'),(3452,'62','pl_ap_mar','RC LUCE SRL (I)'),(3453,'63','pl_ap_mar','REGGIANI SPA ILLUMINAZIONE (I)'),(3454,'64','pl_ap_mar','REVERBERI ENETEC'),(3455,'65','pl_ap_mar','ROSSINI ILLUMINAZIONE Srl (I)'),(3456,'66','pl_ap_mar','SBP SPA (Performance In Lighting SpA ) (I)'),(3457,'67','pl_ap_mar','SCHNEIDER ELECTRIC'),(3458,'68','pl_ap_mar','SCHREDER SPA (B+I)'),(3459,'69','pl_ap_mar','SIDE SPA (I)'),(3460,'70','pl_ap_mar','SIMES SPA (I)'),(3461,'71','pl_ap_mar','SIMLUX SPA (I)'),(3462,'72','pl_ap_mar','SITE SPA (I)'),(3463,'73','pl_ap_mar','SITECO LIGHTING SYSTEMS SRL (I)'),(3464,'74','pl_ap_mar','TAGLIAFICO LIGHTING SNC (I)'),(3465,'75','pl_ap_mar','THORN EUROPHANE SPA (I)'),(3466,'76','pl_ap_mar','TRILUX'),(3467,'77','pl_ap_mar','A.P.F. SRL'),(3468,'78','pl_ap_mar','B.E.G ITALIA SRL'),(3469,'79','pl_ap_mar','BESTLUX SRL'),(3470,'80','pl_ap_mar','OPTIMA ILLUMINAZIONE SRL'),(3471,'81','pl_ap_mar','OSRAM SPA'),(3472,'82','pl_ap_mar','PENTA ARCHITECTURAL LIGHT SRL'),(3473,'83','pl_ap_mar','ZG LIGHTING SRL'),(3474,'91','pl_ap_mar','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3475,'93','pl_ap_mar','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3476,'94','pl_ap_mar','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3477,'95','pl_ap_mar','altro'),(3478,'01','pl_ap_chiu','Vetro curvo'),(3479,'02','pl_ap_chiu','Vetro piano'),(3480,'03','pl_ap_chiu','Ottica aperta'),(3481,'04','pl_ap_chiu','Vetri laterali'),(3482,'91','pl_ap_chiu','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3483,'93','pl_ap_chiu','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3484,'94','pl_ap_chiu','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3485,'95','pl_ap_chiu','altro'),(3486,'01','pl_ap_st','buono'),(3487,'02','pl_ap_st','da manutenere'),(3488,'03','pl_ap_st','da sostituire'),(3489,'04','pl_ap_st','mancante da ripristinare'),(3490,'01','pl_ap_pro','Comune'),(3491,'02','pl_ap_pro','Terzi'),(3492,'91','pl_ap_pro','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3493,'93','pl_ap_pro','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3494,'94','pl_ap_pro','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3495,'01','pl_ap_ip13','A++'),(3496,'02','pl_ap_ip13','A+'),(3497,'03','pl_ap_ip13','A'),(3498,'04','pl_ap_ip13','B'),(3499,'05','pl_ap_ip13','C'),(3500,'06','pl_ap_ip13','D'),(3501,'07','pl_ap_ip13','E'),(3502,'08','pl_ap_ip13','F'),(3503,'09','pl_ap_ip13','G'),(3504,'91','pl_ap_ip13','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3505,'93','pl_ap_ip13','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3506,'94','pl_ap_ip13','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3507,'01','pl_ap_ip18','An+'),(3508,'02','pl_ap_ip18','A++'),(3509,'03','pl_ap_ip18','A+'),(3510,'04','pl_ap_ip18','A'),(3511,'05','pl_ap_ip18','B'),(3512,'06','pl_ap_ip18','C'),(3513,'07','pl_ap_ip18','D'),(3514,'08','pl_ap_ip18','E'),(3515,'09','pl_ap_ip18','F'),(3516,'10','pl_ap_ip18','G'),(3517,'91','pl_ap_ip18','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3518,'93','pl_ap_ip18','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3519,'94','pl_ap_ip18','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3520,'01','pl_is_sos','su palo'),(3521,'02','pl_is_sos','su tesata'),(3522,'03','pl_is_sos','su braccio'),(3523,'04','pl_is_sos','a parete'),(3524,'05','pl_is_sos','torre faro'),(3525,'06','pl_is_sos','a incasso nel terreno'),(3526,'95','pl_is_sos','altro'),(3527,'01','pl_is_age','< 3 anni'),(3528,'02','pl_is_age','>= 3 < 10 anni'),(3529,'03','pl_is_age','>= 10 anni'),(3530,'91','pl_is_age','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3531,'93','pl_is_age','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3532,'94','pl_is_age','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3533,'01','pl_is_mat','acciaio'),(3534,'02','pl_is_mat','acciaio zincato'),(3535,'03','pl_is_mat','alluminio'),(3536,'04','pl_is_mat','cemento'),(3537,'05','pl_is_mat','ferro zincato'),(3538,'06','pl_is_mat','ferro verniciato'),(3539,'07','pl_is_mat','ghisa'),(3540,'08','pl_is_mat','legno'),(3541,'09','pl_is_mat','vetroresina'),(3542,'01','pl_is_ele','nessuno'),(3543,'02','pl_is_ele','telecamera'),(3544,'03','pl_is_ele','pannello solare'),(3545,'04','pl_is_ele','hotspot WI-FI'),(3546,'05','pl_is_ele','sensore rilevazione traffico'),(3547,'06','pl_is_ele','sensore ambientale'),(3548,'07','pl_is_ele','pannello a messaggio variabile'),(3549,'91','pl_is_ele','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3550,'93','pl_is_ele','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3551,'94','pl_is_ele','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3552,'95','pl_is_ele','altro'),(3553,'01','pl_is_aep','Integrati'),(3554,'02','pl_is_aep','Non integrati'),(3555,'91','pl_is_aep','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3556,'93','pl_is_aep','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3557,'94','pl_is_aep','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3558,'01','pl_is_sts','buono'),(3559,'02','pl_is_sts','da manutenere'),(3560,'03','pl_is_sts','da sostituire'),(3561,'04','pl_is_sts','mancante da ripristinare'),(3562,'01','pl_sl_ty','Vapori Mercurio'),(3563,'02','pl_sl_ty','Incandescenza'),(3564,'03','pl_sl_ty','Fluorescenza compatta'),(3565,'04','pl_sl_ty','Fluorescenza tubolare'),(3566,'05','pl_sl_ty','Sodio Alta Pressione'),(3567,'06','pl_sl_ty','Sodio Bassa Pressione'),(3568,'07','pl_sl_ty','Ioduri metallici'),(3569,'08','pl_sl_ty','Alogena'),(3570,'09','pl_sl_ty','LED'),(3571,'95','pl_sl_ty','altro'),(3572,'01','pod_c_ty','Servizio Luce Consip'),(3573,'02','pod_c_ty','Mercato libero compresa la sola fornitura di energia elettrica\n                            Consip o altra centrale di committenza'),(3574,'03','pod_c_ty','Maggior tutela'),(3575,'04','pod_c_ty','Salvaguardia'),(3576,'95','pod_c_ty','altro'),(3577,'01','pod_a_man','ottimo'),(3578,'02','pod_a_man','buono/adeguato'),(3579,'03','pod_a_man','pessimo'),(3580,'91','pod_a_man','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3581,'93','pod_a_man','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3582,'94','pod_a_man','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3586,'91','zo_ty_car','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3587,'93','zo_ty_car','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3588,'94','zo_ty_car','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in '),(3589,'91','zo_ds_s','Non conosciuto: valore supposto esistente ma non conosciuto in\n                            fase di raccolta dati'),(3590,'93','zo_ds_s','Non definito: valore non assegnato perché non e\' stato\n                            definito'),(3591,'94','zo_ds_s','Non applicabile: valore previsto dalla specifica ma non\n                            applicabile all\'istanza (ad es. non e\' applicabile la categoria d\'uso ad\n                            un edificio in ');
/*!40000 ALTER TABLE `sc_option_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_plsystemgeneraldata`
--

DROP TABLE IF EXISTS `sc_plsystemgeneraldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_plsystemgeneraldata` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `sc_Metadata_id` int unsigned NOT NULL,
  `sc_gml_Polygon_id` int unsigned NOT NULL COMMENT '(1-1)\nClass: Estensione\nLabel: AN_IP_EXT\nCode: 070801102\nDefinition: Corrisponde alla componente spaziale della Classe"090101 Comune" delle regole tecniche sui databasegeotopografici (allegato DM 10 novembre 2011)',
  `ISTATCode` varchar(16) NOT NULL COMMENT '(1-1)\nClass: codice istat comune\nLabel: AN_IP_IST\nCode: 07080101\nDefinition: Codice ISTAT del comune a cui afferiscel''anagrafica',
  `Region` varchar(40) NOT NULL COMMENT '(1-1)\nClass: regione\nLabel: AN_IP_REG\nCode: 07080103\nDefinition: Regione di appartenenza dell''anagrafica',
  `NumberOfCitizens` int NOT NULL COMMENT '(1-1)\nClass: numero di abitanti\nLabel: AN_IP_N_AB\nCode: 07080104\nDefinition: Numero di abitanti',
  `Surface` double NOT NULL COMMENT '(1-1)\nClass: superficie\nLabel: AN_IP_SUP\nCode: 07080105\nDefinition: Superficie complessiva servita dall''anagrafica[km2]',
  `PersonInCharge` varchar(50) NOT NULL COMMENT '(1-1)\nClass: responsabile comunale\nLabel: AN_IP_RE_C\nCode: 07080106\nDefinition: Cognome e nome del responsabile comunaledell''anagrafica',
  `Overseer` varchar(50) NOT NULL COMMENT '(1-1)\nClass: nome gestore\nLabel: AN_IP_GEST\nCode: 07080107\nDefinition: Nome del gestore dell''anagrafica',
  `ForfaitSystemFlag` enum('true','false') NOT NULL COMMENT '(1-1)\nClass: gestione impianto a forfait\nLabel: AN_IP_GE_F\nCode: 07080108\nDefinition: Discrimina le anagrafiche con impianti di illuminazionepubblica gestiti a forfait',
  `NumberOfConnectedLightSpots` int NOT NULL COMMENT '(1-1)\nClass: punti luce totali\nLabel: AN_IP_N_PL\nCode: 07080109\nDefinition: Numero di punti luce associatiall''anagrafica',
  `NumberOfOwnedLightSpots` int NOT NULL COMMENT '(1-1)\nClass: numero di punti luce di proprietà\nLabel: AN_IP_N_PR\nCode: 07080110',
  PRIMARY KEY (`id`),
  KEY `fk_SC_PLSystemGeneralData_sc_gml_Polygon1_idx` (`sc_gml_Polygon_id`),
  KEY `fk_sc_PLSystemGeneralData_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`),
  KEY `fk_sc_PLSystemGeneralData_sc_Metadata1_idx` (`sc_Metadata_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_plsystemgeneraldata`
--

LOCK TABLES `sc_plsystemgeneraldata` WRITE;
/*!40000 ALTER TABLE `sc_plsystemgeneraldata` DISABLE KEYS */;
INSERT INTO `sc_plsystemgeneraldata` VALUES (128,146,50614,434,'12058091','Lazio',1000,189,'Mario Rossi','Pippo','false',10,8);
/*!40000 ALTER TABLE `sc_plsystemgeneraldata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_pod`
--

DROP TABLE IF EXISTS `sc_pod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_pod` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `PODCode` varchar(14) NOT NULL COMMENT '(1-1)\nClass: codice pod\nLabel: POD_COD\nCode: 07080201\nDefinition: indica il codice identificativo del POD (Point Of Delivery)considerato; il codice POD e'' un codice composto da 14 caratteri cheidentifica in modo certo il punto fisico sulla rete di distribuzione nelterritorio nazionale in cui l''energia viene consegnata dal fornitore eprelevata dal cliente finale',
  PRIMARY KEY (`id`),
  KEY `fk_sc_POD_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`),
  CONSTRAINT `fk_pod_censutech` FOREIGN KEY (`sc_CensusTechSheet_id`) REFERENCES `sc_censustechsheet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_pod`
--

LOCK TABLES `sc_pod` WRITE;
/*!40000 ALTER TABLE `sc_pod` DISABLE KEYS */;
INSERT INTO `sc_pod` VALUES (366,146,'UVAX'),(367,146,'IT000000000ID2');
/*!40000 ALTER TABLE `sc_pod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_podconsumptiondata`
--

DROP TABLE IF EXISTS `sc_podconsumptiondata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_podconsumptiondata` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `sc_POD_id` int unsigned NOT NULL COMMENT '(1-1)\nClass: Pod - consumi\nLabel: POD_C\nCode: 070803\nDefinition: Definisce i consumi del POD. Classe priva di componentespaziale, essendo relazionata agli oggetti contenuti nella Classe POD_A- 070802',
  `sc_Metadata_id` int unsigned NOT NULL,
  `ReportingYear` int DEFAULT NULL COMMENT '(1-1) [nillable]\nClass: anno di riferimento consumi\nLabel: POD_C_DAT\nCode: 07080302\nDefinition: indica l''anno di riferimento sulla base del quale sonocompilati i campi relativi ai consumi (annoprecedente)',
  `ContractType` enum('01','02','03','04','95') NOT NULL COMMENT '(1-1)\nClass: tipologia contratto\nLabel: POD_C_TY\nCode: 07080303\nDefinition: indicala tipologia di contratto stipulata',
  `DistributorName` varchar(50) NOT NULL COMMENT '(1-1)\nClass: denominazione del distributore\nLabel: POD_C_DIS\nCode: 07080304',
  `SupplierName` varchar(50) NOT NULL COMMENT '(1-1)\nClass: denominazione del fornitore\nLabel: POD_C_FOR\nCode: 07080305',
  `InstalledPower` double DEFAULT NULL COMMENT '(1-1) [nillable]\nClass: potenza installata\nLabel: POD_C_KWI\nCode: 07080306\nDefinition: indica la potenza [kW]installata a livello di POD allordo delle perdite di rete e degli ausiliaridell''impianto',
  `PreviousYearAnnualConsumption` double NOT NULL COMMENT '(1-1)\nClass: consumo annuale (anno precedente)\nLabel: POD_C_CON\nCode: 07080307\nDefinition: [kWh/anno]',
  `PreviousYearElectricEnergyAnnualAmount` double NOT NULL COMMENT '(1-1)\nClass: costo annuale (anno precedente) per la sola fornitura dienergia elettrica per pubblica illuminazione\nLabel: POD_C_COS\nCode: 07080308\nDefinition: €/anno iva esclusa',
  `ContractuallyCommittedPower` double NOT NULL COMMENT '(1-1)\nClass: potenza contrattuale impegnata\nLabel: POD_C_KWC\nCode: 07080309\nDefinition: Rappresenta la potenza contrattualmente impegnata [kW],ossia il livello di potenza indicato nei contratti e resodisponibile dal fornitore',
  `PowerFactor` double NOT NULL COMMENT '(1-1)\nClass: cosφ tipico\nLabel: POD_C_COST\nCode: 07080310\nDefinition: Fattore di potenza del sistema elettrico a correntealternata',
  `CurrentYearAnnualConsumption` double NOT NULL COMMENT '(1-1)\nClass: consumo annuale (anno attuale)\nLabel: POD_C_CN_A\nCode: 07080311\nDefinition: [kWh/anno]',
  `CurrentYearElectricEnergyAnnualAmount` double NOT NULL COMMENT '(1-1)\nClass: costo annuale (anno attuale), per la sola fornitura dienergia elettrica per pubblica illuminazione\nLabel: POD_C_CS_A\nCode: 07080312\nDefinition: €/anno iva esclusa',
  PRIMARY KEY (`id`),
  KEY `fk_sc_PODConsumptionData_sc_POD1_idx` (`sc_POD_id`),
  KEY `fk_sc_PODConsumptionData_sc_Metadata1_idx` (`sc_Metadata_id`),
  KEY `fk_sc_PODConsumptionData_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`),
  CONSTRAINT `fk_podConsumption_pod` FOREIGN KEY (`sc_POD_id`) REFERENCES `sc_pod` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_podconsumptiondata`
--

LOCK TABLES `sc_podconsumptiondata` WRITE;
/*!40000 ALTER TABLE `sc_podconsumptiondata` DISABLE KEYS */;
INSERT INTO `sc_podconsumptiondata` VALUES (366,146,366,50624,2018,'02','Ena spa','Alia spa',0.8,302,4000,1.2,0.9,200,2000),(367,146,367,50626,2018,'02','Ena spa','Alia spa',0.8,323,4100,1.2,0.9,195,1960);
/*!40000 ALTER TABLE `sc_podconsumptiondata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sc_podgeneraldata`
--

DROP TABLE IF EXISTS `sc_podgeneraldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc_podgeneraldata` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sc_CensusTechSheet_id` int unsigned NOT NULL,
  `sc_POD_id` int unsigned NOT NULL COMMENT '(1-1)\nClass: POD - Anagrafica del punto di prelievo (POD)dell''elettricita''.\nLabel: POD_A\nCode: 070802\nDefinition: Il POD (Point Of Delivery - punto di prelievo dell''elettricita'')identifica in modo certo il punto fisico sulla rete di distribuzione nelterritorio nazionale in cui l''energia viene consegnata dal fornitore eprelevata dal cliente finale. e'' identificato con un codice alfanumerico(14 caratteri) che serve ad individuare con precisione l''utenza. Il PODe'' il punto di riferimento per la contabilizzazione del consumo dienergia elettrico. In un comune possono esserci più POD, in relazionealle dimensioni del Comune. Ad ogni POD possono essere associati 1 o piùquadri elettrici',
  `sc_Metadata_id` int unsigned NOT NULL,
  `sc_gml_Point_id` int unsigned NOT NULL COMMENT '(1-1)\nClass: Posizione\nLabel: POD_A_POS\nCode: 070802101\nDefinition: corrisponde alla localizzazione geografica delPOD',
  `Toponym` varchar(100) NOT NULL COMMENT '(1-1)\nClass: toponimo stradale pod\nLabel: POD_A_TOP\nCode: 07080202\nDefinition: Nome della strada, via o piazza o largo, etc.,comprensivo di apposizione. Unitamente all''attributo "07080203 -POD_RIF" (elemento StreetNumber) componel''indirizzo',
  `LocationReference` varchar(100) DEFAULT NULL COMMENT '(1-1) [nillable]\nClass: riferimento localizzazione\nLabel: POD_A_RIF\nCode: 07080203\nDefinition: riporta l''eventuale numero civico associato al POD o untesto che ne descriva la prossimita'' ad un oggetto territorialericonosciuto',
  `DetectionDate` date NOT NULL COMMENT '(1-1)\nClass: data del rilievo\nLabel: POD_A_RIL\nCode: 07080204\nDefinition: indica la data in cui e'' stato effettuato il rilievodella situazione del POD in situ',
  `VarietyFlag` enum('true','false') NOT NULL COMMENT '(1-1)\nClass: promiscuita''\nLabel: POD_A_PR\nCode: 07080205\nDefinition: Indica la presenza di situazioni di promiscuita''elettrica (true = presenza di situazioni di promiscuita'', false= assenza di situazioni di promisquita'')',
  `NumberOfElectricPanels` int NOT NULL COMMENT '(1-1)\nClass: numero quadri elettrici\nLabel: POD_A_N_Q\nCode: 07080206\nDefinition: numero quadri elettrici afferenti il POD',
  `NumberOfElectricPanelsToBeChanged` int DEFAULT NULL COMMENT '(1-1) [nillable]\nClass: numero quadri elettrici da sostituire\nLabel: POD_A_N_QS\nCode: 07080207\nDefinition: numero quadri elettrici afferenti il POD dasostituire',
  `NumberOfElectricPanelsToBeReconditioned` int DEFAULT NULL COMMENT '(1-1) [nillable]\nClass: numero quadri elettrici da ricondizionare\nLabel: POD_A_N_QR\nCode: 07080208\nDefinition: numero quadri elettrici afferenti il POD daricondizionare',
  `PODPreservationStatus` enum('01','02','03','91','93','94') DEFAULT NULL COMMENT '(0-1)\nClass: stato di conservazione del manufatto contenente ilpod\nLabel: POD_A_MAN\nCode: 07080209\nDefinition: indica lo stato di conservazione del manufatto checontiene il POD',
  `CustomerID` varchar(50) DEFAULT NULL COMMENT '(0-1) [nillable]\nClass: codice cliente\nLabel: POD_A_CLIE\nCode: 07080210',
  `CustomerID_NoTag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_sc_PODGeneralData_sc_POD1_idx` (`sc_POD_id`),
  KEY `fk_sc_PODGeneralData_sc_gml_Point1_idx` (`sc_gml_Point_id`),
  KEY `fk_sc_PODGeneralData_sc_Metadata1_idx` (`sc_Metadata_id`),
  KEY `fk_sc_PODGeneralData_sc_CensusTechSheet1_idx` (`sc_CensusTechSheet_id`),
  CONSTRAINT `fk_podgeneral_pod` FOREIGN KEY (`sc_POD_id`) REFERENCES `sc_pod` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc_podgeneraldata`
--

LOCK TABLES `sc_podgeneraldata` WRITE;
/*!40000 ALTER TABLE `sc_podgeneraldata` DISABLE KEYS */;
INSERT INTO `sc_podgeneraldata` VALUES (366,146,366,50623,15776,'Via Roma','primo incrocio','2019-03-23','false',2,1,1,'02',NULL,1),(367,146,367,50625,15777,'Via Roma 2','secondo incrocio','2019-03-23','false',1,1,0,'02',NULL,0);
/*!40000 ALTER TABLE `sc_podgeneraldata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `sc_municipality`
--

/*!50001 DROP VIEW IF EXISTS `sc_municipality`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sc_municipality` AS select '' AS `logo`,'' AS `provider_logo`,`scheda_censimento`.`nome_comune` AS `name`,`scheda_censimento`.`provincia` AS `province_id`,`scheda_censimento`.`regione` AS `regione_id`,`scheda_censimento`.`popolazione` AS `inhabitants`,`scheda_censimento`.`superficie` AS `area`,`scheda_censimento`.`responsabile_comunale` AS `responsible`,`scheda_censimento`.`responsabile_telefono` AS `contact_phone`,`scheda_censimento`.`responsabile_email` AS `contact_email` from `scheda_censimento` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-13 13:00:25
