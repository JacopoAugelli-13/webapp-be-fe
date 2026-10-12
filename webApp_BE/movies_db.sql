-- Ho fatto riscrivere il Database perchè non me lo leggeva

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `reviews`;
DROP TABLE IF EXISTS `movies`;

-- ------------------------------------------------------
-- Tabella `movies`
-- ------------------------------------------------------
CREATE TABLE `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `release_year` year DEFAULT NULL,
  `abstract` text,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO `movies` VALUES 
(1,'Inception','Christopher Nolan','Science Fiction',2010,'A skilled thief is given a chance at redemption if he can successfully perform inception.','inception.jpg','2024-11-29 10:40:13','2025-05-22 10:55:27'),
(2,'The Godfather','Francis Ford Coppola','Crime',1972,'The story of a powerful Italian-American crime family and their struggles.','the_godfather.jpg','2024-11-29 10:40:13','2025-05-22 10:55:27'),
(3,'Titanic','James Cameron','Romance',1997,'A romantic story set against the tragic sinking of the RMS Titanic.','titanic.jpg','2024-11-29 10:40:13','2025-05-22 10:55:27'),
(4,'The Matrix','The Wachowskis','Action',1999,'A hacker discovers the truth about his reality and his role in the war against its controllers.','matrix.jpg','2024-11-29 10:40:13','2025-05-22 10:55:27'),
(5,'Interstellar','Christopher Nolan','Science Fiction',2014,'A team of explorers travels through a wormhole in space to save humanity.','interstellar.jpg','2024-11-29 10:40:13','2025-05-22 10:55:27');

-- ------------------------------------------------------
-- Tabella `reviews`
-- ------------------------------------------------------
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `vote` tinyint NOT NULL,
  `text` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_movie` (`movie_id`),
  CONSTRAINT `fk_movie` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_chk_1` CHECK ((`vote` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

INSERT INTO `reviews` VALUES 
(1,1,'Alice',5,'A mind-bending masterpiece.','2024-11-29 10:40:13','2024-11-29 10:40:13'),
(2,1,'Bob',4,'Great visuals and a compelling story.','2024-11-29 10:40:13','2024-11-29 10:40:13'),
(3,1,'Charlie',3,'Confusing at times, but worth watching.','2024-11-29 10:40:13','2024-11-29 10:40:13'),
(4,2,'Diana',5,'The best crime movie ever made.','2024-11-29 10:40:13','2024-11-29 10:40:13'),
(5,2,'Eve',5,'A cinematic classic that never gets old.','2024-11-29 10:40:13','2024-11-29 10:40:13'),(6,2,'Frank',4,'A bit slow-paced but very impactful.','2024-11-29 10:40:13','2024-11-29 10:40:13'),
(7,3,'Grace',5,'A heartbreaking love story.','2024-11-29 10:40:13','2024-11-29 10:40:13'),
(8,3,'Hank',4,'Beautiful visuals and a moving plot.','2024-11-29 10:40:13','2024-11-29 10:40:13'),
(9,3,'Ivy',3,'A bit too melodramatic for my taste.','2024-11-29 10:40:13','2024-11-29 10:40:13'),
(10,4,'Jack',5,'A revolutionary film in every sense.','2024-11-29 10:40:13','2024-11-29 10:40:13'),
(11,4,'Karen',4,'Great action and a thought-provoking plot.','2024-11-29 10:40:13','2024-11-29 10:40:13'),
(12,4,'Liam',4,'A unique take on reality and perception.','2024-11-29 10:40:13','2024-11-29 10:40:13'),
(13,5,'Mia',5,'Visually stunning and emotionally resonant.','2024-11-29 10:40:13','2024-11-29 10:40:13'),
(14,5,'Noah',3,'Interesting ideas but too long.','2024-11-29 10:40:13','2024-11-29 10:40:13'),
(15,5,'Olivia',4,'A beautiful story about love and survival.','2024-11-29 10:40:13','2024-11-29 10:40:13');

SET FOREIGN_KEY_CHECKS = 1;