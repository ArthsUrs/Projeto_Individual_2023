create database ProjetoIndividual;

-- drop database ProjetoIndividual;

use ProjetoIndividual;

create table titulo(
	idTitulo int primary key auto_increment,
    titulo varchar(45),
    dtLanc varchar(45),
    plataforma varchar(45)
);

create table usuario (
	idUser int primary key auto_increment,
    nickname varchar(45),
    email varchar(45),
    senha varchar(45),
    fkTitulo int,
    fkInventario int,
    constraint fkInventario foreign key (fkInventario) references inventario(idInventario),
    constraint fkTitulo foreign key (fkTitulo) references titulo(idTitulo)
);

create table item (
	idItem int primary key auto_increment,
    nome varchar(45),
    descricao varchar(45),
    aparicao varchar(45)
);

create table locais(
	idLocais int primary key auto_increment,
    nome varchar(45),
    descricao varchar(45),
    aparicao varchar(45)
);


create table personagem(
	idPersonagem int primary key auto_increment,
	nome varchar(45),
    descricao varchar(45),
    aparicao varchar(45)
);

create table inventario(
	idInventario int primary key auto_increment,
	fkItem int,
    fkLocal int,
    fkPersonagem int,
    constraint fkItem foreign key (fkItem) references item(idItem),
    constraint fkLocal foreign key (fkLocal) references locais(idLocais),
    constraint fkPersonagem foreign key (fkPersonagem) references personagem(idPersonagem)
);

select * from titulo;
select * from usuario;

select * from inventario;

select * from item;
select * from locais;
select * from personagem;

-- inserts 

insert into titulo (titulo , dtLanc, plataforma) values 
('The Legend of Zelda: Skyward Sword', '18 de novembro de 2011', 'Wii'), 
('The Legend of Zelda: Minish Cap', '4 de novembro de 2004', 'GBA'), 
('The Legend of Zelda: Four Swords', '2 de dezembro de 2002 ', 'GBA'), 
('The Legend of Zelda: Ocarina of Time ', '21 de novembro de 1998', 'Nintendo 64'), 
('The Legend of Zelda: Majora s Mask', '27 de abril de 2000', 'Nintendo 64'), 
('The Legend of Zelda: Twilight Princess', '19 de novembro de 2006', 'Wii'), 
('The Legend of Zelda: Four Swords Adventures', ' 18 de março de 2004', 'GameCube'), 
('The Legend of Zelda: A Link to the Past ', '21 de novembro de 1991', 'SNES'), 
('The Legend of Zelda: Link s Awakening', '6 de junho de 1993', 'GB'), 
('The Legend of Zelda: Oracle of Ages/Seasons', '27 de fevereiro de 2001/14 de maio de 2001', 'GB color'), 
('The Legend of Zelda', '21 de fevereiro de 1986', 'NES'), 
('Zelda II: The Adventure of Link', '14 de janeiro de 1987', 'NES'), 
('The Legend of Zelda: Phantom Hourglass', '23 de junho de 2007', 'DS'), 
('The Legend of Zelda: Spirit Tracks', '23 de dezembro de 2009', 'DS'),
('The Legend of Zelda: A Link Between World', '22 de novembro de 2013', '3DS'),
('The Legend of Zelda: Tri Force Heroes', '22 de outubro de 2015', '3DS'),
('The Legend of Zelda: Breath of the Wild', '3 de março de 2017', 'Nintendo Switch'),
('The Legend of Zelda: Tears of the Kingdom', '12 de maio de 2023', 'Nintendo Switch');

insert into locais(
	
);

truncate table titulo;