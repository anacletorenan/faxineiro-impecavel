create database biblioteca;

use biblioteca;

CREATE TABLE Livros (
    livros_id INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    editora VARCHAR(255),
    ano_publicacao INT,
    isbn VARCHAR(13)
);

alter table Livros modify livros_id int auto_increment;

create table Autores(
autores_id int primary key,
nome_autor varchar(50) not null
);

create table Editoras(
editoras_id int primary key,
nome_editora varchar(50) not null
);

alter table Livros drop column autor;
alter table Livros drop column editora;

alter table Livros add column autores_id int not null;
alter table Livros add column editoras_id int not null;

alter table Livros add foreign key fk_editoras_id (editoras_id) references Editoras(editoras_id);
alter table Livros add foreign key fk_autores_id (autores_id) references Autores(autores_id);

alter table Livros modify isbn varchar(18) not null;

INSERT INTO Editoras (editoras_id, nome_editora) VALUES 
(1, 'Nova Fronteira'),
(2, 'Companhia das Letras'),
(3, 'Companhia Editora Nacional'),
(4, 'Martin Claret'),
(5, 'Penguin Companhia');

INSERT INTO Autores (autores_id, nome_autor) VALUES 
(1, 'João Guimarães Rosa'),
(2, 'Machado de Assis'),
(3, 'Graciliano Ramos'),
(4, 'Aluísio Azevedo'),
(5, 'Mário de Andrade');

INSERT INTO Livros (titulo, ano_publicacao, isbn, autores_id, editoras_id) VALUES 
('Grande Sertão: Veredas', 1956, '978-85-209-2325-1', 1, 1),
('Memórias Póstumas de Brás Cubas', 1881, '9788535910663', 2, 2),
('Vidas Secas', 1938, '9788572326972', 3, 3),
('O Alienista', 1882, '9788572327429', 2, 4),
('O Cortiço', 1890, '9788579027048', 4, 5),
('Dom Casmurro', 1899, '9788583862093', 2, 5),
('Macunaíma', 1928, '9788503012302', 5, 3);

select * from Livros;