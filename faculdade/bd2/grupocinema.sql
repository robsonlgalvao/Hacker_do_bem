create database  GrupoCinema;
use GrupoCinema;
create table pessoa(
	idPes INT NOT NULL AUTO_INCREMENT,
    nomePes VARCHAR(80) NOT NULL,
    nacionalidadePes VARCHAR(100),
    idadePes INT,
    PRIMARY KEY(idPes)
)ENGINE=INNODB;

create table cinema(
	idCinema INT NOT NULL AUTO_INCREMENT,
    nomeFantasia VARCHAR(80) NOT NULL,
    avenida VARCHAR(80),
    bairro VARCHAR(80),
    municipio VARCHAR(80),
    estado VARCHAR(80),
    capacidade VARCHAR(80),
    PRIMARY KEY(idCinema)
 )ENGINE=INNODB;
  
 create table genero(
	codGenero INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(300),
    PRIMARY KEY (codGenero)
 )ENGINE=INNODB;
 
 create table sessao(
	codSessao INT NOT NULL AUTO_INCREMENT,
    horarioSessao TIME,
    dataSessao DATE,
    PRIMARY KEY(codSessao)
 )ENGINE=INNODB;
 
 create table diretor(
	idDiretor INT,
    PRIMARY KEY (idDiretor),
    FOREIGN KEY (idDiretor)REFERENCES Pessoa(idPes)
 )ENGINE=INNODB;
 
 create table ator(
	idAtor INT,
    PRIMARY KEY (idAtor),
    FOREIGN KEY (idAtor)REFERENCES Pessoa(idPes)
 )ENGINE=INNODB;
 
 create table filme(
	codFilme INT NOT NULL AUTO_INCREMENT,
    paisOrigem VARCHAR(50),
    impropriedade VARCHAR(80),
    duracao VARCHAR(80),
    tituloOriginal VARCHAR(50),
    Diretor_fk INT,
    codGenero_fk INT, 
    PRIMARY KEY (codFilme),
    FOREIGN KEY(Diretor_fk) REFERENCES diretor(idDiretor),
    FOREIGN KEY(codGenero_fk) REFERENCES genero(codGenero)
  )ENGINE=INNODB;
  
  create table filmeEstrangeiro(
	codFilme INT,
    tituloPortugues VARCHAR(50),
    PRIMARY KEY(codFilme),
    FOREIGN KEY(codFilme)REFERENCES filme(codFilme)
  );
  
  create table atua(
	idAtorAs INT,
    codFilmeAs INT,
    FOREIGN KEY(idAtorAs)REFERENCES ator(idAtor),
    FOREIGN KEY(codFilmeAs)REFERENCES filme(codFilme)
  );
  
  create table apresentacao(
	idCinema INT,
    codFilme INT,
    codSessao INT,
    qtdPublico INT,
    FOREIGN KEY(idCinema)REFERENCES cinema(idCinema),
    FOREIGN KEY(codFilme)REFERENCES filme(codFilme),
    FOREIGN KEY(codSessao)REFERENCES sessao(codSessao)
  );
  
  insert into pessoa value(0,"Robson","Brasileiro",35);
  insert into pessoa value(0,"Renan","Brasileiro",20);
  insert into pessoa value(0,"Gabriele","Brasileira",22);
  insert into pessoa value(0,"junin","Brasileiro",19);
  insert into cinema value(0,"Salão itaú","Avenida Amaral","Inhoaíba","Rio de Janeiro","Niterói","2000");
  insert into cinema value(0,"Caiçara","parmalat","rua paraguai","Rio das ostras","pandaré","300");
  insert into cinema value(0,"Espaço neves","poia","lost","tão tão distante","longe","1520");
  insert into cinema value(0,"largo da batalha","largo da batalha","neves","Rio de Janeiro","Niterói","8000");
  insert into genero value(0,"Não questione só aceite");
  insert into genero value(0,"Terror");
  insert into genero value(0,"Romance");
  insert into genero value(0,"Luta");
  insert into sessao value(0,"18:00:00","2024-05-13");
  insert into sessao value(0,"17:45:00","2024-12-23");
  insert into sessao value(0,"10:00:00","2025-02-03");
  insert into sessao value(0,"16:30:00","2024-09-05");
  insert into diretor value(1);
  insert into diretor value(2);
  insert into ator value(3);
  insert into ator value(4);
  insert into filme value(0,"Japão","16anos","1h45m","kungfusão",2,3);
  insert into filme value(0,"EUA","18anos","2h00m","Massacre",1,3);
  insert into filme value(0,"Russia","10anos","1h30m","O espião",2,2);
  insert into filme value(0,"Brasil","18anos","2h45m","Federal",1,1);
  insert into filmeestrangeiro value(1,"Agora já foi");
  insert into filmeestrangeiro value(2,"Eita");
  insert into filmeestrangeiro value(4,"Tieta");
  insert into filmeestrangeiro value(3,"Não é não");
  insert into atua value(3,4);
  insert into atua value(4,3);
  insert into atua value(4,2);
  insert into atua value(3,1);
  insert into apresentacao value(1,2,3,350);
  insert into apresentacao value(1,1,2,50);
  insert into apresentacao value(2,2,4,150);
  insert into apresentacao value(3,4,1,350);
