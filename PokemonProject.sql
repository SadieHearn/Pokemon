/******************************************************************************************************************************************
TITLE: Pokemon Data Exploration
AUTHOR: Sadie Hearn
DESCRIPTION: Create a table of Pokemon from generations 1-3 and their stats. Then query the data to find the Pokemon which meet
specifications provided by a client (played by my husband).
Skills Used- table creation, aggregate functions, window functions, temp tables

******************************************************************************************************************************************/
-------------------------------------------------------------------------------------------------------------------------------------------
/*
First, a table will be created in the database. This table will list the stats for the first 3 generations of Pokemon.

*/

create table pokemon (
	number int identity(1,1) primary key
	, name varchar(25)
	, primary_type varchar(25)
	, secondary_type varchar(25)
	, total int
	, hp int
	, attack int
	, defense int
	, sp_attack int
	, sp_defense int
	, speed int
	, generation int
	, legendary varchar(10)
);

insert into pokemon (
	name
	, primary_type
	, secondary_type
	, total
	, hp
	, attack
	, defense
	, sp_attack
	, sp_defense
	, speed
	, generation
	, legendary
)
values
	('Bulbasaur','Grass','Poison',318,45,49,49,65,65,45,1,'False')
	, ('Ivysaur','Grass','Poison',405,60,62,63,80,80,60,1,'False')
	, ('Venusaur','Grass','Poison',525,80,82,83,100,100,80,1,'False')
	, ('Charmander','Fire',NULL,309,39,52,43,60,50,65,1,'False')
	, ('Charmeleon','Fire',NULL,405,58,64,58,80,65,80,1,'False')
	, ('Charizard','Fire','Flying',534,78,84,78,109,85,100,1,'False')
	, ('Squirtle','Water',NULL,314,44,48,65,50,64,43,1,'False')
	, ('Wartortle','Water',NULL,405,59,63,80,65,80,58,1,'False')
	, ('Blastoise','Water',NULL,530,79,83,100,85,105,78,1,'False')
	, ('Caterpie','Bug',NULL,195,45,30,35,20,20,45,1,'False')
	, ('Metapod','Bug',NULL,205,50,20,55,25,25,30,1,'False')
	, ('Butterfree','Bug','Flying',395,60,45,50,90,80,70,1,'False')
	, ('Weedle','Bug','Poison',195,40,35,30,20,20,50,1,'False')
	, ('Kakuna','Bug','Poison',205,45,25,50,25,25,35,1,'False')
	, ('Beedrill','Bug','Poison',395,65,90,40,45,80,75,1,'False')
	, ('Pidgey','Normal','Flying',251,40,45,40,35,35,56,1,'False')
	, ('Pidgeotto','Normal','Flying',349,63,60,55,50,50,71,1,'False')
	, ('Pidgeot','Normal','Flying',479,83,80,75,70,70,101,1,'False')
	, ('Rattata','Normal',NULL,253,30,56,35,25,35,72,1,'False')
	, ('Raticate','Normal',NULL,413,55,81,60,50,70,97,1,'False')
	, ('Spearow','Normal','Flying',262,40,60,30,31,31,70,1,'False')
	, ('Fearow','Normal','Flying',442,65,90,65,61,61,100,1,'False')
	, ('Ekans','Poison',NULL,288,35,60,44,40,54,55,1,'False')
	, ('Arbok','Poison',NULL,438,60,85,69,65,79,80,1,'False')
	, ('Pikachu','Electric',NULL,320,35,55,40,50,50,90,1,'False')
	, ('Raichu','Electric',NULL,485,60,90,55,90,80,110,1,'False')
	, ('Sandshrew','Ground',NULL,300,50,75,85,20,30,40,1,'False')
	, ('Sandslash','Ground',NULL,450,75,100,110,45,55,65,1,'False')
	, ('NidoranFemale','Poison',NULL,275,55,47,52,40,40,41,1,'False')
	, ('Nidorina','Poison',NULL,365,70,62,67,55,55,56,1,'False')
	, ('Nidoqueen','Poison','Ground',505,90,92,87,75,85,76,1,'False')
	, ('NidoranMale','Poison',NULL,273,46,57,40,40,40,50,1,'False')
	, ('Nidorino','Poison',NULL,365,61,72,57,55,55,65,1,'False')
	, ('Nidoking','Poison','Ground',505,81,102,77,85,75,85,1,'False')
	, ('Clefairy','Fairy',NULL,323,70,45,48,60,65,35,1,'False')
	, ('Clefable','Fairy',NULL,483,95,70,73,95,90,60,1,'False')
	, ('Vulpix','Fire',NULL,299,38,41,40,50,65,65,1,'False')
	, ('Ninetales','Fire',NULL,505,73,76,75,81,100,100,1,'False')
	, ('Jigglypuff','Normal','Fairy',270,115,45,20,45,25,20,1,'False')
	, ('Wigglytuff','Normal','Fairy',435,140,70,45,85,50,45,1,'False')
	, ('Zubat','Poison','Flying',245,40,45,35,30,40,55,1,'False')
	, ('Golbat','Poison','Flying',455,75,80,70,65,75,90,1,'False')
	, ('Oddish','Grass','Poison',320,45,50,55,75,65,30,1,'False')
	, ('Gloom','Grass','Poison',395,60,65,70,85,75,40,1,'False')
	, ('Vileplume','Grass','Poison',490,75,80,85,110,90,50,1,'False')
	, ('Paras','Bug','Grass',285,35,70,55,45,55,25,1,'False')
	, ('Parasect','Bug','Grass',405,60,95,80,60,80,30,1,'False')
	, ('Venonat','Bug','Poison',305,60,55,50,40,55,45,1,'False')
	, ('Venomoth','Bug','Poison',450,70,65,60,90,75,90,1,'False')
	, ('Diglett','Ground',NULL,265,10,55,25,35,45,95,1,'False')
	, ('Dugtrio','Ground',NULL,405,35,80,50,50,70,120,1,'False')
	, ('Meowth','Normal',NULL,290,40,45,35,40,40,90,1,'False')
	, ('Persian','Normal',NULL,440,65,70,60,65,65,115,1,'False')
	, ('Psyduck','Water',NULL,320,50,52,48,65,50,55,1,'False')
	, ('Golduck','Water',NULL,500,80,82,78,95,80,85,1,'False')
	, ('Mankey','Fighting',NULL,305,40,80,35,35,45,70,1,'False')
	, ('Primeape','Fighting',NULL,455,65,105,60,60,70,95,1,'False')
	, ('Growlithe','Fire',NULL,350,55,70,45,70,50,60,1,'False')
	, ('Arcanine','Fire',NULL,555,90,110,80,100,80,95,1,'False')
	, ('Poliwag','Water',NULL,300,40,50,40,40,40,90,1,'False')
	, ('Poliwhirl','Water',NULL,385,65,65,65,50,50,90,1,'False')
	, ('Poliwrath','Water','Fighting',510,90,95,95,70,90,70,1,'False')
	, ('Abra','Psychic',NULL,310,25,20,15,105,55,90,1,'False')
	, ('Kadabra','Psychic',NULL,400,40,35,30,120,70,105,1,'False')
	, ('Alakazam','Psychic',NULL,500,55,50,45,135,95,120,1,'False')
	, ('Machop','Fighting',NULL,305,70,80,50,35,35,35,1,'False')
	, ('Machoke','Fighting',NULL,405,80,100,70,50,60,45,1,'False')
	, ('Machamp','Fighting',NULL,505,90,130,80,65,85,55,1,'False')
	, ('Bellsprout','Grass','Poison',300,50,75,35,70,30,40,1,'False')
	, ('Weepinbell','Grass','Poison',390,65,90,50,85,45,55,1,'False')
	, ('Victreebel','Grass','Poison',490,80,105,65,100,70,70,1,'False')
	, ('Tentacool','Water','Poison',335,40,40,35,50,100,70,1,'False')
	, ('Tentacruel','Water','Poison',515,80,70,65,80,120,100,1,'False')
	, ('Geodude','Rock','Ground',300,40,80,100,30,30,20,1,'False')
	, ('Graveler','Rock','Ground',390,55,95,115,45,45,35,1,'False')
	, ('Golem','Rock','Ground',495,80,120,130,55,65,45,1,'False')
	, ('Ponyta','Fire',NULL,410,50,85,55,65,65,90,1,'False')
	, ('Rapidash','Fire',NULL,500,65,100,70,80,80,105,1,'False')
	, ('Slowpoke','Water','Psychic',315,90,65,65,40,40,15,1,'False')
	, ('Slowbro','Water','Psychic',490,95,75,110,100,80,30,1,'False')
	, ('Magnemite','Electric','Steel',325,25,35,70,95,55,45,1,'False')
	, ('Magneton','Electric','Steel',465,50,60,95,120,70,70,1,'False')
	, ('Farfetch''d','Normal','Flying',352,52,65,55,58,62,60,1,'False')
	, ('Doduo','Normal','Flying',310,35,85,45,35,35,75,1,'False')
	, ('Dodrio','Normal','Flying',460,60,110,70,60,60,100,1,'False')
	, ('Seel','Water',NULL,325,65,45,55,45,70,45,1,'False')
	, ('Dewgong','Water','Ice',475,90,70,80,70,95,70,1,'False')
	, ('Grimer','Poison',NULL,325,80,80,50,40,50,25,1,'False')
	, ('Muk','Poison',NULL,500,105,105,75,65,100,50,1,'False')
	, ('Shellder','Water',NULL,305,30,65,100,45,25,40,1,'False')
	, ('Cloyster','Water','Ice',525,50,95,180,85,45,70,1,'False')
	, ('Gastly','Ghost','Poison',310,30,35,30,100,35,80,1,'False')
	, ('Haunter','Ghost','Poison',405,45,50,45,115,55,95,1,'False')
	, ('Gengar','Ghost','Poison',500,60,65,60,130,75,110,1,'False')
	, ('Onix','Rock','Ground',385,35,45,160,30,45,70,1,'False')
	, ('Drowzee','Psychic',NULL,328,60,48,45,43,90,42,1,'False')
	, ('Hypno','Psychic',NULL,483,85,73,70,73,115,67,1,'False')
	, ('Krabby','Water',NULL,325,30,105,90,25,25,50,1,'False')
	, ('Kingler','Water',NULL,475,55,130,115,50,50,75,1,'False')
	, ('Voltorb','Electric',NULL,330,40,30,50,55,55,100,1,'False')
	, ('Electrode','Electric',NULL,480,60,50,70,80,80,140,1,'False')
	, ('Exeggcute','Grass','Psychic',325,60,40,80,60,45,40,1,'False')
	, ('Exeggutor','Grass','Psychic',520,95,95,85,125,65,55,1,'False')
	, ('Cubone','Ground',NULL,320,50,50,95,40,50,35,1,'False')
	, ('Marowak','Ground',NULL,425,60,80,110,50,80,45,1,'False')
	, ('Hitmonlee','Fighting',NULL,455,50,120,53,35,110,87,1,'False')
	, ('Hitmonchan','Fighting',NULL,455,50,105,79,35,110,76,1,'False')
	, ('Lickitung','Normal',NULL,385,90,55,75,60,75,30,1,'False')
	, ('Koffing','Poison',NULL,340,40,65,95,60,45,35,1,'False')
	, ('Weezing','Poison',NULL,490,65,90,120,85,70,60,1,'False')
	, ('Rhyhorn','Ground','Rock',345,80,85,95,30,30,25,1,'False')
	, ('Rhydon','Ground','Rock',485,105,130,120,45,45,40,1,'False')
	, ('Chansey','Normal',NULL,450,250,5,5,35,105,50,1,'False')
	, ('Tangela','Grass',NULL,435,65,55,115,100,40,60,1,'False')
	, ('Kangaskhan','Normal',NULL,490,105,95,80,40,80,90,1,'False')
	, ('Horsea','Water',NULL,295,30,40,70,70,25,60,1,'False')
	, ('Seadra','Water',NULL,440,55,65,95,95,45,85,1,'False')
	, ('Goldeen','Water',NULL,320,45,67,60,35,50,63,1,'False')
	, ('Seaking','Water',NULL,450,80,92,65,65,80,68,1,'False')
	, ('Staryu','Water',NULL,340,30,45,55,70,55,85,1,'False')
	, ('Starmie','Water','Psychic',520,60,75,85,100,85,115,1,'False')
	, ('Mr. Mime','Psychic','Fairy',460,40,45,65,100,120,90,1,'False')
	, ('Scyther','Bug','Flying',500,70,110,80,55,80,105,1,'False')
	, ('Jynx','Ice','Psychic',455,65,50,35,115,95,95,1,'False')
	, ('Electabuzz','Electric',NULL,490,65,83,57,95,85,105,1,'False')
	, ('Magmar','Fire',NULL,495,65,95,57,100,85,93,1,'False')
	, ('Pinsir','Bug',NULL,500,65,125,100,55,70,85,1,'False')
	, ('Tauros','Normal',NULL,490,75,100,95,40,70,110,1,'False')
	, ('Magikarp','Water',NULL,200,20,10,55,15,20,80,1,'False')
	, ('Gyarados','Water','Flying',540,95,125,79,60,100,81,1,'False')
	, ('Lapras','Water','Ice',535,130,85,80,85,95,60,1,'False')
	, ('Ditto','Normal',NULL,288,48,48,48,48,48,48,1,'False')
	, ('Eevee','Normal',NULL,325,55,55,50,45,65,55,1,'False')
	, ('Vaporeon','Water',NULL,525,130,65,60,110,95,65,1,'False')
	, ('Jolteon','Electric',NULL,525,65,65,60,110,95,130,1,'False')
	, ('Flareon','Fire',NULL,525,65,130,60,95,110,65,1,'False')
	, ('Porygon','Normal',NULL,395,65,60,70,85,75,40,1,'False')
	, ('Omanyte','Rock','Water',355,35,40,100,90,55,35,1,'False')
	, ('Omastar','Rock','Water',495,70,60,125,115,70,55,1,'False')
	, ('Kabuto','Rock','Water',355,30,80,90,55,45,55,1,'False')
	, ('Kabutops','Rock','Water',495,60,115,105,65,70,80,1,'False')
	, ('Aerodactyl','Rock','Flying',515,80,105,65,60,75,130,1,'False')
	, ('Snorlax','Normal',NULL,540,160,110,65,65,110,30,1,'False')
	, ('Articuno','Ice','Flying',580,90,85,100,95,125,85,1,'True')
	, ('Zapdos','Electric','Flying',580,90,90,85,125,90,100,1,'True')
	, ('Moltres','Fire','Flying',580,90,100,90,125,85,90,1,'True')
	, ('Dratini','Dragon',NULL,300,41,64,45,50,50,50,1,'False')
	, ('Dragonair','Dragon',NULL,420,61,84,65,70,70,70,1,'False')
	, ('Dragonite','Dragon','Flying',600,91,134,95,100,100,80,1,'False')
	, ('Mewtwo','Psychic',NULL,680,106,110,90,154,90,130,1,'True')
	, ('Mew','Psychic',NULL,600,100,100,100,100,100,100,1,'False')
	, ('Chikorita','Grass',NULL,318,45,49,65,49,65,45,2,'False')
	, ('Bayleef','Grass',NULL,405,60,62,80,63,80,60,2,'False')
	, ('Meganium','Grass',NULL,525,80,82,100,83,100,80,2,'False')
	, ('Cyndaquil','Fire',NULL,309,39,52,43,60,50,65,2,'False')
	, ('Quilava','Fire',NULL,405,58,64,58,80,65,80,2,'False')
	, ('Typhlosion','Fire',NULL,534,78,84,78,109,85,100,2,'False')
	, ('Totodile','Water',NULL,314,50,65,64,44,48,43,2,'False')
	, ('Croconaw','Water',NULL,405,65,80,80,59,63,58,2,'False')
	, ('Feraligatr','Water',NULL,530,85,105,100,79,83,78,2,'False')
	, ('Sentret','Normal',NULL,215,35,46,34,35,45,20,2,'False')
	, ('Furret','Normal',NULL,415,85,76,64,45,55,90,2,'False')
	, ('Hoothoot','Normal','Flying',262,60,30,30,36,56,50,2,'False')
	, ('Noctowl','Normal','Flying',442,100,50,50,76,96,70,2,'False')
	, ('Ledyba','Bug','Flying',265,40,20,30,40,80,55,2,'False')
	, ('Ledian','Bug','Flying',390,55,35,50,55,110,85,2,'False')
	, ('Spinarak','Bug','Poison',250,40,60,40,40,40,30,2,'False')
	, ('Ariados','Bug','Poison',390,70,90,70,60,60,40,2,'False')
	, ('Crobat','Poison','Flying',535,85,90,80,70,80,130,2,'False')
	, ('Chinchou','Water','Electric',330,75,38,38,56,56,67,2,'False')
	, ('Lanturn','Water','Electric',460,125,58,58,76,76,67,2,'False')
	, ('Pichu','Electric',NULL,205,20,40,15,35,35,60,2,'False')
	, ('Cleffa','Fairy',NULL,218,50,25,28,45,55,15,2,'False')
	, ('Igglybuff','Normal','Fairy',210,90,30,15,40,20,15,2,'False')
	, ('Togepi','Fairy',NULL,245,35,20,65,40,65,20,2,'False')
	, ('Togetic','Fairy','Flying',405,55,40,85,80,105,40,2,'False')
	, ('Natu','Psychic','Flying',320,40,50,45,70,45,70,2,'False')
	, ('Xatu','Psychic','Flying',470,65,75,70,95,70,95,2,'False')
	, ('Mareep','Electric',NULL,280,55,40,40,65,45,35,2,'False')
	, ('Flaaffy','Electric',NULL,365,70,55,55,80,60,45,2,'False')
	, ('Ampharos','Electric',NULL,510,90,75,85,115,90,55,2,'False')
	, ('Bellossom','Grass',NULL,490,75,80,95,90,100,50,2,'False')
	, ('Marill','Water','Fairy',250,70,20,50,20,50,40,2,'False')
	, ('Azumarill','Water','Fairy',420,100,50,80,60,80,50,2,'False')
	, ('Sudowoodo','Rock',NULL,410,70,100,115,30,65,30,2,'False')
	, ('Politoed','Water',NULL,500,90,75,75,90,100,70,2,'False')
	, ('Hoppip','Grass','Flying',250,35,35,40,35,55,50,2,'False')
	, ('Skiploom','Grass','Flying',340,55,45,50,45,65,80,2,'False')
	, ('Jumpluff','Grass','Flying',460,75,55,70,55,95,110,2,'False')
	, ('Aipom','Normal',NULL,360,55,70,55,40,55,85,2,'False')
	, ('Sunkern','Grass',NULL,180,30,30,30,30,30,30,2,'False')
	, ('Sunflora','Grass',NULL,425,75,75,55,105,85,30,2,'False')
	, ('Yanma','Bug','Flying',390,65,65,45,75,45,95,2,'False')
	, ('Wooper','Water','Ground',210,55,45,45,25,25,15,2,'False')
	, ('Quagsire','Water','Ground',430,95,85,85,65,65,35,2,'False')
	, ('Espeon','Psychic',NULL,525,65,65,60,130,95,110,2,'False')
	, ('Umbreon','Dark',NULL,525,95,65,110,60,130,65,2,'False')
	, ('Murkrow','Dark','Flying',405,60,85,42,85,42,91,2,'False')
	, ('Slowking','Water','Psychic',490,95,75,80,100,110,30,2,'False')
	, ('Misdreavus','Ghost',NULL,435,60,60,60,85,85,85,2,'False')
	, ('Unown','Psychic',NULL,336,48,72,48,72,48,48,2,'False')
	, ('Wobbuffet','Psychic',NULL,405,190,33,58,33,58,33,2,'False')
	, ('Girafarig','Normal','Psychic',455,70,80,65,90,65,85,2,'False')
	, ('Pineco','Bug',NULL,290,50,65,90,35,35,15,2,'False')
	, ('Forretress','Bug','Steel',465,75,90,140,60,60,40,2,'False')
	, ('Dunsparce','Normal',NULL,415,100,70,70,65,65,45,2,'False')
	, ('Gligar','Ground','Flying',430,65,75,105,35,65,85,2,'False')
	, ('Steelix','Steel','Ground',510,75,85,200,55,65,30,2,'False')
	, ('Snubbull','Fairy',NULL,300,60,80,50,40,40,30,2,'False')
	, ('Granbull','Fairy',NULL,450,90,120,75,60,60,45,2,'False')
	, ('Qwilfish','Water','Poison',430,65,95,75,55,55,85,2,'False')
	, ('Scizor','Bug','Steel',500,70,130,100,55,80,65,2,'False')
	, ('Shuckle','Bug','Rock',505,20,10,230,10,230,5,2,'False')
	, ('Heracross','Bug','Fighting',500,80,125,75,40,95,85,2,'False')
	, ('Sneasel','Dark','Ice',430,55,95,55,35,75,115,2,'False')
	, ('Teddiursa','Normal',NULL,330,60,80,50,50,50,40,2,'False')
	, ('Ursaring','Normal',NULL,500,90,130,75,75,75,55,2,'False')
	, ('Slugma','Fire',NULL,250,40,40,40,70,40,20,2,'False')
	, ('Magcargo','Fire','Rock',410,50,50,120,80,80,30,2,'False')
	, ('Swinub','Ice','Ground',250,50,50,40,30,30,50,2,'False')
	, ('Piloswine','Ice','Ground',450,100,100,80,60,60,50,2,'False')
	, ('Corsola','Water','Rock',380,55,55,85,65,85,35,2,'False')
	, ('Remoraid','Water',NULL,300,35,65,35,65,35,65,2,'False')
	, ('Octillery','Water',NULL,480,75,105,75,105,75,45,2,'False')
	, ('Delibird','Ice','Flying',330,45,55,45,65,45,75,2,'False')
	, ('Mantine','Water','Flying',465,65,40,70,80,140,70,2,'False')
	, ('Skarmory','Steel','Flying',465,65,80,140,40,70,70,2,'False')
	, ('Houndour','Dark','Fire',330,45,60,30,80,50,65,2,'False')
	, ('Houndoom','Dark','Fire',500,75,90,50,110,80,95,2,'False')
	, ('Kingdra','Water','Dragon',540,75,95,95,95,95,85,2,'False')
	, ('Phanpy','Ground',NULL,330,90,60,60,40,40,40,2,'False')
	, ('Donphan','Ground',NULL,500,90,120,120,60,60,50,2,'False')
	, ('Porygon2','Normal',NULL,515,85,80,90,105,95,60,2,'False')
	, ('Stantler','Normal',NULL,465,73,95,62,85,65,85,2,'False')
	, ('Smeargle','Normal',NULL,250,55,20,35,20,45,75,2,'False')
	, ('Tyrogue','Fighting',NULL,210,35,35,35,35,35,35,2,'False')
	, ('Hitmontop','Fighting',NULL,455,50,95,95,35,110,70,2,'False')
	, ('Smoochum','Ice','Psychic',305,45,30,15,85,65,65,2,'False')
	, ('Elekid','Electric',NULL,360,45,63,37,65,55,95,2,'False')
	, ('Magby','Fire',NULL,365,45,75,37,70,55,83,2,'False')
	, ('Miltank','Normal',NULL,490,95,80,105,40,70,100,2,'False')
	, ('Blissey','Normal',NULL,540,255,10,10,75,135,55,2,'False')
	, ('Raikou','Electric',NULL,580,90,85,75,115,100,115,2,'True')
	, ('Entei','Fire',NULL,580,115,115,85,90,75,100,2,'True')
	, ('Suicune','Water',NULL,580,100,75,115,90,115,85,2,'True')
	, ('Larvitar','Rock','Ground',300,50,64,50,45,50,41,2,'False')
	, ('Pupitar','Rock','Ground',410,70,84,70,65,70,51,2,'False')
	, ('Tyranitar','Rock','Dark',600,100,134,110,95,100,61,2,'False')
	, ('Lugia','Psychic','Flying',680,106,90,130,90,154,110,2,'True')
	, ('Ho-oh','Fire','Flying',680,106,130,90,110,154,90,2,'True')
	, ('Celebi','Psychic','Grass',600,100,100,100,100,100,100,2,'False')
	, ('Treecko','Grass',NULL,310,40,45,35,65,55,70,3,'False')
	, ('Grovyle','Grass',NULL,405,50,65,45,85,65,95,3,'False')
	, ('Sceptile','Grass',NULL,530,70,85,65,105,85,120,3,'False')
	, ('Torchic','Fire',NULL,310,45,60,40,70,50,45,3,'False')
	, ('Combusken','Fire','Fighting',405,60,85,60,85,60,55,3,'False')
	, ('Blaziken','Fire','Fighting',530,80,120,70,110,70,80,3,'False')
	, ('Mudkip','Water',NULL,310,50,70,50,50,50,40,3,'False')
	, ('Marshtomp','Water','Ground',405,70,85,70,60,70,50,3,'False')
	, ('Swampert','Water','Ground',535,100,110,90,85,90,60,3,'False')
	, ('Poochyena','Dark',NULL,220,35,55,35,30,30,35,3,'False')
	, ('Mightyena','Dark',NULL,420,70,90,70,60,60,70,3,'False')
	, ('Zigzagoon','Normal',NULL,240,38,30,41,30,41,60,3,'False')
	, ('Linoone','Normal',NULL,420,78,70,61,50,61,100,3,'False')
	, ('Wurmple','Bug',NULL,195,45,45,35,20,30,20,3,'False')
	, ('Silcoon','Bug',NULL,205,50,35,55,25,25,15,3,'False')
	, ('Beautifly','Bug','Flying',395,60,70,50,100,50,65,3,'False')
	, ('Cascoon','Bug',NULL,205,50,35,55,25,25,15,3,'False')
	, ('Dustox','Bug','Poison',385,60,50,70,50,90,65,3,'False')
	, ('Lotad','Water','Grass',220,40,30,30,40,50,30,3,'False')
	, ('Lombre','Water','Grass',340,60,50,50,60,70,50,3,'False')
	, ('Ludicolo','Water','Grass',480,80,70,70,90,100,70,3,'False')
	, ('Seedot','Grass',NULL,220,40,40,50,30,30,30,3,'False')
	, ('Nuzleaf','Grass','Dark',340,70,70,40,60,40,60,3,'False')
	, ('Shiftry','Grass','Dark',480,90,100,60,90,60,80,3,'False')
	, ('Taillow','Normal','Flying',270,40,55,30,30,30,85,3,'False')
	, ('Swellow','Normal','Flying',430,60,85,60,50,50,125,3,'False')
	, ('Wingull','Water','Flying',270,40,30,30,55,30,85,3,'False')
	, ('Pelipper','Water','Flying',430,60,50,100,85,70,65,3,'False')
	, ('Ralts','Psychic','Fairy',198,28,25,25,45,35,40,3,'False')
	, ('Kirlia','Psychic','Fairy',278,38,35,35,65,55,50,3,'False')
	, ('Gardevoir','Psychic','Fairy',518,68,65,65,125,115,80,3,'False')
	, ('Surskit','Bug','Water',269,40,30,32,50,52,65,3,'False')
	, ('Masquerain','Bug','Flying',414,70,60,62,80,82,60,3,'False')
	, ('Shroomish','Grass',NULL,295,60,40,60,40,60,35,3,'False')
	, ('Breloom','Grass','Fighting',460,60,130,80,60,60,70,3,'False')
	, ('Slakoth','Normal',NULL,280,60,60,60,35,35,30,3,'False')
	, ('Vigoroth','Normal',NULL,440,80,80,80,55,55,90,3,'False')
	, ('Slaking','Normal',NULL,670,150,160,100,95,65,100,3,'False')
	, ('Nincada','Bug','Ground',266,31,45,90,30,30,40,3,'False')
	, ('Ninjask','Bug','Flying',456,61,90,45,50,50,160,3,'False')
	, ('Shedinja','Bug','Ghost',236,1,90,45,30,30,40,3,'False')
	, ('Whismur','Normal',NULL,240,64,51,23,51,23,28,3,'False')
	, ('Loudred','Normal',NULL,360,84,71,43,71,43,48,3,'False')
	, ('Exploud','Normal',NULL,490,104,91,63,91,73,68,3,'False')
	, ('Makuhita','Fighting',NULL,237,72,60,30,20,30,25,3,'False')
	, ('Hariyama','Fighting',NULL,474,144,120,60,40,60,50,3,'False')
	, ('Azurill','Normal','Fairy',190,50,20,40,20,40,20,3,'False')
	, ('Nosepass','Rock',NULL,375,30,45,135,45,90,30,3,'False')
	, ('Skitty','Normal',NULL,260,50,45,45,35,35,50,3,'False')
	, ('Delcatty','Normal',NULL,380,70,65,65,55,55,70,3,'False')
	, ('Sableye','Dark','Ghost',380,50,75,75,65,65,50,3,'False')
	,  ('Mawile','Steel','Fairy',380,50,85,85,55,55,50,3,'False')
	, ('Aron','Steel','Rock',330,50,70,100,40,40,30,3,'False')
	, ('Lairon','Steel','Rock',430,60,90,140,50,50,40,3,'False')
	, ('Aggron','Steel','Rock',530,70,110,180,60,60,50,3,'False')
	, ('Meditite','Fighting','Psychic',280,30,40,55,40,55,60,3,'False')
	, ('Medicham','Fighting','Psychic',410,60,60,75,60,75,80,3,'False')
	, ('Electrike','Electric',NULL,295,40,45,40,65,40,65,3,'False')
	, ('Manectric','Electric',NULL,475,70,75,60,105,60,105,3,'False')
	, ('Plusle','Electric',NULL,405,60,50,40,85,75,95,3,'False')
	, ('Minun','Electric',NULL,405,60,40,50,75,85,95,3,'False')
	, ('Volbeat','Bug',NULL,400,65,73,55,47,75,85,3,'False')
	, ('Illumise','Bug',NULL,400,65,47,55,73,75,85,3,'False')
	, ('Roselia','Grass','Poison',400,50,60,45,100,80,65,3,'False')
	, ('Gulpin','Poison',NULL,302,70,43,53,43,53,40,3,'False')
	, ('Swalot','Poison',NULL,467,100,73,83,73,83,55,3,'False')
	, ('Carvanha','Water','Dark',305,45,90,20,65,20,65,3,'False')
	, ('Sharpedo','Water','Dark',460,70,120,40,95,40,95,3,'False')
	, ('Wailmer','Water',NULL,400,130,70,35,70,35,60,3,'False')
	, ('Wailord','Water',NULL,500,170,90,45,90,45,60,3,'False')
	, ('Numel','Fire','Ground',305,60,60,40,65,45,35,3,'False')
	, ('Camerupt','Fire','Ground',460,70,100,70,105,75,40,3,'False')
	, ('Torkoal','Fire',NULL,470,70,85,140,85,70,20,3,'False')
	, ('Spoink','Psychic',NULL,330,60,25,35,70,80,60,3,'False')
	, ('Grumpig','Psychic',NULL,470,80,45,65,90,110,80,3,'False')
	, ('Spinda','Normal',NULL,360,60,60,60,60,60,60,3,'False')
	, ('Trapinch','Ground',NULL,290,45,100,45,45,45,10,3,'False')
	, ('Vibrava','Ground','Dragon',340,50,70,50,50,50,70,3,'False')
	, ('Flygon','Ground','Dragon',520,80,100,80,80,80,100,3,'False')
	, ('Cacnea','Grass',NULL,335,50,85,40,85,40,35,3,'False')
	, ('Cacturne','Grass','Dark',475,70,115,60,115,60,55,3,'False')
	, ('Swablu','Normal','Flying',310,45,40,60,40,75,50,3,'False')
	, ('Altaria','Dragon','Flying',490,75,70,90,70,105,80,3,'False')
	, ('Zangoose','Normal',NULL,458,73,115,60,60,60,90,3,'False')
	, ('Seviper','Poison',NULL,458,73,100,60,100,60,65,3,'False')
	, ('Lunatone','Rock','Psychic',440,70,55,65,95,85,70,3,'False')
	, ('Solrock','Rock','Psychic',440,70,95,85,55,65,70,3,'False')
	, ('Barboach','Water','Ground',288,50,48,43,46,41,60,3,'False')
	, ('Whiscash','Water','Ground',468,110,78,73,76,71,60,3,'False')
	, ('Corphish','Water',NULL,308,43,80,65,50,35,35,3,'False')
	, ('Crawdaunt','Water','Dark',468,63,120,85,90,55,55,3,'False')
	, ('Baltoy','Ground','Psychic',300,40,40,55,40,70,55,3,'False')
	, ('Claydol','Ground','Psychic',500,60,70,105,70,120,75,3,'False')
	, ('Lileep','Rock','Grass',355,66,41,77,61,87,23,3,'False')
	, ('Cradily','Rock','Grass',495,86,81,97,81,107,43,3,'False')
	, ('Anorith','Rock','Bug',355,45,95,50,40,50,75,3,'False')
	, ('Armaldo','Rock','Bug',495,75,125,100,70,80,45,3,'False')
	, ('Feebas','Water',NULL,200,20,15,20,10,55,80,3,'False')
	, ('Milotic','Water',NULL,540,95,60,79,100,125,81,3,'False')
	, ('Castform','Normal',NULL,420,70,70,70,70,70,70,3,'False')
	, ('Kecleon','Normal',NULL,440,60,90,70,60,120,40,3,'False')
	, ('Shuppet','Ghost',NULL,295,44,75,35,63,33,45,3,'False')
	, ('Banette','Ghost',NULL,455,64,115,65,83,63,65,3,'False')
	, ('Duskull','Ghost',NULL,295,20,40,90,30,90,25,3,'False')
	, ('Dusclops','Ghost',NULL,455,40,70,130,60,130,25,3,'False')
	, ('Tropius','Grass','Flying',460,99,68,83,72,87,51,3,'False')
	, ('Chimecho','Psychic',NULL,425,65,50,70,95,80,65,3,'False')
	, ('Absol','Dark',NULL,465,65,130,60,75,60,75,3,'False')
	, ('Wynaut','Psychic',NULL,260,95,23,48,23,48,23,3,'False')
	, ('Snorunt','Ice',NULL,300,50,50,50,50,50,50,3,'False')
	, ('Glalie','Ice',NULL,480,80,80,80,80,80,80,3,'False')
	, ('Spheal','Ice','Water',290,70,40,50,55,50,25,3,'False')
	, ('Sealeo','Ice','Water',410,90,60,70,75,70,45,3,'False')
	, ('Walrein','Ice','Water',530,110,80,90,95,90,65,3,'False')
	, ('Clamperl','Water',NULL,345,35,64,85,74,55,32,3,'False')
	, ('Huntail','Water',NULL,485,55,104,105,94,75,52,3,'False')
	, ('Gorebyss','Water',NULL,485,55,84,105,114,75,52,3,'False')
	, ('Relicanth','Water','Rock',485,100,90,130,45,65,55,3,'False')
	, ('Luvdisc','Water',NULL,330,43,30,55,40,65,97,3,'False')
	, ('Bagon','Dragon',NULL,300,45,75,60,40,30,50,3,'False')
	, ('Shelgon','Dragon',NULL,420,65,95,100,60,50,50,3,'False')
	, ('Salamence','Dragon','Flying',600,95,135,80,110,80,100,3,'False')
	, ('Beldum','Steel','Psychic',300,40,55,80,35,60,30,3,'False')
	, ('Metang','Steel','Psychic',420,60,75,100,55,80,50,3,'False')
	, ('Metagross','Steel','Psychic',600,80,135,130,95,90,70,3,'False')
	, ('Regirock','Rock',NULL,580,80,100,200,50,100,50,3,'True')
	, ('Regice','Ice',NULL,580,80,50,100,100,200,50,3,'True')
	, ('Registeel','Steel',NULL,580,80,75,150,75,150,50,3,'True')
	, ('Latias','Dragon','Psychic',600,80,80,90,110,130,110,3,'True')
	, ('Latios','Dragon','Psychic',600,80,90,80,130,110,110,3,'True')
	, ('Kyogre','Water',NULL,670,100,100,90,150,140,90,3,'True')
	, ('Groudon','Ground',NULL,670,100,150,140,100,90,90,3,'True')
	, ('Rayquaza','Dragon','Flying',680,105,150,90,150,90,95,3,'True')
	, ('Jirachi','Steel','Psychic',600,100,100,100,100,100,100,3,'True')
;


-------------------------------------------------------------------------------------------------------------------------------------------
/*
The client, Logan, wants help building his ideal Pokemon team. He is overwhelmed by the number of Pokemon and needs help narrowing down 
the list to pick from. He says he prefers multi-type pokemon and his favorite generations are 1 & 3. Also, his favorite Pokemon is Mudkip.

To help figure out the best team for him, Logan was asked a bit about his fighting style:
1. Which stats do you prioritize (Health, Attack, Defense, etc)?
2. Do you prefer a specific primary type?
3. Do you want a team that includes legendary Pokemon?

Logan's responses:
1. Priotitizes attack and apeed. His goal is to be able to attack first and deplete as much of the opponent's HP as possible in the first hit.
2. Water types are his favorite though he wants to have a diverse team, hence the affintity for multi-type Pokemon.
3. He has an interest in someday playing tournaments which do not allow for legendaries.

*/
-------------------------------------------------------------------------------------------------------------------------------------------
/*
To explore the data, a temp table along with local variables @min_speed and @min_attack will be created to filter out Pokemon which do
not meet Logan' specifications. This narrowed down list may then be queried futher without having to redefine Logan's specifications every
time. Also, should Logan later decide he wants to change the threshold for what is considered "high attack" or "high speed", the value of
those variables may be changed conviently in one spot.

*/

--For now, "high attack" and "high speed" will be considered anything greater than the average Pokemon attack and speed 
declare 
	@min_speed int
	, @min_attack int
select 
	@min_speed = (select
					avg(speed)
				from pokemon)
	, @min_attack = (select
						avg(attack)
					from pokemon)

drop table if exists #pokemon_list --Prevent error by dropping the temp table if this script is run multiple times in a single session

--Collect the data from the Pokemon table based on Logan's specifications and insert it in a temp table
create table #pokemon_list (
	number int primary key
	, name varchar(25)
	, primary_type varchar(25)
	, secondary_type varchar(25)
	, total int
	, hp int
	, attack int
	, defense int
	, sp_attack int
	, sp_defense int
	, speed int
	, generation int
	, legendary varchar(10)
);

insert into #pokemon_list
select
	*
from pokemon
where 
	secondary_type is not null --Multi-type Pokemon
	and (generation = 1 or generation = 3) --Favorite generations
	and attack > @min_attack --Prioritize high attack
	and speed > @min_speed --Prioritize high speed
	and legendary = 'False' --Legendaries not included
	or name = 'Mudkip' --Favorite Pokemon
order by --The following will organize the output first by the PrimaryType, then the highest Speed, and then the highest attack
	primary_type
	, speed desc
	, attack desc --The table is  organized in this way so he may easily look through the list and pick out the fastest/strongest of each
					--type to create a diverse team
;

select 
	*
from #pokemon_list
;

-------------------------------------------------------------------------------------------------------------------------------------------
/*
After presenting this data to Logan, he is worried he was too picky and isn't sure if he'll have enough Pokemon to pick from for each 
PrimaryType. He'd like to know how many of each primary type there are under the conditions he previously gave.
Since a temp table was created in the previous step, this information may be gathered from the temp table rather than respecifying all the 
conditions Logan previously gave.

*/

select 
	primary_type
	, count(primary_type) as number_per_primary_type
from 
	#pokemon_list
group by 
	primary_type
order by 
	number_per_primary_type
;

-------------------------------------------------------------------------------------------------------------------------------------------
/*
Logan decided there were enough to choose from for his favorite PrimaryTypes. Since he was satisfied by the results, he thinks the best way
to build his team is by picking the Pokemon with the highest Speed for the primary types Dragon, Grass, Fire, Normal, and Poison. If two
or more Pokemon share the top speed for their primary type, prioritize by attack next. He mentioned a Pokemon team has 6 Pokemon. Of course,
he wants to include Mudkip as well. Once again, the temp table previously created will be used.

*/

select top 6 --Only include the Top 6 results, as this is the max number of Pokemon that can be on a team
	 * 
	, dense_rank() over(partition by primary_type order by speed desc) as speed_rank_for_type1 --Ranks by speed for their PrimaryType
	, dense_rank() over(partition by primary_type order by attack desc) as attack_rank_for_type1 --Ranks by attack for their PrimaryType
from 
	#pokemon_list
where 
	primary_type IN('Dragon', 'Grass', 'Fire', 'Normal', 'Poison', 'Water') --Only include the specified types
order by 
	case
		when name = 'MudKip' then 1 --This will include Mudkip in addition to the Pokemon ranked by speed and attack
		else 2
	end
	, dense_rank() over(partition by primary_type order by speed desc)
	, dense_rank() over(partition by primary_type order by attack desc)
;

