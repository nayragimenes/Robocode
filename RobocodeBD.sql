CREATE TABLE cidades(
	i_cidade 	INTEGER NOT NULL,
	nome 		VARCHAR(70)	NOT NULL,
	CONSTRAINT pk_cidades PRIMARY KEY(i_cidade)
);


CREATE TABLE bairros(
	i_bairro 	INTEGER NOT NULL,
	nome 		VARCHAR(70) NOT NULL,
	CONSTRAINT pk_bairros PRIMARY KEY(i_bairro)
);


CREATE TABLE logradouros(
	i_logradouro 		INTEGER NOT NULL,
	nome 				VARCHAR(70) NOT NULL,
	tipo_logradouro		CHAR(1) NOT NULL,
	CONSTRAINT pk_logradouro PRIMARY KEY(i_logradouro)
);


CREATE TABLE racas(
	i_raca 		INTEGER NOT NULL,
	nome 		VARCHAR(70) NOT NULL,
	observacao 	VARCHAR(200),
	CONSTRAINT pk_racas PRIMARY KEY(i_raca)
);


CREATE TABLE pets(
	i_pet 		INTEGER NOT NULL,
	i_raca 		INTEGER NOT NULL,
	nome 		VARCHAR(70) NOT NULL,
	descricao 	VARCHAR(100),
	dt_nascto 	DATE,
	cor 		VARCHAR(40) NOT NULL,
	peso 		NUMERIC(7,2) NOT NULL,
	observacao 	VARCHAR(200),
	situacao 	CHAR(1) NOT NULL,
	origem 		CHAR(1)	NOT NULL,
	valor 		NUMERIC(12,2) NOT NULL,
	CONSTRAINT pk_pets			PRIMARY KEY(i_pet),
	CONSTRAINT fk_pets_racas	FOREIGN KEY(i_raca) REFERENCES racas(i_raca)
);


CREATE TABLE pessoas(
	i_pessoa 	 INTEGER NOT NULL,
	nome 		 VARCHAR(70) NOT NULL,
	rg 			 CHAR(7) NOT NULL,
	cpf			 CHAR(11) NOT NULL,
	dt_nascto 	 INTEGER NOT NULL,
	cep			 CHAR(8) NOT NULL,
	numero 		 INTEGER NOT NULL,
	complemento  VARCHAR(70) NOT NULL,
	i_cidade	 INTEGER NOT NULL,
	i_logradouro INTEGER NOT NULL,
	i_bairro	 INTEGER NOT NULL,	
	CONSTRAINT pk_pessoas 			  PRIMARY KEY(i_pessoa),
	CONSTRAINT fk_pessoas_cidades 	  FOREIGN KEY(i_cidade) 	REFERENCES cidades(i_cidade),
	CONSTRAINT fk_pessoas_logradouros FOREIGN KEY(i_logradouro)	REFERENCES logradouros(i_logradouro),
	CONSTRAINT fk_pessoas_bairros 	  FOREIGN KEY(i_bairro) 		REFERENCES bairros(i_bairro)
);


CREATE TABLE adocoes(
	i_adocao  INTEGER NOT NULL,
	i_pessoa  INTEGER NOT NULL,
	i_pet     INTEGER NOT NULL,
	descricao VARCHAR(200) NOT NULL,
	data 	  DATE NOT NULL,
	valor 	  NUMERIC(12,2)	NOT NULL,
	CONSTRAINT pk_adocoes 			PRIMARY KEY(i_adocao),
	CONSTRAINT fk_adocoes_pessoas 	FOREIGN KEY(i_pessoa)	REFERENCES pessoas(i_pessoa),
	CONSTRAINT fk_adocoes_pets 		FOREIGN KEY(i_pet) 		REFERENCES pets(i_pet)
);
	


