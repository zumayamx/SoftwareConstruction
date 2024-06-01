-- Author: José Manuel García Zumaya
-- Date: 2024-06-01
-- Description: This script creates a database schema for a Pokémon TCG database.
-- The schema includes tables for energies, skills, energy attributes, attacks, attack energies, 
-- evolutions, names by evolution, tools, coach cards type, energy cards, coach cards, pokemon cards, 
-- pokemon card weaknesses, and pokemon card endurances.

-- Drop the database if it exists
DROP SCHEMA IF EXISTS pokemon_tcg;

-- Create the database
CREATE SCHEMA pokemon_tcg;

-- Use the database
USE pokemon_tcg;

-- Drop the table if it exists
DROP TABLE IF EXISTS Energies;

-- Create the table Energies
CREATE TABLE Energies (
    id_energy INT NOT NULL AUTO_INCREMENT,
    energy_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_energy)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Drop the table if it exists
DROP TABLE IF EXISTS Skills;

-- Create the table Skills
CREATE TABLE Skills (
    id_skill INT NOT NULL AUTO_INCREMENT,
    skill_name VARCHAR(50) NOT NULL,
    skill_description VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_skill)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Drop the table if it exists
DROP TABLE IF EXISTS EnergyAttributes;

-- Create the table EnergyAttributes
CREATE TABLE EnergyAttributes (
    id_energy_attribute INT NOT NULL AUTO_INCREMENT,
    energy_type INT NOT NULL,
    value_weakness_or_endurance INT NOT NULL,
    PRIMARY KEY (id_energy_attribute),
    FOREIGN KEY (energy_type) REFERENCES Energies (id_energy)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Drop the table if it exists
DROP TABLE IF EXISTS Attacks;

-- Create the table Attacks
CREATE TABLE Attacks (
    id_attack INT NOT NULL AUTO_INCREMENT,
    attack_description VARCHAR(255) NOT NULL,
    skill INT NOT NULL,
    PRIMARY KEY (id_attack),
    FOREIGN KEY (skill) REFERENCES Skills(id_skill)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Drop the table if it exists
DROP TABLE IF EXISTS AttackEnergies;

-- Create the table AttackEnergies
CREATE TABLE AttackEnergies( 
    id_attack_energy INT NOT NULL AUTO_INCREMENT,
    id_attack INT NOT NULL,
    id_energy_needed INT NOT NULL,
    number_energies_needed INT NOT NULL,
    PRIMARY KEY (id_attack_energy),
    FOREIGN KEY (id_attack) REFERENCES Attacks (id_attack),
    FOREIGN KEY (id_energy_needed) REFERENCES Energies (id_energy)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Drop the table if it exists
DROP TABLE IF EXISTS Evolutions;

-- Create the table Evolutions
CREATE TABLE Evolutions (
    evolution_id INT NOT NULL AUTO_INCREMENT,
    evolution_type VARCHAR(50) NOT NULL,
    PRIMARY KEY (evolution_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Drop the table if it exists
DROP TABLE IF EXISTS NamesByEvolution;

-- Create the table NamesByEvolution
CREATE TABLE NamesByEvolution (
    id_name INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    evolution_relation INT NOT NULL,
    PRIMARY KEY (id_name),
    FOREIGN KEY (evolution_relation) REFERENCES Evolutions (evolution_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Drop the table if it exists
DROP TABLE IF EXISTS Tools;

-- Create the table Tools
CREATE TABLE Tools (
    tool_id INT NOT NULL AUTO_INCREMENT,
    tool_description VARCHAR(255) NOT NULL,
    PRIMARY KEY (tool_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Drop the table if it exists
DROP TABLE IF EXISTS CoachCardsType;

-- Create the table CoachCardsType
CREATE TABLE CoachCardsType (
    type_id INT NOT NULL AUTO_INCREMENT,
    type_name VARCHAR(50),
    PRIMARY KEY (type_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Drop the table if it exists
DROP TABLE IF EXISTS EnergyCards;

-- Create the table EnergyCards
CREATE TABLE EnergyCards (
    energycard_id INT NOT NULL AUTO_INCREMENT,
    energycard_description VARCHAR(255) NOT NULL,
    energycard_type INT NOT NULL,
    PRIMARY KEY (energycard_id),
    FOREIGN KEY (energycard_type) REFERENCES Energies (id_energy)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Drop the table if it exists
DROP TABLE IF EXISTS CoachCards;

-- Create the table CoachCards
CREATE TABLE CoachCards (
    coachcard_id INT NOT NULL AUTO_INCREMENT,
    coachcard_type INT NOT NULL,
    coachcard_description VARCHAR(255) NOT NULL,
    tool_relation INT NOT NULL,
    PRIMARY KEY (coachcard_id),
    FOREIGN KEY (coachcard_type) REFERENCES CoachCardsType (type_id),
    FOREIGN KEY (tool_relation) REFERENCES Tools (tool_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Drop the table if it exists
DROP TABLE IF EXISTS PokemonCards;

-- Create the table PokemonCards
CREATE TABLE PokemonCards (
    pokemoncard_id INT NOT NULL AUTO_INCREMENT,
    pokemon_name INT NOT NULL,
    ps INT NOT NULL,
    type_energy INT NOT NULL,
    attack INT NOT NULL,
    skill INT NOT NULL,
    energy_retirement_cost INT NOT NULL,
    PRIMARY KEY (pokemoncard_id),
    FOREIGN KEY (pokemon_name) REFERENCES NamesByEvolution (id_name),
    FOREIGN KEY (type_energy) REFERENCES Energies (id_energy),
    FOREIGN KEY (attack) REFERENCES Attacks (id_attack),
    FOREIGN KEY (skill) REFERENCES Skills (id_skill)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Drop the table if it exists
DROP TABLE IF EXISTS PokemonCardWeaknesses;

-- Create the table PokemonCardWeaknesses
CREATE TABLE PokemonCardWeaknesses (
    pokemoncard_id INT NOT NULL,
    weakness_id INT NOT NULL,
    FOREIGN KEY (pokemoncard_id) REFERENCES PokemonCards (pokemoncard_id),
    FOREIGN KEY (weakness_id) REFERENCES EnergyAttributes (id_energy_attribute)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Drop the table if it exists
DROP TABLE IF EXISTS PokemonCardEndurances;

-- Create the table PokemonCardEndurances
CREATE TABLE PokemonCardEndurances (
    pokemoncard_id INT NOT NULL,
    endurance_id INT NOT NULL,
    FOREIGN KEY (pokemoncard_id) REFERENCES PokemonCards (pokemoncard_id),
    FOREIGN KEY (endurance_id) REFERENCES EnergyAttributes (id_energy_attribute)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert dummy data into the Energies table
INSERT INTO Energies (energy_name) VALUES
('Grass'),
('Fire'),
('Water'),
('Lightning'),
('Psychic'),
('Fighting'),
('Darkness'),
('Metal'),
('Fairy'),
('Dragon'),
('Colorless');

-- Insert dummy data into the Skills table
INSERT INTO Skills (skill_name, skill_description) VALUES
('Asleep', 'The Pokémon cannot attack or retreat during its turn.'),
('Burned', 'The Pokémon takes 20 damage between turns.'),
('Confused', 'The Pokémon has a 50% chance of damaging itself when it attacks.'),
('Paralyzed', 'The Pokémon cannot attack or retreat during its turn.'),
('Poisoned', 'The Pokémon takes 10 damage between turns.'),
('None', 'No skill assigned.');

-- Insert dummy data into the EnergyAttributes table
INSERT INTO EnergyAttributes (energy_type, value_weakness_or_endurance) VALUES
(1, 10), -- Grass
(2, 20), -- Fire
(3, 15), -- Water
(4, 12), -- Lightning
(5, 8),  -- Psychic
(6, 25), -- Fighting
(7, 18), -- Darkness
(8, 22), -- Metal
(9, 14), -- Fairy
(10, 30), -- Dragon
(11, 5); -- Colorless

-- Insert dummy data into the Attacks table
INSERT INTO Attacks (attack_description, skill) VALUES
('Thunder Shock: Flip a coin. If heads, the opponent\'s Pokémon is now Paralyzed.', 4), -- Paralyzed
('Ember: Discard a Fire Energy attached to this Pokémon.', 2), -- Burned
('Confuse Ray: Flip a coin. If heads, the opponent\'s Pokémon is now Confused.', 3), -- Confused
('Sleep Powder: The opponent\'s Pokémon is now Asleep.', 1), -- Asleep
('Poison Sting: The opponent\'s Pokémon is now Poisoned.', 5), -- Poisoned
('Tackle: No additional effects.', 6); -- None (No skill)

-- Insert dummy data into the AttackEnergies table
INSERT INTO AttackEnergies (id_attack, id_energy_needed, number_energies_needed) VALUES
(1, 4, 1), -- Thunder Shock requires 1 Lightning Energy
(2, 2, 2), -- Ember requires 2 Fire Energy
(3, 5, 1), -- Confuse Ray requires 1 Psychic Energy
(4, 1, 1), -- Sleep Powder requires 1 Grass Energy
(5, 3, 3), -- Poison Sting requires 3 Water Energy
(6, 11, 1); -- Tackle requires 1 Colorless Energy

-- Insert dummy data into the Evolutions table
INSERT INTO Evolutions (evolution_type) VALUES
('Basic'),
('Stage One'),
('Stage Two'),
('Stage Three');

-- Insert dummy data into the NamesByEvolution table
INSERT INTO NamesByEvolution (name, evolution_relation) VALUES
('Pikachu', 1), -- Basic
('Raichu', 2), -- Stage One
('Bulbasaur', 1), -- Basic
('Ivysaur', 2), -- Stage One
('Venusaur', 3), -- Stage Two
('Charmander', 1), -- Basic
('Charmeleon', 2), -- Stage One
('Charizard', 3), -- Stage Two
('Squirtle', 1), -- Basic
('Wartortle', 2), -- Stage One
('Blastoise', 3), -- Stage Two
('Caterpie', 1), -- Basic
('Metapod', 2), -- Stage One
('Butterfree', 3), -- Stage Two
('Weedle', 1), -- Basic
('Kakuna', 2), -- Stage One
('Beedrill', 4); -- Stage Three

-- Insert dummy data into the Tools table
INSERT INTO Tools (tool_description) VALUES
('None'),
('Helmet'),
('Shield'),
('Potion'),
('Escape Rope'),
('Exp. Share'),
('Lucky Egg'),
('Muscle Band'),
('Focus Sash'),
('Rocky Helmet'),
('Assault Vest');

-- Insert dummy data into the CoachCardsType table
INSERT INTO CoachCardsType (type_name) VALUES
('Item'),
('Stadium'),
('Supporter');

-- Insert dummy data into the CoachCards table
INSERT INTO CoachCards (coachcard_type, coachcard_description, tool_relation) VALUES
(1, 'Potion: Heal 30 damage from one of your Pokémon.', 3), -- Item related to tool
(1, 'Escape Rope: Switch your Active Pokémon with one of your Benched Pokémon.', 4), -- Item related to tool
(1, 'Lucky Egg: If the Pokémon this card is attached to is Knocked Out, draw cards until you have 7 cards in your hand.', 6), -- Item related to tool
(1, 'Muscle Band: The attacks of the Pokémon this card is attached to do 20 more damage.', 7), -- Item related to tool
(1, 'Rocky Helmet: If the Pokémon this card is attached to is your Active Pokémon and is damaged by an opponent\'s attack, put 2 damage counters on the Attacking Pokémon.', 9), -- Item related to tool
(2, 'Viridian Forest: Once during each player\'s turn, that player may discard a card from their hand. If they do, that player searches their deck for a Basic Energy card, reveals it, and puts it into their hand. Then, that player shuffles their deck.', 1), -- Stadium not related to tool
(2, 'Wondrous Labyrinth: The attacks of non-Fairy Pokémon (both yours and your opponent\'s) cost Colorless more.', 1), -- Stadium not related to tool
(3, 'Professor\'s Research: Discard your hand and draw 7 cards.', 1), -- Supporter not related to tool
(3, 'Boss\'s Orders: Switch one of your opponent\'s Benched Pokémon with their Active Pokémon.', 1), -- Supporter not related to tool
(3, 'Marnie: Each player shuffles their hand and puts it on the bottom of their deck. If either player puts any cards on the bottom of their deck in this way, you draw 5 cards, and your opponent draws 4 cards.', 1); -- Supporter not related to tool

-- Insert dummy data into the EnergyCards table
INSERT INTO EnergyCards (energycard_description, energycard_type) VALUES
('Provides Grass Energy.', 1),     -- Grass
('Provides Fire Energy.', 2),      -- Fire
('Provides Water Energy.', 3),     -- Water
('Provides Lightning Energy.', 4), -- Lightning
('Provides Psychic Energy.', 5),   -- Psychic
('Provides Fighting Energy.', 6),  -- Fighting
('Provides Darkness Energy.', 7),  -- Darkness
('Provides Metal Energy.', 8),     -- Metal
('Provides Fairy Energy.', 9),     -- Fairy
('Provides Dragon Energy.', 10),   -- Dragon
('Provides Colorless Energy.', 11);-- Colorless

-- Insert dummy data into the PokemonCards table
INSERT INTO PokemonCards (pokemon_name, ps, type_energy, attack, skill, energy_retirement_cost) VALUES
(1, 60, 4, 1, 4, 1), -- Pikachu, 60 HP, Lightning, Thunder Shock, Paralyzed, 1 energy retirement
(2, 90, 4, 1, 4, 2), -- Raichu, 90 HP, Lightning, Thunder Shock, Paralyzed, 2 energy retirement
(3, 45, 1, 5, 5, 1), -- Bulbasaur, 45 HP, Grass, Poison Sting, Poisoned, 1 energy retirement
(4, 60, 1, 5, 5, 2), -- Ivysaur, 60 HP, Grass, Poison Sting, Poisoned, 2 energy retirement
(5, 100, 1, 5, 5, 3), -- Venusaur, 100 HP, Grass, Poison Sting, Poisoned, 3 energy retirement
(6, 50, 2, 2, 2, 1), -- Charmander, 50 HP, Fire, Ember, Burned, 1 energy retirement
(7, 70, 2, 2, 2, 2), -- Charmeleon, 70 HP, Fire, Ember, Burned, 2 energy retirement
(8, 120, 2, 2, 2, 3), -- Charizard, 120 HP, Fire, Ember, Burned, 3 energy retirement
(9, 50, 3, 3, 3, 1), -- Squirtle, 50 HP, Water, Confuse Ray, Confused, 1 energy retirement
(10, 70, 3, 3, 3, 2), -- Wartortle, 70 HP, Water, Confuse Ray, Confused, 2 energy retirement
(11, 120, 3, 3, 3, 3), -- Blastoise, 120 HP, Water, Confuse Ray, Confused, 3 energy retirement
(12, 30, 1, 4, 1, 1), -- Caterpie, 30 HP, Grass, Sleep Powder, Asleep, 1 energy retirement
(13, 50, 1, 4, 1, 2), -- Metapod, 50 HP, Grass, Sleep Powder, Asleep, 2 energy retirement
(14, 90, 1, 4, 1, 3), -- Butterfree, 90 HP, Grass, Sleep Powder, Asleep, 3 energy retirement
(15, 30, 1, 6, 6, 1), -- Weedle, 30 HP, Grass, Lucky Egg, None, 1 energy retirement
(16, 50, 1, 6, 6, 2), -- Kakuna, 50 HP, Grass, Lucky Egg, None, 2 energy retirement
(17, 90, 1, 6, 6, 3); -- Beedrill, 90 HP, Grass, Lucky Egg, None, 3 energy retirement

-- Insert dummy data into the PokemonCardWeaknesses table
INSERT INTO PokemonCardWeaknesses (pokemoncard_id, weakness_id) VALUES
(1, 2),  -- Pikachu is weak to Fire
(2, 2),  -- Raichu is weak to Fire
(3, 4),  -- Bulbasaur is weak to Lightning
(4, 4),  -- Ivysaur is weak to Lightning
(5, 4),  -- Venusaur is weak to Lightning
(6, 3),  -- Charmander is weak to Water
(7, 3),  -- Charmeleon is weak to Water
(8, 3),  -- Charizard is weak to Water
(9, 2),  -- Squirtle is weak to Fire
(10, 2), -- Wartortle is weak to Fire
(11, 2), -- Blastoise is weak to Fire
(12, 5), -- Caterpie is weak to Psychic
(13, 5), -- Metapod is weak to Psychic
(14, 5), -- Butterfree is weak to Psychic
(15, 6), -- Weedle is weak to Fighting
(16, 6), -- Kakuna is weak to Fighting
(17, 6); -- Beedrill is weak to Fighting

-- Insert dummy data into the PokemonCardEndurances table
INSERT INTO PokemonCardEndurances (pokemoncard_id, endurance_id) VALUES
(1, 5),  -- Pikachu resists Psychic
(2, 5),  -- Raichu resists Psychic
(3, 7),  -- Bulbasaur resists Darkness
(4, 7),  -- Ivysaur resists Darkness
(5, 7),  -- Venusaur resists Darkness
(6, 9),  -- Charmander resists Fairy
(7, 9),  -- Charmeleon resists Fairy
(8, 9),  -- Charizard resists Fairy
(9, 8),  -- Squirtle resists Metal
(10, 8), -- Wartortle resists Metal
(11, 8), -- Blastoise resists Metal
(12, 6), -- Caterpie resists Fighting
(13, 6), -- Metapod resists Fighting
(14, 6), -- Butterfree resists Fighting
(15, 1), -- Weedle resists Grass
(16, 1), -- Kakuna resists Grass
(17, 1); -- Beedrill resists Grass

-- Selecciona información completa de una carta de Pokémon específica
-- Este query devuelve información detallada de una carta de Pokémon
-- específica, incluyendo su nombre, puntos de salud (PS), tipo de energía,
-- descripción del ataque, nombre y descripción de la habilidad, y el costo de retiro de energía.
-- 
-- JOINs:
-- - Une la tabla `PokemonCards` con `NamesByEvolution` para obtener el nombre del Pokémon.
-- - Une la tabla `PokemonCards` con `Energies` para obtener el tipo de energía del Pokémon.
-- - Une la tabla `PokemonCards` con `Attacks` para obtener la descripción del ataque del Pokémon.
-- - Une la tabla `PokemonCards` con `Skills` para obtener el nombre y descripción de la habilidad del Pokémon.
--
-- WHERE:
-- Filtra los resultados para mostrar solo la carta del Pokémon cuyo nombre es
-- 'Pikachu'. Puedes cambiar 'Pikachu' por el nombre de cualquier otro Pokémon que desees consultar.
SELECT 
    pc.pokemoncard_id,
    nbe.name AS pokemon_name,
    pc.ps,
    e.energy_name AS type_energy,
    a.attack_description,
    s.skill_name,
    s.skill_description,
    pc.energy_retirement_cost
FROM 
    PokemonCards pc
JOIN 
    NamesByEvolution nbe ON pc.pokemon_name = nbe.id_name
JOIN 
    Energies e ON pc.type_energy = e.id_energy
JOIN 
    Attacks a ON pc.attack = a.id_attack
JOIN 
    Skills s ON pc.skill = s.id_skill
WHERE 
    nbe.name = 'Pikachu'; 

-- Selecciona información completa de todas las cartas de Pokémon
-- Este query devuelve información detallada de todas las cartas de Pokémon,
-- incluyendo su nombre, puntos de salud (PS), tipo de energía,
-- descripción del ataque, nombre y descripción de la habilidad, y el costo de retiro de energía.
-- 
-- JOINs:
-- - Une la tabla `PokemonCards` con `NamesByEvolution` para obtener el nombre del Pokémon.
-- - Une la tabla `PokemonCards` con `Energies` para obtener el tipo de energía del Pokémon.
-- - Une la tabla `PokemonCards` con `Attacks` para obtener la descripción del ataque del Pokémon.
-- - Une la tabla `PokemonCards` con `Skills` para obtener el nombre y descripción de la habilidad del Pokémon.
SELECT 
    pc.pokemoncard_id,
    nbe.name AS pokemon_name,
    pc.ps,
    e.energy_name AS type_energy,
    a.attack_description,
    s.skill_name,
    s.skill_description,
    pc.energy_retirement_cost
FROM 
    PokemonCards pc
JOIN 
    NamesByEvolution nbe ON pc.pokemon_name = nbe.id_name
JOIN 
    Energies e ON pc.type_energy = e.id_energy
JOIN 
    Attacks a ON pc.attack = a.id_attack
JOIN 
    Skills s ON pc.skill = s.id_skill;

-- Selecciona información sobre las cartas de entrenador incluyendo su tipo y una herramienta relacionada
-- Este query devuelve detalles de las cartas de entrenador (CoachCards),
-- el tipo de cada carta, y la descripción de una herramienta relacionada.
--
-- JOINs:
-- - Une la tabla `CoachCards` con `CoachCardsType` para obtener el nombre del tipo de carta de entrenador.
-- - Une la tabla `CoachCards` con `Tools` para obtener la descripción de la herramienta relacionada.
SELECT 
    cc.coachcard_id,
    cct.type_name AS coachcard_type,
    cc.coachcard_description,
    t.tool_description
FROM 
    CoachCards cc
JOIN 
    CoachCardsType cct ON cc.coachcard_type = cct.type_id
JOIN 
    Tools t ON cc.tool_relation = t.tool_id;

-- Selecciona información sobre las cartas de energía incluyendo su tipo de energía
-- Este query devuelve detalles de las cartas de energía (EnergyCards),
-- incluyendo la descripción de la carta y el nombre del tipo de energía asociada.
--
-- JOINs:
-- - Une la tabla `EnergyCards` con `Energies` para obtener el nombre del tipo de energía.
SELECT 
    ec.energycard_id,
    ec.energycard_description,
    e.energy_name AS energy_type
FROM 
    EnergyCards ec
JOIN 
    Energies e ON ec.energycard_type = e.id_energy;

-- Selecciona las debilidades de una carta de Pokémon específica
-- Este query devuelve las debilidades de una carta de Pokémon específica,
-- incluyendo su nombre, valor de la debilidad, y tipo de energía de la debilidad.
-- 
-- JOINs:
-- - Une la tabla `PokemonCardWeaknesses` con `PokemonCards` para obtener la información de la carta de Pokémon.
-- - Une la tabla `PokemonCards` con `NamesByEvolution` para obtener el nombre del Pokémon.
-- - Une la tabla `PokemonCardWeaknesses` con `EnergyAttributes` para obtener el valor y tipo de la debilidad.
-- - Une la tabla `EnergyAttributes` con `Energies` para obtener el nombre del tipo de energía de la debilidad.
--
-- WHERE:
-- - Filtra los resultados para mostrar solo las debilidades de la carta del Pokémon cuyo nombre es 'Pikachu'.
--   Puedes cambiar 'Pikachu' por el nombre de cualquier otro Pokémon que desees consultar.
SELECT 
    pc.pokemoncard_id,
    nbe.name AS pokemon_name,
    ea.value_weakness_or_endurance AS weakness_value,
    e.energy_name AS weakness_type
FROM 
    PokemonCardWeaknesses pcw
JOIN 
    PokemonCards pc ON pcw.pokemoncard_id = pc.pokemoncard_id
JOIN 
    NamesByEvolution nbe ON pc.pokemon_name = nbe.id_name
JOIN 
    EnergyAttributes ea ON pcw.weakness_id = ea.id_energy_attribute
JOIN 
    Energies e ON ea.energy_type = e.id_energy
WHERE 
    nbe.name = 'Pikachu';

-- Selecciona las resistencias de una carta de Pokémon específica
-- Este query devuelve las resistencias de una carta de Pokémon específica,
-- incluyendo su nombre, valor de la resistencia, y tipo de energía de la resistencia.
-- 
-- JOINs:
-- - Une la tabla `PokemonCardEndurances` con `PokemonCards` para obtener la información de la carta de Pokémon.
-- - Une la tabla `PokemonCards` con `NamesByEvolution` para obtener el nombre del Pokémon.
-- - Une la tabla `PokemonCardEndurances` con `EnergyAttributes` para obtener el valor y tipo de la resistencia.
-- - Une la tabla `EnergyAttributes` con `Energies` para obtener el nombre del tipo de energía de la resistencia.
--
-- WHERE:
-- - Filtra los resultados para mostrar solo las resistencias de la carta del Pokémon cuyo nombre es 'Pikachu'.
--   Puedes cambiar 'Pikachu' por el nombre de cualquier otro Pokémon que desees consultar.    
SELECT 
    pc.pokemoncard_id,
    nbe.name AS pokemon_name,
    ea.value_weakness_or_endurance AS endurance_value,
    e.energy_name AS endurance_type
FROM 
    PokemonCardEndurances pce
JOIN 
    PokemonCards pc ON pce.pokemoncard_id = pc.pokemoncard_id
JOIN 
    NamesByEvolution nbe ON pc.pokemon_name = nbe.id_name
JOIN 
    EnergyAttributes ea ON pce.endurance_id = ea.id_energy_attribute
JOIN 
    Energies e ON ea.energy_type = e.id_energy
WHERE 
    nbe.name = 'Pikachu'; 
