-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: id26346990
-- ------------------------------------------------------
-- Server version	5.6.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `id26346990`;
CREATE DATABASE IF NOT EXISTS `id26346990` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `id26346990`;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `writer` varchar(255) DEFAULT NULL,
  `stars` varchar(255) DEFAULT NULL,
  `genres` varchar(255) DEFAULT NULL,
  `plot` varchar(2048) DEFAULT NULL,
  `rating` decimal(4,2) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Hachi: A Dog\'s Tale','Lasse Hallstrom ','Stephen P. Lindsey (screenplay), Kaneto Shindô (motion picture \"Hachiko monogatari\") ','Richard Gere, Joan Allen, Cary-Hiroyuki Tagawa','Drama |  Family','In Bedridge, Professor Parker Wilson finds an abandoned dog at the train station and takes it home with the intention of returning the animal to its owner. He finds that the dog is an Akita and names it Hachiko. However, nobody claims the dog so his family decides to keep Hachi. However, nobody claims the dog so his family decides to keep Hachi.',8.20,'12 March 2010 (UK)','http://ia.media-imdb.com/images/M/MV5BMTAxMDA2MjM4NDReQTJeQWpwZ15BbWU3MDE0NTgxMTM@._V1_SY317_CR3,0,214,317_AL_.jpg','https://www.youtube.com/watch?v=drTiv5r57nI&feature=player_detailpage'),(2,'Kung Fu Panda','Mark Osborne, John Stevenson ','Jonathan Aibel (screenplay), Glenn Berger (screenplay)','Jack Black, Ian McShane, Angelina Jolie','Animation |  Action |  Adventure |  Comedy |  Family','It\'s the story about a lazy, irreverent slacker panda, named Po, who is the biggest fan of Kung Fu around...which doesn\'t exactly come in handy while working every day in his family\'s noodle shop. Unexpectedly chosen to fulfill an ancient prophecy, Po\'s dreams become reality when he joins the world of Kung Fu and studies alongside his idols, the legendary Furious Five,  studies alongside his idols,  studies alongside his idols.',7.60,'6 June 2008 (USA)','http://ia.media-imdb.com/images/M/MV5BMTIxOTY1NjUyN15BMl5BanBnXkFtZTcwMjMxMDk1MQ@@._V1_SX214_AL_.jpg','https://www.youtube.com/watch?v=hUMaIR5Ubd4&feature=player_detailpage'),(3,'Madagascar','Eric Darnell, Tom McGrath','Mark Burton, Billy Frolick','Chris Rock, Ben Stiller, David Schwimmer','Animation |  Adventure |  Comedy |  Family','At New York\'s Central Park Zoo, a lion, a zebra, a giraffe, and a hippo are best friends and stars of the show. But when one of the animals goes missing from their cage, the other three break free to look for him, only to find themselves reunited on a ship route to Africa. When their vessel is hijacked, however, the friends, who have all been raised in captivity, learn first-hand what life in the wild. ',6.90,'27 May 2005 (USA)','http://ia.media-imdb.com/images/M/MV5BMTY4NDUwMzQxMF5BMl5BanBnXkFtZTcwMDgwNjgyMQ@@._V1_SX214_AL_.jpg','https://www.youtube.com/watch?v=_FvCgabQVjA&feature=player_detailpage'),(4,'Spider-Man','Sam Raimi','Stan Lee (Marvel comic book), Steve Ditko (Marvel comic book)','Tobey Maguire, Kirsten Dunst, Willem Dafoe','Action | Adventure','Based on Marvel Comics\' superhero character, this is a story of Peter Parker who is a nerdy high-schooler. He was orphaned as a child, bullied by jocks, and can\'t confess his crush for his stunning neighborhood girl Mary Jane Watson. To say his life is \"miserable\" is an understatement. But one day while on an excursion to a laboratory a runaway radioactive spider bites him... ',7.30,'7 August 2002 (China)','http://ia.media-imdb.com/images/M/MV5BMzk3MTE5MDU5NV5BMl5BanBnXkFtZTYwMjY3NTY3._V1_SY317_CR0,0,214,317_AL_.jpg','https://youtu.be/EQdOOTQnuvk'),(5,'Sinister 2','Ciarn Foy','Scott Derrickson, C. Robert Cargill','James Ransone, Shannyn Sossamon, Robert Daniel Sloan','Horror','A young mother and her twin sons move into a rural house that\'s marked for death. A young mother and her twin sons move into a rural house that\'s marked for death. A young mother and her twin sons move into a rural house that\'s marked for death. A young mother and her twin sons move into a rural house that\'s marked for death. A young mother and her twin sons move into a rural house that\'s marked for death. ',7.20,'21 August 2015 (USA)','http://ia.media-imdb.com/images/M/MV5BMjQ2NTM5NzU3MF5BMl5BanBnXkFtZTgwMDAwMTQyNTE@._V1_SX214_AL_.jpg','https://youtu.be/WD8PqnLG-KQ'),(125,'Big Hero 6','Don Hall, Chris Williams ','Jordan Roberts (screenplay), Robert L. Baird (screenplay)','Ryan Potter, Scott Adsit, Jamie Chung','Animation |  Action |  Adventure |  Comedy |  Family |  Sci-Fi ','From Walt Disney Animation Studios, the team behind \"Frozen\" and \"Wreck-It Ralph,\" comes \"Big Hero 6,\" an action-packed comedy-adventure about the special bond that develops between Baymax, a plus-sized inflatable robot, and prodigy Hiro Hamada. When a devastating event befalls the city of San Fransokyo and catapults Hiro into the midst of danger, he turns to Baymax.',7.90,'7 November 2014 (USA) ','http://ia.media-imdb.com/images/M/MV5BMjI4MTIzODU2NV5BMl5BanBnXkFtZTgwMjE0NDAwMjE@._V1_SY317_CR0,0,214,317_AL_.jpg','https://www.youtube.com/watch?feature=player_detailpage&v=z3biFxZIJOQ'),(126,'Frozen (I)','Chris Buck, Jennifer Lee ',' Jennifer Lee (screenplay), Hans Christian Andersen (inspired by the story \"The Snow Queen\")','Kristen Bell, Idina Menzel, Jonathan Groff ','Animation |  Adventure |  Comedy |  Family |  Fantasy |  Musical','Anna, a fearless optimist, sets off on an epic journey - teaming up with rugged mountain man Kristoff and his loyal reindeer Sven - to find her sister Elsa, whose icy powers have trapped the kingdom of Arendelle in eternal winter. Encountering Everest-like conditions, mystical trolls and a hilarious snowman named Olaf, Anna and Kristoff battle the elements in a race to save the kingdom. ',7.60,'27 November 2013 (USA) ','http://ia.media-imdb.com/images/M/MV5BMTQ1MjQwMTE5OF5BMl5BanBnXkFtZTgwNjk3MTcyMDE@._V1_SX214_AL_.jpg','https://www.youtube.com/watch?feature=player_detailpage&v=L0MK7qz13bU'),(127,'2012 (I)','Roland Emmerich','Roland Emmerich, Harald Kloser','John Cusack, Thandie Newton, Chiwetel Ejiofor','Action | Adventure | Sci-Fi','Dr. Adrian Helmsley, part of a worldwide geophysical team investigating the effect on the earth of radiation from unprecedented solar storms, learns that the earth\'s core is heating up. He warns U.S. President Thomas Wilson that the crust of the earth is becoming unstable and that without proper preparations for saving a fraction of the world\'s population, the entire race is doomed. ',5.80,'13 November 2009 (China)','http://ia.media-imdb.com/images/M/MV5BMTY0MjEyODQzMF5BMl5BanBnXkFtZTcwMTczMjQ4Mg@@._V1_SX214_AL_.jpg','https://youtu.be/7mnSjau4_is'),(128,'Men in Black','Barry Sonnenfeld','Lowell Cunningham (comic), Ed Solomon (screen story)','Tommy Lee Jones, Will Smith, Linda Fiorentino','Comedy | Sci-Fi','Based off of the comic book. Unbeknownst to other people, there is a private agency code named MiB. This agency is some kind of extra terrestrial surveillance corporation. Then, one of the agency\'s finest men only going by the name \"K\", is recruiting for a new addition to the agency. He has chosen James Edwards of the N.Y.P.D. Then, one day, a flying saucer crashes into Earth.',7.20,'2 July 1997 (USA)','http://ia.media-imdb.com/images/M/MV5BNzA2MzI5Nzc0N15BMl5BanBnXkFtZTcwODE2NDU2MQ@@._V1_SY317_CR1,0,214,317_AL_.jpg','https://youtu.be/HYUd7AOw_lk'),(129,'The Day After Tomorrow','Roland Emmerich','Roland Emmerich (story), Roland Emmerich (screenplay)','Dennis Quaid, Jake Gyllenhaal, Emmy Rossum ','Action | Adventure | Sci-Fi | Thriller','As Paleoclimatologist named Jack Hall is in Antartica, he discovers that a huge ice sheet has sheared off. But what he does not know is that this event will trigger a massive climate shift that will affect the world population. Meanwhile, his son Sam is with friends in New York to attend an event. There they discover that it has been raining non-stop for the past 3 weeks...',6.40,'28 May 2004 (China)','http://ia.media-imdb.com/images/M/MV5BMTU1NTA3NzMwOV5BMl5BanBnXkFtZTcwNzEzMTEzMw@@._V1_SX214_AL_.jpg','https://youtu.be/1c3RB2eP5pw'),(130,'Ice Age','Chris Wedge, Carlos Saldanha','Michael J. Wilson (story), Michael Berg (screenplay)','Denis Leary, John Leguizamo, Ray Romano','Animation | Adventure | Comedy | Family','Back when the Earth was being overrun by glaciers, and animals were scurrying to save themselves from the upcoming Ice Age, a sloth named Sid, a woolly mammoth named Manny, and a saber-toothed tiger named Diego are forced to become unlikely heroes. The three reluctantly come together when they have to return a human child to its father while braving the deadly elements of the impending Ice Age.',7.60,'15 March 2002 (USA)','http://ia.media-imdb.com/images/M/MV5BMjEyNzI1ODA0MF5BMl5BanBnXkFtZTYwODIxODY3._V1_SX214_AL_.jpg','https://youtu.be/M-D64vzGd00');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-17 21:19:36
