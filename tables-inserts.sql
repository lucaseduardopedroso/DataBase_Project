DROP TABLE IF EXISTS CINEMA_LOCALIZADO;
DROP TABLE IF EXISTS FUNCIONARIO_RESIDE;
DROP TABLE IF EXISTS FUNCIONARIO_GERAINGRESSO_RESERVA;
DROP TABLE IF EXISTS FUNCIONARIO_GERAINGRESSO;
DROP TABLE IF EXISTS PROTOCOLO_VENDAS;
DROP TABLE IF EXISTS CLIENTE_RESERVAINGRESSO;
DROP TABLE IF EXISTS INGRESSO;
DROP TABLE IF EXISTS SESSAO;
DROP TABLE IF EXISTS FILME_TEM_DIRETOR;
DROP TABLE IF EXISTS FILME_TEM_ATORES;
DROP TABLE IF EXISTS FILME;
DROP TABLE IF EXISTS ATORES;
DROP TABLE IF EXISTS GENERO;
DROP TABLE IF EXISTS FORNECEDOR;
DROP TABLE IF EXISTS CLIENTE;
DROP TABLE IF EXISTS FUNCIONARIO;
DROP TABLE IF EXISTS SALA;
DROP TABLE IF EXISTS CINEMA;

CREATE TABLE CINEMA (Id_Cine INTEGER, Nome_Cine CHAR (50),
                     Cine_CNPJ INTEGER, Cine_Telefone INTEGER,
                     Cine_Email CHAR (50),
             PRIMARY KEY (Id_Cine)
);

CREATE TABLE SALA (Id_Sala INTEGER, Id_SalaCine INTEGER,
                   CapacidadeMax INTEGER,
             PRIMARY KEY (Id_Sala, Id_SalaCine),
             FOREIGN KEY (Id_SalaCine) REFERENCES CINEMA (Id_Cine)
);

CREATE TABLE FUNCIONARIO (Id_Func INTEGER, Nome_Func CHAR (100),
                          F_Telefone INTEGER, F_Email CHAR (50),
                          F_DataNasc DATE, F_Sexo CHAR (10), 
                          F_CPF INTEGER,
			  Id_Cine INTEGER,
             PRIMARY KEY (Id_Func, Id_Cine),
	     FOREIGN KEY (Id_Cine) REFERENCES CINEMA (Id_Cine)	  
);

CREATE TABLE CLIENTE (Id_Cliente INTEGER, Nome_Cliente CHAR(100),
                      C_Data_Nasc DATE, C_Sexo CHAR (10), 
                      C_CPF INTEGER, C_Email CHAR (50),
                      C_Telefone INTEGER,
             PRIMARY KEY (Id_Cliente)        
);

CREATE TABLE FORNECEDOR (Id_Forn INTEGER, Nome_Forn CHAR (50),
                         FO_CNPJ INTEGER, FO_Telefone INTEGER,
                         FO_Email CHAR (50),
             PRIMARY KEY (Id_Forn)            
);

CREATE TABLE GENERO (Id_Genero INTEGER, Nome_Genero CHAR (30),
             PRIMARY KEY (Id_Genero)
);

CREATE TABLE ATORES (Id_Ator INTEGER, Nome_Ator CHAR (100),
                     A_DataNasc DATE, A_PaisOrigem CHAR (30),
             PRIMARY KEY (Id_Ator)
);
                  
CREATE TABLE FILME (Id_Filme INTEGER, Nome_Filme CHAR (100), 
                    FaixaEtaria INTEGER, Sinopse CHAR (200), 
                    Atores CHAR (140), Id_Genero INTEGER,
                    Duracao TIME, Idioma CHAR (30),
                    Id_Forn INTEGER, Diretor CHAR (50),
             PRIMARY KEY (Id_Filme),
             FOREIGN KEY (Id_Genero) REFERENCES GENERO (Id_Genero),
             FOREIGN KEY (Id_Forn) REFERENCES FORNECEDOR (Id_Forn)
); 

CREATE TABLE FILME_TEM_ATORES (Id_Filme INTEGER, Id_Ator INTEGER,
			 PRIMARY KEY (Id_Filme, Id_Ator),
             FOREIGN KEY (Id_Filme) REFERENCES FILME (Id_Filme),
             FOREIGN KEY (Id_Ator) REFERENCES ATORES (Id_Ator)
);                               

CREATE TABLE SESSAO (Cod_Sessao INTEGER, Id_Sala INTEGER,
                     Horario TIME, Id_Filme INTEGER,
                     Data DATE,
             PRIMARY KEY (Cod_Sessao, Id_Sala, Id_Filme, Data),
             FOREIGN KEY (Id_Filme) REFERENCES FILME (Id_Filme),
             FOREIGN KEY (Id_Sala) REFERENCES SALA (Id_sala)         
);                      

CREATE TABLE INGRESSO (Id_Ingresso INTEGER, Cod_Sessao INTEGER,
             PRIMARY KEY (Id_Ingresso, Cod_Sessao),
             FOREIGN KEY (Cod_sessao) REFERENCES SESSAO (Cod_Sessao)    
);

CREATE TABLE CLIENTE_RESERVAINGRESSO (Id_Cliente INTEGER, Id_Reserva INTEGER,
                                      Id_Ingresso INTEGER,
             PRIMARY KEY (Id_Reserva, Id_Cliente, Id_Ingresso),
             FOREIGN KEY (Id_Cliente) REFERENCES CLIENTE (Id_Cliente),
             FOREIGN KEY (Id_Ingresso) REFERENCES INGRESSO (Id_Ingresso)
);

CREATE TABLE PROTOCOLO_VENDAS (Id_Protocolo INTEGER,
             PRIMARY KEY (Id_Protocolo)
);

CREATE TABLE FUNCIONARIO_GERAINGRESSO (Id_GeraIngresso INTEGER, Id_Protocolo INTEGER, 
                                       Id_Func INTEGER, Id_Ingresso INTEGER,
             PRIMARY KEY (Id_Func, Id_Ingresso, Id_Protocolo, Id_GeraIngresso),
             FOREIGN KEY (Id_Func) REFERENCES FUNCIONARIO (Id_Func),
             FOREIGN KEY (Id_Protocolo) REFERENCES PROTOCOLO_VENDAS (Id_Protocolo), 
             FOREIGN KEY (Id_Ingresso) REFERENCES INGRESSO (Id_Ingresso)
);

CREATE TABLE FUNCIONARIO_GERAINGRESSO_RESERVA (Id_GeraIngressoR INTEGER, Id_Protocolo INTEGER, 
                                               Id_Func INTEGER, Id_Reserva INTEGER,
             PRIMARY KEY (Id_Func, Id_Reserva, Id_Protocolo, Id_GeraIngressoR),
             FOREIGN KEY (Id_Func) REFERENCES FUNCIONARIO (Id_Func),
             FOREIGN KEY (Id_Protocolo) REFERENCES PROTOCOLO_VENDAS (Id_Protocolo), 
             FOREIGN KEY (Id_Reserva) REFERENCES CLIENTE_RESERVAINGRESSO (Id_Reserva)
);     
                                      
CREATE TABLE FUNCIONARIO_RESIDE(Cidade CHAR (20), UF CHAR (2),
                                Numero INTEGER, CEP INTEGER,
                                Logradouro CHAR (20), Id_Func INTEGER,
             PRIMARY KEY (Cidade, Id_Func),
             FOREIGN KEY (Id_Func) REFERENCES FUNCIONARIO (Id_Func)
  
);

CREATE TABLE CINEMA_LOCALIZADO (Cidade CHAR (20), UF CHAR (2),
                                Numero INTEGER, CEP INTEGER,
                                Logradouro CHAR (20), Id_Cine INTEGER,
             PRIMARY KEY (Cidade, Id_Cine),
             FOREIGN KEY (Id_Cine) REFERENCES CINEMA (Id_Cine)
);

INSERT INTO CINEMA (Id_Cine, Nome_Cine, Cine_CNPJ, Cine_Telefone, Cine_Email) VALUES (01, Cine Star, 0908268385, 4430275134, contato@cinestar.com), (02, CineMark, 08049348504, 1130456945, cine@cinemark.com);
INSERT INTO SALA (Id_Sala, Id_SalaCine, CapacidadeMax) VALUES (001, 01, 200), (002, 01, 200), (003, 01, 200), (004, 01, 200), (005, 01, 200), (001, 02, 200), (002, 02, 200), (003, 02, 200), (004, 02, 200), (005, 02, 200);
INSERT INTO FUNCIONARIO (Id_Func, Nome_Func, F_Telefone, F_Email, F_DataNasc, F_Sexo, F_CPF, Id_Cine) VALUES (1001, Gregorio, 1198435632, gregroger@hotmail.com, 09/10/1998, Masculino, 08347626606, 01), (1015, Stefano, 119912415604, stefano.pepper@gmail.com, 23/06/1994, Masculino, 0873483978, 01), (1016, Greicy Kelly, 1199456832, gklopes@hotmail.com, 02/02/1995, Feminino, 68344693409, 01), (0010, Josiele, 44998724832, jos.joice@hotmail.com, 24/01/1996, Feminino, 08439458706, 02), (0035, Mariana, 44988634532, mariluci@gmail.com, 16/08/1995, Feminino, 05034689307, 02), (0016, Jaime, 4498503294, jajaiminho@hotmail.com, 01/11/1993, Masculino, 08035027409, 02);
INSERT INTO CLIENTES (Id_Cliente, Nome_Cliente, C_Data_Nasc, C_Sexo, C_CPF, C_Email, C_Telefone) VALUES (1020, Nomi, 20/12/2001, Feminino, 07049327305, nomi@sensate.com, 11996583065), (1021, Riley, 20/12/2001, Feminino, 08086942206, blueriley@sensate.com, 11988594324), (1023, Joshua, 10/04/2000, Masculino, 07038956305, joshx@hotmail.com, 44991271347), (1024, Katie, 30/10/1994, Feminino, 08076423906, katiefitch@gmail.com, 44999344004);
