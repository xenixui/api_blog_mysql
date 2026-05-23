CREATE SCHEMA `blog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 ;
USE `blog` ;

-- -----------------------------------------------------
-- Table `blog`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`authors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `image` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` LONGTEXT NOT NULL,
  `categories_id` INT NOT NULL,
  `authors_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT NOW(),
  PRIMARY KEY (`id`),
  INDEX `fk_posts_categories_idx` (`categories_id` ASC) VISIBLE,
  INDEX `fk_posts_authors1_idx` (`authors_id` ASC) VISIBLE,
  CONSTRAINT `fk_posts_categories`
    FOREIGN KEY (`categories_id`)
    REFERENCES `blog`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posts_authors1`
    FOREIGN KEY (`authors_id`)
    REFERENCES `blog`.`authors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Instert Categorías
-- -----------------------------------------------------

INSERT INTO categories (name) VALUES
('Tecnología'),
('Ciencia'),
('Cultura'),
('Deportes'),
('Política'),
('Economía'),
('Entretenimiento'),
('Viajes'),
('Gastronomía'),
('Otros');

-- -----------------------------------------------------
-- Añado campo de fecha creación en autores
-- -----------------------------------------------------

ALTER TABLE `blog`.`authors` 
ADD COLUMN `created_at` DATETIME NOT NULL DEFAULT NOW() AFTER `image`;

-- -----------------------------------------------------
-- Instert Autores
-- -----------------------------------------------------

INSERT INTO authors (name, email, image) VALUES
('Carlos García', 'carlos.garcia@email.com', 'https://randomuser.me/api/portraits/men/1.jpg'),
('Laura Martínez', 'laura.martinez@email.com', 'https://randomuser.me/api/portraits/women/2.jpg'),
('Pedro Sánchez', 'pedro.sanchez@email.com', NULL),
('Ana López', 'ana.lopez@email.com', 'https://randomuser.me/api/portraits/women/4.jpg'),
('Miguel Fernández', 'miguel.fernandez@email.com', NULL),
('Sara Rodríguez', 'sara.rodriguez@email.com', 'https://randomuser.me/api/portraits/women/6.jpg'),
('Javier González', 'javier.gonzalez@email.com', NULL),
('Elena Díaz', 'elena.diaz@email.com', 'https://randomuser.me/api/portraits/women/8.jpg'),
('David Moreno', 'david.moreno@email.com', 'https://randomuser.me/api/portraits/men/9.jpg'),
('Isabel Ruiz', 'isabel.ruiz@email.com', NULL);

-- -----------------------------------------------------
-- Instert Posts
-- -----------------------------------------------------

INSERT INTO posts (title, description, categories_id, authors_id) VALUES
('El futuro de la inteligencia artificial', 'La inteligencia artificial está transformando todos los sectores de la economía mundial de manera acelerada. Desde la medicina hasta la educación, pasando por la industria y los servicios, ningún ámbito queda ajeno a esta revolución tecnológica.\n\nLos modelos de lenguaje, la visión por computador y el aprendizaje automático están redefiniendo la forma en que trabajamos y nos relacionamos. Empresas de todo el mundo invierten miles de millones en desarrollar sistemas cada vez más capaces.\n\nSin embargo, esta revolución también plantea interrogantes éticos y sociales que la sociedad debe afrontar. El debate sobre la regulación de la IA está más vivo que nunca.', 1, 1),
('Descubrimiento de una nueva especie marina', 'Un equipo de científicos internacionales ha anunciado el descubrimiento de una nueva especie en las profundidades del océano Pacífico, a más de 3.000 metros de profundidad. El hallazgo ha sido posible gracias al uso de submarinos no tripulados de última generación.\n\nLa nueva especie, bautizada provisionalmente como Abyssus luminaris, destaca por su capacidad de bioluminiscencia y su peculiar sistema de locomoción. Los investigadores creen que podría aportar información valiosa sobre la evolución de la vida en condiciones extremas.\n\nEl descubrimiento ha sido publicado en la revista Nature y ha generado un gran interés en la comunidad científica mundial.', 2, 2),
('Los mejores festivales de música del verano', 'El verano se acerca y con él una nueva temporada de festivales de música que promete superar todas las expectativas. Desde los grandes eventos internacionales hasta las propuestas más alternativas, hay opciones para todos los gustos y presupuestos.\n\nEntre los más destacados encontramos el festival de Glastonbury en Reino Unido, el Primavera Sound en Barcelona y el Coachella en California. Cada uno ofrece una experiencia única que va más allá de la música, con gastronomía, arte y cultura.\n\nSi estás pensando en asistir a alguno este año, te recomendamos comprar las entradas con antelación ya que suelen agotarse en pocas horas.', 7, 3),
('La Champions League y su impacto económico', 'La UEFA Champions League es mucho más que una competición de fútbol. Es un fenómeno económico de primera magnitud que mueve miles de millones de euros cada temporada y tiene un impacto directo en las economías locales de las ciudades que acogen sus partidos.\n\nLos derechos televisivos, el merchandising, el turismo deportivo y los patrocinios generan una cadena de valor que beneficia a multitud de sectores. Las ciudades que acogen la final experimentan un incremento notable en la ocupación hotelera y el consumo.\n\nAdemás, los clubes participantes ingresan cantidades millonarias solo por estar presentes en la competición, lo que les permite fichar a los mejores jugadores del mundo.', 4, 4),
('Reforma fiscal: lo que debes saber', 'El gobierno ha aprobado una reforma fiscal que entrará en vigor el próximo ejercicio y que afectará tanto a particulares como a empresas. Los cambios son significativos y es importante conocerlos para planificar correctamente nuestras finanzas.\n\nEntre las principales novedades destaca la modificación de los tramos del IRPF, la nueva tributación de las rentas del capital y los cambios en el Impuesto de Sociedades para las grandes empresas. También se introducen nuevas deducciones para familias con hijos y para la rehabilitación de viviendas.\n\nLos expertos recomiendan consultar con un asesor fiscal para analizar el impacto concreto en cada situación personal o empresarial.', 5, 5),
('Criptomonedas: ¿inversión o burbuja?', 'El mercado de las criptomonedas sigue generando un intenso debate entre los expertos financieros. Mientras unos ven en Bitcoin y otras criptodivisas el futuro del dinero, otros advierten de los riesgos de una posible burbuja especulativa.\n\nLos últimos meses han sido especialmente volátiles, con subidas y bajadas de precio que han puesto a prueba los nervios de los inversores. La regulación cada vez más estricta en varios países ha añadido incertidumbre al mercado.\n\nSi estás pensando en invertir en criptomonedas, los expertos aconsejan no invertir más de lo que estés dispuesto a perder y diversificar siempre la cartera de inversión.', 6, 6),
('Las mejores series de 2026', 'El año 2026 está siendo excepcional en cuanto a producción audiovisual. Las grandes plataformas de streaming han apostado fuerte por contenidos de calidad y los resultados están a la vista, con series que están dando que hablar en todo el mundo.\n\nEntre los estrenos más destacados encontramos producciones de HBO, Netflix y Amazon que han conseguido captar la atención de millones de espectadores. Los géneros más populares siguen siendo el drama, el thriller y la ciencia ficción.\n\nLa producción española también está viviendo un momento dulce, con series que han traspasado fronteras y se han convertido en fenómenos internacionales.', 7, 7),
('Ruta por el norte de España', 'El norte de España esconde algunos de los paisajes más impresionantes de la península ibérica. Desde los acantilados de la Costa da Morte en Galicia hasta los Picos de Europa en Asturias, pasando por las playas del País Vasco y los valles de Cantabria.\n\nUna ruta por el norte de España es una experiencia que combina naturaleza, gastronomía y cultura de primer nivel. El Camino de Santiago, los parques naturales y las ciudades medievales son solo algunos de los atractivos que ofrece esta zona.\n\nLa mejor época para visitarla es entre mayo y septiembre, aunque el otoño también ofrece paisajes espectaculares con los bosques teñidos de colores cálidos.', 8, 8),
('Recetas tradicionales de la abuela', 'En un mundo dominado por la comida rápida y los ultraprocesados, cada vez más personas redescubren el valor de la cocina tradicional. Las recetas que nos preparaban nuestras abuelas no solo son deliciosas sino que forman parte de nuestra identidad cultural.\n\nPlatos como el cocido madrileño, la fabada asturiana o el gazpacho andaluz son mucho más que recetas, son historia viva de nuestros pueblos y ciudades. Prepararlos en casa es una forma de mantener viva esa herencia.\n\nEn este artículo te enseñamos paso a paso cómo preparar algunos de estos clásicos con los trucos y secretos que solo conocen quienes los han cocinado toda la vida.', 9, 9),
('Blockchain más allá de las criptomonedas', 'La tecnología blockchain ha dejado de ser sinónimo exclusivo de criptomonedas para convertirse en una herramienta con aplicaciones en sectores tan diversos como la sanidad, la logística o la administración pública.\n\nSu capacidad para garantizar la trazabilidad y la inmutabilidad de los datos la convierte en una solución ideal para problemas como la falsificación de medicamentos, la gestión de cadenas de suministro o el registro de propiedades.\n\nVarias empresas y gobiernos de todo el mundo ya están implementando soluciones basadas en blockchain con resultados prometedores que apuntan a una adopción masiva en los próximos años.', 1, 10),
('El cambio climático y sus consecuencias', 'El cambio climático ya no es una amenaza futura sino una realidad presente que se manifiesta en fenómenos meteorológicos extremos cada vez más frecuentes e intensos. Sequías, inundaciones y olas de calor son la nueva normalidad en muchas partes del mundo.\n\nLos científicos advierten de que queda poco tiempo para actuar y revertir los peores escenarios. La transición hacia las energías renovables, la reducción de emisiones y el cambio en los patrones de consumo son medidas urgentes e imprescindibles.\n\nLos ciudadanos también pueden contribuir con pequeños cambios en su vida cotidiana que, sumados, tienen un impacto significativo en la reducción de la huella de carbono.', 2, 1),
('Teatro contemporáneo en Madrid', 'Madrid vive una época dorada en cuanto a teatro contemporáneo. Los principales teatros de la capital ofrecen esta temporada una programación variada y ambiciosa que mezcla clásicos revisitados con propuestas escénicas completamente innovadoras.\n\nCompañías nacionales e internacionales se dan cita en los escenarios madrileños con espectáculos que exploran nuevos lenguajes teatrales y abordan temáticas de plena actualidad social y política.\n\nSi eres amante del teatro o simplemente quieres descubrir este arte, Madrid es ahora mismo uno de los mejores destinos europeos para hacerlo.', 3, 2);