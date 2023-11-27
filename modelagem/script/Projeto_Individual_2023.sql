drop database ProjetoIndividual;

create database ProjetoIndividual;

use ProjetoIndividual;

create table titulo(
	idTitulo int primary key auto_increment,
    titulo varchar(45),
    dtLanc varchar(45),
    plataforma varchar(45)
);

create table item (
	idItem int primary key auto_increment,
    nome varchar(45),
    descricao varchar(400),
    aparicao varchar(45)
);

create table locais(
	idLocais int primary key auto_increment,
    nome varchar(45),
    descricao varchar(400),
    aparicao varchar(45)
);


create table personagem(
	idPersonagem int primary key auto_increment,
	nome varchar(45),
    descricao varchar(400),
    aparicao varchar(45)
);

create table usuario (
	idUser int primary key auto_increment,
    nickname varchar(45) unique,
    email varchar(45) unique,
    senha varchar(45),
    fkTitulo int,
    fkItem int,
    fkLocal int,
    fkPersonagem int,
    constraint fkItem foreign key (fkItem) references item(idItem),
    constraint fkLocal foreign key (fkLocal) references locais(idLocais),
    constraint fkPersonagem foreign key (fkPersonagem) references personagem(idPersonagem),
    constraint fkTitulo foreign key (fkTitulo) references titulo(idTitulo)
);

-- inserts 

insert into titulo (titulo , dtLanc, plataforma) values 
('The Legend of Zelda: Skyward Sword', '18 de novembro de 2011', 'Wii'), 
('The Legend of Zelda: Minish Cap', '4 de novembro de 2004', 'GBA'), 
('The Legend of Zelda: Four Swords', '2 de dezembro de 2002 ', 'GBA'), 
('The Legend of Zelda: Ocarina of Time ', '21 de novembro de 1998', 'Nintendo 64'), 
('The Legend of Zelda: Majora s Mask', '27 de abril de 2000', 'Nintendo 64'), 
('The Legend of Zelda: Twilight Princess', '19 de novembro de 2006', 'Wii'),  
('The Legend of Zelda: A Link to the Past ', '21 de novembro de 1991', 'SNES'), 
('The Legend of Zelda: Link s Awakening', '6 de junho de 1993', 'GB'), 
('The Legend of Zelda: Oracle of Ages/Seasons', '27 de fevereiro de 2001/14 de maio de 2001', 'GB color'), 
('The Legend of Zelda', '21 de fevereiro de 1986', 'NES'), 
('Zelda II: The Adventure of Link', '14 de janeiro de 1987', 'NES'), 
('The Legend of Zelda: Phantom Hourglass', '23 de junho de 2007', 'DS'), 
('The Legend of Zelda: Spirit Tracks', '23 de dezembro de 2009', 'DS'),
('The Legend of Zelda: A Link Between World', '22 de novembro de 2013', '3DS'),
('The Legend of Zelda: Breath of the Wild', '3 de março de 2017', 'Nintendo Switch'),
('The Legend of Zelda: Tears of the Kingdom', '12 de maio de 2023', 'Nintendo Switch');

insert into locais (nome, descricao) values
	('Kakariko Village', 'Essa pequena vila aparece desde sempre nos jogos, como um lugar calmo e limpo, onde Link e Zelda podem descansar, '), 
    ('Hateno Village', 'Sendo bem nova no universo de Zelda, hatenno aparece como sendo uma possível casa onde Link moraria antes da calamidade de Breath of the Wild'), 
    ('Lon Lon Ranch', 'Um doa lugares mais clássico do universo do jogo, ele tem sua principal aparição em Zelda ocarina of time, mas aparece indiretamente em botw, dizem qu sua muusica faz o mais fortes dos homens se emocionarem'),
    ('Castelo de hyrule', 'Tendo sua aparição em praticamente todos os Zeldas, o castelo geralmente é o palco das batalhas lendarias entre Link, Zelda e Ganon'),
    ('Gerudo Valley', 'Um dos lugares mais clássicos de TODOS os zeldas, sendo um lugar seco e de areia que quebra o clima de todos os outros lugares de todos os universos de Zelda');

insert into personagem (nome, descricao) values
	('Zelda', 'A portadora do nome do jogo e segunda protagonista. A reencarnação da Deus Hylia portador da Triforce da sabedoria, que ajuda Link a deter as reencarações do rei do mal'), 
	('Ganon/Ganondorf', 'O maior vilão da serie, portador da Triforce do poder, tenta de todos os modos conquistar as outras 2 partes, para que assim possa por fima realizar seu desejo final'), 
	('Link', 'O melhor personagem da série(sem clubismo), Link com sua Triforce da coragem quase sempre visa salvar a princesa Zelda derrotando Ganon, e para isso ele se passa por desafios a altura de sua coragem'), 
	('Impa', 'Impa é retratado tanto nos mangás quantos nos jogos como uma protetora de Zelda.');
    

insert into item (nome, descricao) values ('Master Sword', 'Um dos itens mais classicos da serie, a espada que sela o mal geralmente é entregue a Link depois que o próprio prova que é digna de tal'),
	('Hylian Shield', 'um escudo controverso que é retratado em todas as representações gráficas do herói que sela o mal, nos jogos ele varia como um item mistico e um item vendido aleatoriamente'), 
    ('Triforce', 'O Item mais importante de toda série, a triforce é composta por 3 partes, sendo elas: Poder, Coragem e sabedoria, que são portadas por Ganon, Link e Zelda respectivamente'),
    ('Kokiri Shield', 'Um Item classico de um dos melhores jogos de todos os tempos, kokiri shield é um item especial dado a voce pela arvore deku, e que te acompanha até você atinigir a maturidade ou comprar um Hylian Shield');
    
    
    -- scripts
    
    select * from usuario;
    select * from item;
    select * from titulo;
    select * from locais;
    select * from personagem;
    
    
    select count(u.fkTitulo) as count, t.titulo from usuario as u join titulo as t on u.fkTitulo = t.idTitulo group by t.titulo;