CREATE DATABASE exercicios_trigger;
USE exercicios_trigger;

-- Criação das tabelas
CREATE TABLE Clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Auditoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mensagem TEXT NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE Pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

create trigger new_client
on Clientes 
after insert
as
begin
    insert into Auditoria
        (mensagem, data_hora)
    values
        ('Novo cliente ás', CURRENT_TIMESTAMP)
end

create trigger delete
on Clientes
before delete
as
begin
    insert into Auditoria
        (mensagem)
    values
        ('Tentativa de deletar usuario')
end

create trigger name_update
on nome
after name_update
as
begin
    insert into Auditoria
        (mensagem)
    values
        old.nome and new.nome
end