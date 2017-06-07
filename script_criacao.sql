create table pessoa(

id_pessoa serial not null,
nome_pessoa varchar(20) not null,
sobrenome_pessoa varchar(40) not null,
datanasc_pessoa date not null,
cpf_pessoa varchar(50),
cnpj_pessoa varchar(50),
email_pessoa varchar(40),
constraint pessoa_pkey primary key (id_pessoa)
)

create table usuario(
id_usuario serial not null,
id_pessoa int not null references pessoa(id_pessoa),
login_usuario varchar(20),
senha_usuario varchar(20),
tipo_usuario varchar(2),
foto_usuario varchar(500),
constraint usuario_pkey primary key (id_usuario)
)



create table portfolio(
id_portfolio serial not null,
id_usuario int not null references usuario(id_usuario),
constraint portfolio_pkey primary key (id_portfolio)
)

create table item_portfolio(
id_item_portfolio serial not null,
id_portfolio int not null references portfolio (id_portfolio),
caminho_imagem varchar(200) not null,
descricao_imagem varchar(200),
data_item_portfolio date not null,
constraint item_portfolio_pkey primary key (id_item_portfolio)
)

create table comentario_item_portfolio(
id_item_portfolio serial not null,
id_comentario_item_portfolio int not null,
id_usuario serial not null references usuario (id_usuario),
comentario_item_portfolio varchar(200),
constraint comentario_item_porfolio_pkey primary key (id_comentario_item_portfolio)

)

create table avaliacao_portfolio(
id_item_portfolio serial not null,
id_avaliacao_item_portfolio int not null,
id_usuario serial not null references usuario (id_usuario),
avaliacao integer,
constraint avaliacao_portfolio_pkey primary key(id_avaliacao_item_portfolio)

)

create table usuario_endereco(
id_usuario_endereco serial not null,
id_usuario int not null references usuario (id_usuario),
rua_usuario_endereco varchar(50),
bairro_usuario_endereco varchar(50),
cep_usuario_endereco varchar(20),
id_cidade integer not null references cidade (id_cidade),
constraint usuario_endereco_pkey primary key (id_usuario_endereco)

)

create table cidade(
id_cidade serial not null,
nome_cidade varchar(200),
id_estado integer not null references estado(id_estado),
constraint cidade_pkey primary key (id_cidade)

)

create table estado(
id_estado serial not null,
nome_estado varchar(200),
uf_estado varchar(2),
constraint estado_pkey primary key (id_estado)
)

create table orcamento(
id_orcamento serial not null,
id_usuario_cliente int not null,
id_usuario_tatuador int not null,
descricao_orcamento varchar(200),
valor_orcamento NUMERIC(10, 3),
status_orcamento varchar(1),
constraint orcamento_pkey primary key (id_orcamento) 
)






