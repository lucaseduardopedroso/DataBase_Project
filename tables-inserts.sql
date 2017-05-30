DROP TABLE IF EXISTS FILME;
DROP TABLE IF EXISTS FUNCIONARIO;
DROP TABLE IF EXISTS FORNECEDOR;

CREATE TABLE FUNCIONARIO (Id_Func INTEGER, Nome_Func (100),
                          Data_Nasc DATE, Sexo CHAR (10), 
                          CPF INTEGER, Cargo CHAR (20),
             PRIMARY KEY (Id_Func)
                          
);

CREATE TABLE FUNCIONARIO_RESIDE(
  
);

CREATE TABLE FORNECEDOR (Id_Forn INTEGER, Nome_Forn CHAR (50),
                         CNPJ INTEGER, Telefone INTEGER,
                         Email CHAR (50),
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
