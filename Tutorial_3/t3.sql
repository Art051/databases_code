--DROP DATABASE IF EXISTS "Tutorial3";

--CREATE DATABASE "Tutorial3"
 --   WITH
 --   OWNER = postgres
 --   ENCODING = 'UTF8'
  --  LC_COLLATE = 'English_United Kingdom.1252'
  --  LC_CTYPE = 'English_United Kingdom.1252'
 --   TABLESPACE = pg_default
  --  CONNECTION LIMIT = -1
  --  IS_TEMPLATE = False;
	
CREATE TABLE Books(
BookID integer PRIMARY KEY,
BookTitle varchar(300),
BookGenre varchar(30),
Price numeric,
AmountInStock integer 
);
-- CREATE TABLE StockLevel(
-- StockLevelID interger primary KEY, 
-- BookID integer,
-- StoreID integer, 
-- Quantity integer, 
-- LastOrderedBy integer
-- ); --staff id
CREATE TABLE Customer(
CustomerID integer PRIMARY KEY,
fname varchar(30),
lname varchar(30),
Address varchar(300),
phone varchar(15)
);

CREATE TABLE BookOrder(
BookOrder integer PRIMARY KEY,
BookID integer NOT NULL,
CustomerID integer NOT NULL,
Quantity numeric);


ALTER TABLE BookOrder ADD CONSTRAINT BookOrder_BookID_FK foreign key (BookID) references Books(BookID);
ALTER TABLE BookOrder ADD CONSTRAINT BookOrder_CustomerID_FK foreign key (CustomerID) references Customer(CustomerID);

INSERT INTO Customer (CustomerID, fname, lname, Address, phone) VALUES (1,'dave','dave','daves street','123456789');

Insert INTO Books (BookID, BookTitle, BookGenre, price) VALUES (1, 'Why is this  machine slow', 'horror', 59.99);
Insert INTO Books (BookID, BookTitle, BookGenre, price) VALUES (2, 'Why is this  machine slow 2', 'horror', 49.99);
Insert INTO Books (BookID, BookTitle, BookGenre, price) VALUES (3, 'Why is this  machine slow 3', 'fantasy', 39.99);

INSERT INTO BookOrder(BookOrder, BookID, CustomerID, Quantity) VALUES (1,1,1,1);


insert into Customer (CustomerID, fname, lname, address, phone) values (1111, 'Caz', 'Von Der Empten', '60568 Summit Avenue', 21);
insert into Customer (CustomerID, fname, lname, address, phone) values (2, 'Velvet', 'Le Houx', '1034 Gina Court', 95);
insert into Customer (CustomerID, fname, lname, address, phone) values (3, 'Laurena', 'Gage', '15 Ruskin Circle', 94);
insert into Customer (CustomerID, fname, lname, address, phone) values (4, 'Ahmad', 'Addicote', '84015 Rigney Center', 86);
insert into Customer (CustomerID, fname, lname, address, phone) values (5, 'Tina', 'Kingston', '7 Leroy Trail', 43);
insert into Customer (CustomerID, fname, lname, address, phone) values (6, 'Lorinda', 'Coiley', '05426 Erie Road', 33);
insert into Customer (CustomerID, fname, lname, address, phone) values (7, 'Cash', 'Earingey', '09 American Ash Crossing', 78);
insert into Customer (CustomerID, fname, lname, address, phone) values (8, 'Wileen', 'Nunn', '567 Fisk Terrace', 83);
insert into Customer (CustomerID, fname, lname, address, phone) values (9, 'Fancy', 'Beet', '6885 Mallory Street', 18);
insert into Customer (CustomerID, fname, lname, address, phone) values (10, 'Forrester', 'Alcock', '76400 Killdeer Way', 79);
insert into Customer (CustomerID, fname, lname, address, phone) values (11, 'Elli', 'Healing', '512 Paget Place', 23);
insert into Customer (CustomerID, fname, lname, address, phone) values (12, 'Blondy', 'Roux', '135 Arkansas Plaza', 3);
insert into Customer (CustomerID, fname, lname, address, phone) values (13, 'Jamison', 'Beavis', '656 Magdeline Hill', 63);
insert into Customer (CustomerID, fname, lname, address, phone) values (14, 'Giordano', 'Patington', '75815 Mccormick Drive', 76);
insert into Customer (CustomerID, fname, lname, address, phone) values (15, 'Stanislas', 'Laffoley-Lane', '67 Melody Plaza', 53);
insert into Customer (CustomerID, fname, lname, address, phone) values (16, 'Jaclin', 'O'' Gara', '05 8th Crossing', 2);
insert into Customer (CustomerID, fname, lname, address, phone) values (17, 'Smith', 'Studart', '51887 La Follette Lane', 64);
insert into Customer (CustomerID, fname, lname, address, phone) values (18, 'Alanna', 'Drissell', '9370 Hauk Pass', 95);
insert into Customer (CustomerID, fname, lname, address, phone) values (19, 'Sullivan', 'Steabler', '1 Fairfield Park', 70);
insert into Customer (CustomerID, fname, lname, address, phone) values (20, 'Nadean', 'De Castri', '3639 Mosinee Junction', 57);
insert into Customer (CustomerID, fname, lname, address, phone) values (21, 'Adelle', 'Brinicombe', '8 Continental Alley', 19);
insert into Customer (CustomerID, fname, lname, address, phone) values (22, 'Rhys', 'Hause', '76090 Park Meadow Avenue', 24);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (111, '100 Years at the Movies', 'fmvayvcvly', '040.67', 80);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (211, 'The Intruders', 'azcjoefran', '852.35', 33);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (311, 'Storm of the Century', 'lncinucazo', '370.09', 54);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (4, 'Learning Curve, The', 'rzguuzrtyc', '560.26', 82);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (5, 'The Incident', 'ntfzzghzyn', '932.73', 37);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (6, 'Super Sucker', 'csbejkooqz', '242.94', 73);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (7, 'King Lear', 'apbwksydky', '979.33', 71);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (8, 'Takers', 'zxljrryfrl', '993.47', 66);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (9, 'Turin Horse, The (A Torinói ló)', 'psopbpleji', '511.11', 86);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (10, 'Gator', 'difhbiuaya', '952.51', 92);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (11, 'Phyllis and Harold', 'ydytzervpq', '096.73', 59);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (12, 'El Dorado', 'ceggbnvcww', '716.84', 73);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (13, 'Brave, The', 'ivotkjvmrk', '299.06', 34);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (14, 'Such Good Friends', 'nooszqhgmj', '865.65', 68);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (15, 'Jellyfish (Meduzot)', 'mcasupoqrc', '915.69', 16);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (16, 'Our Hospitality', 'acorlsedha', '161.35', 8);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (17, 'Tooth & Nail', 'jixrbdnkto', '405.66', 68);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (18, 'Gold Diggers of 1933', 'bvnmwsjeqr', '243.85', 99);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (19, 'Mirror, The (Zerkalo)', 'bnfhxoflzv', '478.42', 13);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (20, 'Ghost Rider', 'cgvlgwtbgm', '288.77', 83);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (21, 'My Life So Far', 'hasnlfahkx', '417.05', 11);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (22, 'Boy Friend, The', 'usymacuunl', '213.40', 53);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (23, 'Kung Fu Panda', 'zvamobofnk', '402.00', 47);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (24, 'Guitar, The', 'vhkzsgyaql', '777.27', 74);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (25, 'Paradise Canyon', 'bkrpvhbwpd', '125.76', 39);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (26, 'All the Vermeers in New York', 'quhajdnluz', '788.34', 50);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (27, 'Day of the Crows, The (Le jour des corneilles)', 'gfykatjgmy', '223.47', 38);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (28, 'Kingdom of Shadows', 'fzsrullity', '697.46', 71);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (29, 'Borrowed Hearts (Borrowed Hearts: A Holiday Romance)', 'urpfevtoag', '919.41', 85);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (30, 'Thumbelina', 'xuubbibidx', '694.70', 55);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (31, 'Storytelling', 'tzfucnpucl', '839.03', 52);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (32, 'Farmer''s Wife, The', 'djyqalsqep', '231.54', 54);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (33, 'Star Trek: Generations', 'efqvbyqzya', '055.00', 27);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (34, 'Happy Time, The', 'wftzfxuela', '990.53', 76);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (35, 'Poklosie', 'ievtwgzqpd', '749.11', 46);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (36, 'Teen Wolf', 'ovxvuawodi', '716.33', 43);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (37, 'Tale of Despereaux, The', 'khorwvsjdb', '301.84', 47);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (38, '12 Rounds', 'yyndqroaiz', '405.61', 45);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (39, 'Homework', 'rxwrvlxygy', '758.63', 79);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (40, 'Kira''s Reason: A Love Story (En Kærlighedshistorie)', 'pkznfqsiut', '769.15', 97);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (41, 'International, The', 'yxsqezzeim', '396.38', 56);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (42, 'Attack of the Puppet People', 'epphegfvrk', '456.75', 38);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (43, 'Stoning of Soraya M., The', 'vjkiltlgzm', '118.50', 52);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (44, 'Argo', 'gkiytjvlke', '842.15', 19);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (45, 'Man of Marble (Czlowiek z Marmuru)', 'ixdgxxmspx', '824.29', 100);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (46, 'Caine Mutiny Court-Martial, The', 'kundmmgjly', '314.60', 45);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (47, 'Blackbird', 'rlftqddowx', '767.28', 30);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (48, 'Backwoods (Bosque de sombras)', 'szprkebemy', '846.69', 98);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (49, 'Not Reconciled (Nicht versöhnt oder Es hilft nur Gewalt wo Gewalt herrscht)', 'pbjbwjheoe', '267.23', 25);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (50, 'Unhook the Stars', 'ryeqngxltt', '343.72', 43);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (51, 'Three Resurrected Drunkards (Kaette kita yopparai)', 'vxsqjrfwar', '886.41', 49);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (52, 'Babbitt', 'nlowyonndt', '301.97', 86);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (53, 'Blackout', 'fbgshsgrrg', '867.64', 47);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (54, 'Walk on the Wild Side', 'yuzbaiqvha', '745.74', 12);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (55, 'Hellraiser: Hellworld', 'cvsstcfgal', '465.94', 12);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (56, 'Four Seasons, The', 'ssnmmjuwyz', '258.02', 99);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (57, 'Red Ensign', 'etmbxivznn', '767.40', 36);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (58, 'Moth Diaries, The', 'qokzyavoiw', '025.26', 23);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (59, 'Grin Without a Cat, A (Fond de l''air est rouge, Le)', 'psldkjwuwt', '173.02', 28);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (60, 'Batman: Year One', 'jnuyluenen', '656.15', 24);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (61, 'Little Fugitive', 'xertntzgub', '822.63', 61);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (62, 'Cornered', 'jjhaxrcwyb', '343.49', 88);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (63, 'Country Strong', 'vqejfknmth', '431.83', 83);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (64, 'Gamers, The: Dorkness Rising', 'clggmhowdm', '669.50', 42);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (65, 'Sonny', 'jkeycsiroy', '402.56', 17);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (66, 'Ledge, The', 'ziyvdnmmxu', '328.70', 68);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (67, 'One Nine Nine Four', 'dxxsvbcirg', '116.45', 96);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (68, 'Deep Blue', 'psnsuxxtaa', '267.06', 39);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (69, 'Don 2', 'tfmyespiya', '452.30', 63);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (70, 'Scrooge', 'mndoyhfxhx', '309.84', 50);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (71, 'Country Girl, The', 'zeluzdktls', '274.51', 5);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (72, 'Born to Defense (Zhong hua ying xiong)', 'gweopfrquv', '520.50', 22);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (73, 'Who Framed Roger Rabbit?', 'npecsontpx', '317.30', 61);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (74, 'Jet Lag (Décalage horaire)', 'pzqspbmpuh', '088.90', 92);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (75, 'Bullfighters, The', 'luptznneuz', '514.23', 17);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (76, 'Birth of a Nation, The', 'ntxrokizbu', '195.65', 56);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (77, 'Fish Child, The (El niño pez)', 'tngklsxmcl', '795.77', 39);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (78, 'Reindeerspotting - Pako joulumaasta', 'delwboqrpg', '385.32', 59);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (79, 'Bicycle, Spoon, Apple (Bicicleta, cullera, poma)', 'zegqfrrjyf', '893.84', 5);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (80, 'The Best of Me', 'cnwuslmxuq', '996.12', 74);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (81, 'Star Trek III: The Search for Spock', 'jxlgnoizhc', '922.18', 43);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (82, 'Lonelyhearts', 'tkqljcmjwb', '885.39', 80);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (83, 'Death of a Nation - The Timor Conspiracy', 'oeyzkyaviw', '513.27', 91);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (84, 'Naqoyqatsi', 'zmdwymtqdo', '816.62', 35);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (85, '009 Re: Cyborg', 'gijnttmbvw', '396.93', 61);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (86, 'Sundown', 'fkeidpueof', '894.37', 16);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (87, 'Jam', 'gibyhknrls', '083.61', 46);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (88, 'Scenes of a Sexual Nature', 'wbngodvmun', '006.96', 6);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (89, 'Borrowed Time', 'bjizltlbin', '356.63', 88);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (90, 'Lauderdale (a.k.a. Spring Break USA) (a.k.a. Spring Fever USA)', 'fttrggjktc', '953.48', 75);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (91, 'Bicycle Thieves (a.k.a. The Bicycle Thief) (a.k.a. The Bicycle Thieves) (Ladri di biciclette)', 'acbvkchqbu', '937.49', 76);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (92, 'Dry Cleaning (Nettoyage à sec)', 'fujtkqjyzc', '964.31', 57);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (93, 'Buster Keaton: A Hard Act to Follow', 'znnmaxphss', '709.19', 30);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (94, 'Producers, The', 'dciroffhrz', '524.90', 75);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (95, 'Children of Huang Shi, The', 'sztbrlkqbo', '973.12', 12);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (96, 'Swan Princess: The Mystery of the Enchanted Treasure, The', 'eznxdahles', '247.90', 55);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (97, 'Futurama: Bender''s Game', 'xkwokpbqeu', '778.65', 90);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (98, 'Dark Portals: The Chronicles of Vidocq  (Vidocq)', 'ucnhltkqut', '799.26', 38);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (99, 'Page Turner, The (Tourneuse de pages, La)', 'qphvnnzllc', '536.89', 38);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (100, 'Dust', 'pbcezhqbac', '359.46', 32);
insert into Books (BookID, BookTitle, BookGenre, Price, AmountInStock) values (0, 'Dusttt', 'pbcezhqbac', '359.46', 32);

insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('079', '45', '4', '574944');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('320', '31', '2', '601129');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('727', '19', '4', '638235');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('428', '66', '1', '669726');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('788', '83', '4', '506548');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('290', '16', '3', '846899');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('918', '69', '6', '280719');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('177', '98', '8', '055302');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('013', '21', '1', '320988');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('191', '16', '2', '383008');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('267', '39', '7', '352923');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('632', '95', '9', '920361');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('423', '75', '3', '669228');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('505', '82', '2', '355923');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('492', '77', '6', '840656');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('797', '18', '1', '821753');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('761', '68', '4', '017884');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('544', '21', '1', '677168');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('897', '22', '1', '024586');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('433', '48', '1', '445046');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('961', '17', '1', '395379');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('213', '38', '1', '975657');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('298', '98', '1', '591692');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('869', '96', '3', '596732');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('973', '80', '8', '279110');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('695', '75', '2', '286224');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('705', '54', '2', '461023');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('966', '77', '9', '661687');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('559', '45', '3', '264021');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('242', '60', '9', '702073');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('038', '64', '9', '681379');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('105', '23', '2', '654490');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('415', '60', '1', '295471');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('968', '15', '2', '711057');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('218', '55', '3', '602331');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('672', '43', '2', '829871');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('607', '58', '4', '916646');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('231', '54', '7', '729789');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('691', '66', '6', '612024');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('780', '29', '4', '415416');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('052', '80', '1', '628698');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('141', '29', '1', '030882');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('776', '35', '2', '892315');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('671', '82', '1', '871277');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('058', '52', '3', '527454');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('023', '24', '1', '057806');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('121', '45', '6', '993663');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('529', '63', '1', '209009');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('666', '74', '4', '987457');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('978', '81', '7', '609987');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('182', '11', '7', '878900');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('400', '78', '1', '587747');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('855', '34', '5', '982360');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('930', '41', '1', '055593');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('480', '68', '1', '632313');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('406', '00', '7', '059076');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('917', '92', '6', '784788');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('230', '51', '1', '417983');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('479', '50', '4', '350816');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('026', '87', '5', '498647');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('454', '93', '9', '203085');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('740', '31', '2', '080085');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('624', '22', '8', '220903');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('311', '64', '1', '511515');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('888', '49', '3', '057072');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('494', '13', '8', '592707');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('759', '55', '1', '633689');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('304', '01', '1', '942941');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('076', '76', '8', '251616');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('524', '73', '1', '600241');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('101', '47', '8', '293179');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('860', '69', '6', '349014');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('132', '12', '1', '147171');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('636', '11', '7', '416852');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('699', '67', '1', '811414');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('066', '20', '2', '253222');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('571', '58', '9', '515930');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('294', '59', '3', '939767');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('656', '30', '8', '333226');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('952', '79', '1', '054967');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('445', '55', '6', '198641');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('277', '24', '5', '462703');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('829', '11', '9', '595033');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('647', '52', '2', '567961');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('701', '73', '7', '220783');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('538', '61', '4', '109253');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('232', '14', '5', '657813');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('604', '02', '7', '568744');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('999', '69', '6', '319553');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('351', '16', '5', '482340');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('067', '37', '1', '336706');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('014', '38', '6', '407261');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('099', '17', '7', '621526');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('435', '54', '1', '635174');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('560', '30', '8', '132909');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('786', '31', '9', '481588');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('233', '23', '2', '676565');
insert into BookOrder (BookOrder, BookID, CustomerID, Quantity) values ('286', '34', '3', '735561');

SELECT books.bookid, books.booktitle, books.bookgenre, books.price FROM Books  GROUP BY books.bookid, books.BookGenre;

SELECT Books.BookID, Books.BookTitle, BookOrder.BookID,BookOrder.CustomerID, BookOrder.Quantity From Books INNER JOIN BookOrder on Books.BookID = BookOrder.BookID;

SELECT Customer.CustomerID, Customer.fname, Books.BookID, Books.BookTitle, BookOrder.BookID,BookOrder.CustomerID, BookOrder.Quantity
From Books 
INNER JOIN BookOrder on Books.BookID = BookOrder.BookID
INNER JOIN Customer on Customer.CustomerID = BookOrder.CustomerID;

SELECT * FROM books
FULL JOIN BookOrder on Books.BookID = BookOrder.BookID;

SELECT * FROM books
FULL JOIN BookOrder on Books.BookID = BookOrder.BookID
WHERE bookid = 12;
--SELECT CURRENT_DATE;