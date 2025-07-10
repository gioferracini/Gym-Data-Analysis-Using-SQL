CREATE DATABASE academia;

CREATE TABLE alunos(
id_aluno int not null primary key auto_increment,
nome_aluno varchar(100) not null,
data_nasc_aluno date not null,
idade_aluno smallint not null,
sexo_aluno char(2) not null,
telefone_aluno varchar(20) not null,
endereco_aluno varchar(200) not null,
bairro_aluno varchar(100) not null,
cidade_aluno varchar(100) not null,
uf_aluno char(2) not null,
email_aluno varchar(100) not null,
data_matricula_aluno date not null,
status_aluno varchar(10) not null
);

CREATE TABLE modalidades(
id_modalidade int not null primary key auto_increment,
nome_modalidade varchar(100) not null
);

CREATE TABLE planos(
id_plano int not null primary key auto_increment,
nome_plano varchar(50) not null,
valor_plano float not null
);

CREATE TABLE professores(
id_prof int not null primary key auto_increment,
nome_prof varchar(100) not null,
data_nasc_prof date not null,
idade_prof smallint not null,
sexo_prof char(2) not null,
telefone_prof varchar(20) not null,
endereco_prof varchar(200) not null,
bairro_prof varchar(100) not null,
cidade_prof varchar(100) not null,
uf_prof char(2) not null,
email_prof varchar(100) not null,
perfil_prof varchar(50) not null,
salario_prof float not null,
data_matricula_prof date not null,
status_prof varchar(10) not null
);

CREATE TABLE aluno_modalidade(
id_am int not null primary key auto_increment,
id_aluno int not null,
id_modalidade int not null,
FOREIGN KEY (id_aluno) REFERENCES alunos (id_aluno),
FOREIGN KEY (id_modalidade) REFERENCES modalidades (id_modalidade)
);

CREATE TABLE professor_modalidade(
id_pm int not null primary key auto_increment,
id_prof int not null,
id_modalidade int not null,
FOREIGN KEY (id_prof) REFERENCES professores (id_prof),
FOREIGN KEY (id_modalidade) REFERENCES modalidades (id_modalidade)
);

CREATE TABLE pagamentos(
id_pagamento int not null primary key auto_increment,
id_aluno int not null,
id_plano int not null,
data_pagamento date not null,
forma_pgto varchar(50) not null,
desconto float not null,
status_pgto varchar(20) not null,
FOREIGN KEY (id_aluno) REFERENCES alunos (id_aluno),
FOREIGN KEY (id_plano) REFERENCES planos (id_plano)
);

CREATE TABLE frequencia(
id_frequencia int not null primary key auto_increment,
id_aluno int not null,
id_modalidade int not null,
id_prof int not null,
data_atividade date not null,
horario varchar(20) not null,
dia_semana varchar(20) not null,
FOREIGN KEY (id_aluno) REFERENCES alunos (id_aluno),
FOREIGN KEY (id_modalidade) REFERENCES modalidades (id_modalidade),
FOREIGN KEY (id_prof) REFERENCES professores (id_prof)
);

CREATE TABLE produtos(
id_produto int not null primary key auto_increment,
nome_produto varchar(100) not null,
valor_produto float not null
);

CREATE TABLE vendas_produtos(
id_venda int not null primary key auto_increment,
id_aluno int not null,
id_produto int not null,
data_venda date not null,
quantidade_venda int not null,
forma_pgto_venda varchar(50) not null,
FOREIGN KEY (id_aluno) REFERENCES alunos (id_aluno),
FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
);

CREATE TABLE despesas(
id_despesa int not null primary key auto_increment,
nome_despesa varchar(100) not null,
valor_despesa float not null
);

CREATE TABLE pagamentos_despesas(
id_pd int not null primary key auto_increment,
data_despesa date not null,
id_despesa int not null,
FOREIGN KEY (id_despesa) REFERENCES despesas (id_despesa)
)