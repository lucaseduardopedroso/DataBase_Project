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
                          F_CPF INTEGER, Cargo CHAR (20),
             PRIMARY KEY (Id_Func)            
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
                     A_DataNasc DATE, E_PaisOrigem CHAR (30),
             PRIMARY KEY (Id_Ator)
);
                  
CREATE TABLE FILME (Id_Filme INTEGER, Nome_Filme CHAR (100), 
                    FaixaEtaria INTEGER, Sinopse CHAR (200), 
                    Elenco CHAR (140), Id_Genero INTEGER,
                    Duracao TIME, Idioma CHAR (30),
                    Id_Forn INTEGER, Diretor CHAR (50),
             PRIMARY KEY (Id_Filme),
             FOREIGN KEY (Id_Genero) REFERENCES GENERO (Id_Genero),
             FOREIGN KEY (Id_Forn) REFERENCES FORNECEDOR (Id_Forn)
); 

CREATE TABLE FILME_TEM_ATORES (Id_Filme INTEGER, Id_Elenco INTEGER,
			 PRIMARY KEY (Id_Filme, Id_Elenco),
             FOREIGN KEY (Id_Filme) REFERENCES FILME (Id_Filme),
             FOREIGN KEY (Id_Elenco) REFERENCES ATORES (Id_Ator)
);                               

CREATE TABLE SESSAO (Cod_Sessao INTEGER, Id_Sala INTEGER,
                     Horario TIME, Id_Filme INTEGER,
                     Data DATE, NroVendas INTEGER,
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
