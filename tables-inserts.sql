DROP TABLE IF EXISTS FILME;
DROP TABLE IF EXISTS FUNCIONARIO;
DROP TABLE IF EXISTS FORNECEDOR;
DROP TABLE IF EXISTS FUNCIONARIO_RESIDE;

CREATE TABLE CINEMA (Id_Cine INTEGER, Nome_Cine (50),
                     Cine_CNPJ INTEGER, Cine_Telefone INTEGER,
                     Cine_Email CHAR (50),
             FOREIGN KEY (Id_Cine)
);

CREATE TABLE SALA (Id_Sala INTEGER, Id_SalaCine INTEGER,
                   CapacidadeMax INTENGER,
             PRIMARY KEY (Id_Sala, Id_SalaCine),
             FOREIGN KEY (Id_SalaCine) REFERENCES CINEMA (Id_Cine)
);

CREATE TABLE SALA_TEMPOLTRONAS (Id_Sala INTEGER,
                                Nro_Poltrona INTEGER, Fileira CHAR (1),
             PRIMARY KEY (Nro_Poltrona, Fileira, Id_Sala),
             FOREIGN KEY (Id_Sala) REFERENCES SALA (Id_Sala)                   
);

CREATE TABLE FUNCIONARIO (Id_Func INTEGER, Nome_Func (100),
                          F_Telefone INTEGER, F_Email CHAR (50),
                          F_DataNasc DATE, F_Sexo CHAR (10), 
                          F_CPF INTEGER, Cargo CHAR (20),
             PRIMARY KEY (Id_Func)            
);

CREATE TABLE CLIENTE (Id_Cliente INTEGER, Nome_Cliente (100),
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

CREATE TABLE ELENCO (Id_Ator INTEGER, Nome_Ator CHAR (100),
                     A_DataNasc DATE, E_PaisOrigem CHAR (30),
             PRIMARY KEY (Id_Ator)
);

CREATE TABLE DIRETOR (Id_Diret INTEGER, Nome_Diret CHAR (100),
                     D_Data_Nasc DATE, D_PaisOrigem CHAR (30),
             PRIMARY KEY (Id_Ator)
);
                     
CREATE TABLE FILME (Id_Filme INTEGER, Nome_Filme CHAR (100), 
                    FaixaEtaria INTEGER, Sinopse CHAR (500), 
                    Elenco CHAR (140), Id_Genero CHAR (20),
                    Duracao TIME, Idioma CHAR (30),
                    Id_Forn INTEGER,
             PRIMARY KEY (Id_Filme),
             FOREING KEY (Id_Genero) REFERENCES (Id_Genero),
             FOREIGN KEY (Id_Forn) REFERENCES FORNECEDOR (Id_Forn)
); 

CREATE TABLE FILME_TEM_ELENCO (Id_Filme, Id_Elenco,
             FOREIGN KEY (Id_Filme) REFERENCES FILME (Id_Filme),
             FOREIGN KEY (Id_Elenco) REFERENCES ELENCO (Id_Elenco)
);                               

CREATE TABLE FILME_TEM_DIRETOR (Id_Filme, Id_Diretor,
             FOREIGN KEY (Id_Filme) REFERENCES FILME (Id_Filme),
             FOREIGN KEY (Id_Diretor) REFERENCES DIRETOR (Id_Diretor)
); 

CREATE TABLE SESSAO (Cod_Sessao INTEGER, Id_Sala INTEGER,
                     Horario TIME, Id_Filme INTEGER,
                     Data DATE, NroVendas INTEGER,
             PRIMARY KEY (Cod_Sessao, Id_Sala, Id_Filme, Data),
             FOREIGN KEY (Id_Filme) REFERENCES FILME (Id_Filme),
             FOREIGN KEY (Id_Sala) REFERENCES SALA (Id_sala)         
);                      

CREATE TABLE INGRESSO (
                       
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

INSERT INTO VALUES 
