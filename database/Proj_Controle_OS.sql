-- a linha abaixo, cria um banco de dados
create database dbinfox;

-- a linha abaixo, escolhe o banco de dados
use dbinfox;

-- o bloco de instruções abaixo, cria uma tabela
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null, /*not null, p/ obrigar o preenchimento do campo*/
fone varchar(15),
login varchar(15) not null unique, /*unique o campo se torna único*/
senha varchar(15) not null
);

-- o comando abaixo, descreve a tabela
describe tbusuarios;

-- a linha abaixo, insere dados na tabela
-- Create -> insert
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(1,'Felipe Pereira','9999-9999','felipereira','123456');

-- a linha abaixo, exibe os dados da tabela
-- Read -> select
select * from tbusuarios;

-- a linha abaixo, insere dados na tabela
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(2,'José Silva','9999-8888','jose','123456');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3,'Bill Gates','9999-7777','bill','123456');

-- a linha abaixo, modifica dados na tabela (CRUD)
-- update -> update
update tbusuarios set fone='8888-8888' where iduser=2; /*where é essencial, senão modifica de todos os usuários*/


-- a linha abaixo, apaga um registro da tabela (CRUD)
-- delete -> delete
delete from tbusuarios where iduser=3; /*where é essencial, senão apaga de todos os usuários*/

select * from tbusuarios;

create table tbclientes (
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);

describe tbclientes;
 
insert into tbclientes (nomecli,endcli,fonecli,emailcli)
values ('Cristiano Ronaldo','Rua Madrid, 15','1333-5555','cr7@gmail.com');

select * from tbclientes;

use dbinfox;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null, /*será a chave estrangeira (foreign key)*/
foreign key(idcli) references tbclientes(idcli)
);

describe tbos;

insert into tbos (equipamento,defeito,servico,tecnico,valor,idcli)
values ('Notebook','Não liga','Troca da fonte','José',87.50,1);

-- o código abaixo, traz informações de duas tabelas
select
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli
from tbos as O
inner join tbclientes as C -- para juntar
on (O.idcli = C.idcli);









