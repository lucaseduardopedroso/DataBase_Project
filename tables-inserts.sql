DROP TABLE IF EXISTS FILME;
DROP TABLE IF EXISTS FUNCIONARIO;
DROP TABLE IF EXISTS FORNECEDOR;


CREATE TABLE FILME (Id_Filme INTEGER, Nome_Filme CHAR (30), 
                    Faixa_E INTEGER,
                    Sinopse CHAR (500), Diretor CHAR (30),
                    Elenco CHAR (140), Genero CHAR (20),
                    Duracao TIME, Idioma CHAR (30)                    
); 

CREATE TABLE FUNCIONARIO (Nome_Func CHAR (30), Id_Func INTEGER,
                          CPF INTEGER, Cargo CHAR (20),     
                          
);

CREATE TABLE FORNECEDOR (Nome_Forn CHAR (30), Id_Forn INTEGER,
                         CPF INTEGER, 
                         
);


INSERT INTO VALUES 
