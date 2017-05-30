DROP TABLE IF EXISTS FILME;
DROP TABLE IF EXISTS FUNCIONARIO;
DROP TABLE IF EXISTS FORNECEDOR;
DROP TABLE IF EXISTS FUNCIONARIO_RESIDE;

CREATE TABLE FUNCIONARIO (Id_Func INTEGER, Nome_Func (100),
                          F_Telefone INTEGER, F_Email CHAR (50),
                          F_Data_Nasc DATE, F_Sexo CHAR (10), 
                          F_CPF INTEGER, Cargo CHAR (20),
             PRIMARY KEY (Id_Func)
                          
);

CREATE TABLE CLIENTE (Id_Cliente INTEGER, Nome_Cliente (100),
                      C_Data_Nasc DATE, C_Sexo CHAR (10), 
                      C_CPF INTEGER, C_Email CHAR (50),
                      C_Telefone INTEGER,
             PRIMARY KEY (Id_Cliente)
                      
);

CREATE TABLE SESSAO (Cod_Sessao INTEGER, Sala INTEGER,
                     HorarioInicial TIME, HorarioFinal TIME,
                     Id_Filme INTEGER, Nome_Filme CHAR (100),
             PRIMARY KEY (Cod_Sessao),
             FOREIGN KEY (Id_Filme) REFERENCES FILME (Id_Filme),
             FOREIGN KEY (Nome_Filme) REFERENCES FILME (Nome_Filme)
            
);        
               
CREATE TABLE POLTRONAS (Nro_Poltrona INTEGER, Fileira CHAR (1),
             PRIMARY KEY (Nro_Poltrona, Fileira)
               
);

CREATE TABLE INGRESSO (Cod_Ingresso INTEGER, Cod_Sessao INTEGER,
                       Nome_Filme CHAR (100), Sala_S INTEGER,
                       HorarioInicial TIME, HorarioFinal TIME,
                       Nro_Poltrona INTEGER, Fileira CHAR (1), 
             PRIMARY KEY (Cod_Ingresso), 
             FOREIGN KEY (Cod_Sessao) REFERENCES SESSAO (Cod_Sessao),
             FOREIGN KEY (Nome_Filme) REFERENCES SESSAO (Nome_Filme),
             FOREIGN KEY (HorarioInicial) REFERENCES SESSAO (HorarioInicial),
             FOREIGN KEY (HorarioFinal) REFERENCES SESSAO (HorarioFinal),
             FOREIGN KEY (Nro_Poltrona) REFERENCES POLTRONAS (Nro_Poltrona),
             FOREIGN KEY (Fileira) REFERENCES POLTRONAS (Fileira)
                       
);

CREATE TABLE FUNCIONARIO_RESIDE(Cidade CHAR (20), UF CHAR (2),
                                Numero INTEGER, CEP INTEGER,
                                Logradouro CHAR (20), Id_Func INTEGER,
             PRIMARY KEY (Cidade, Id_Func),
             FOREIGN KEY (Id_Func) REFERENCES FUNCIONARIO (Id_Func)
  
);

CREATE TABLE FORNECEDOR (Id_Forn INTEGER, Nome_Forn CHAR (50),
                         CNPJ INTEGER, FO_Telefone INTEGER,
                         FO_Email CHAR (50),
             PRIMARY KEY (Id_Forn)            
);

CREATE TABLE FILME (Id_Filme INTEGER, Nome_Filme CHAR (100), 
                    FaixaEtaria INTEGER,
                    Sinopse CHAR (500), Diretor CHAR (30),
                    Elenco CHAR (140), Genero CHAR (20),
                    Duracao TIME, Idioma CHAR (30),
                    Id_Forn INTEGER,
             PRIMARY KEY (Id_Filme),
             FOREIGN KEY (Id_Forn) REFERENCES FUNCIONARIOS (Id_Forn)
); 




INSERT INTO VALUES 
