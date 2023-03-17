create database clinica;

use clinica;

create table estado(
id_estado int primary key auto_increment,
nome_estado varchar(255),
sigla_estado varchar(2)
);

create table especialidade(
id_especialidade int primary key auto_increment,
nome_especialidade varchar(255)
);

create table usuario (
id_usuario int primary key auto_increment,
nome_usuario varchar(255),
email varchar(255),
senha varchar(255),
foto_usuario longblob
);

create table medico(
id_medico int primary key auto_increment,
nome_medico varchar(255),
cpf varchar(55),
data_nascimento date,
foto_medico longblob,
telefone varchar(55),
numero_crm int,
id_especialidade int,
id_estado_crm int,
id_clinica int,
CONSTRAINT fk_especialidadeMedico FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade)
);

create table cidade(
id_cidade int primary key auto_increment,
nome_cidade varchar(255),
id_estado int,
CONSTRAINT fk_estadoCidade FOREIGN KEY (id_estado) REFERENCES estado(id_estado)
);

create table agendamento(
id_agendamento int primary key auto_increment,
id_usuario int,
id_medico int,
data_agendamento date,
hora_inicio varchar(5),
hora_fim varchar(5),
descricao text,
CONSTRAINT fk_medicoAgendamento FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
CONSTRAINT fk_usuarioAgendamento FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

create table endereco_clinica(
id_endereco int primary key auto_increment,
rua varchar(255),
bairro varchar(55),
numero int,
complemento varchar(55),
cep varchar(55),
id_cidade int,
CONSTRAINT fk_cidadeClinica FOREIGN KEY (id_cidade) REFERENCES cidade(id_cidade)
);

create table clinica(
id_clinica int primary key auto_increment,
razao_social varchar(255),
cnpj varchar(55),
email varchar(255),
telefone varchar(55),
atendente_sus boolean,
valor_consulta double,
id_endereco int,
cep int,
CONSTRAINT fk_enderecoClinica FOREIGN KEY (id_endereco) REFERENCES endereco_clinica(id_endereco)
);

create table clinica_medico(
id_clinica_medico int primary key auto_increment,
id_clinica int,
id_medico int,
CONSTRAINT fk_medicoClinicaMedico FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
CONSTRAINT fk_clinicaClinicaMedico FOREIGN KEY (id_clinica) REFERENCES clinica(id_clinica)
);

INSERT INTO `clinica`.`estado` (`nome_estado`, `sigla_estado`) VALUES ('CEARA', 'CE');
INSERT INTO `clinica`.`estado` (`nome_estado`, `sigla_estado`) VALUES ('SÃO PAULO', 'SP');
INSERT INTO `clinica`.`estado` (`nome_estado`, `sigla_estado`) VALUES ('RIO DE JANEIRO', 'RJ');


INSERT INTO `clinica`.`cidade` (`nome_cidade`, `id_estado`) VALUES ('Caninde', '1');
INSERT INTO `clinica`.`cidade` (`nome_cidade`, `id_estado`) VALUES ('São Paulo', '2');
INSERT INTO `clinica`.`cidade` (`nome_cidade`, `id_estado`) VALUES ('Rio de Janeiro', '3');


INSERT INTO `clinica`.`endereco_clinica` (`numero`, `complemento`) VALUES ('565', 'vizinho a caixa');
INSERT INTO `clinica`.`endereco_clinica` (`numero`, `complemento`) VALUES ('64', 'proximo a enel');

INSERT INTO `clinica`.`clinica` (`razao_social`, `cnpj`, `email`, `telefone`, `valor_consulta`, `id_endereco`) VALUES ('teste', '6216465165', 'teste@teste.com.br\'', '859884401121', '200', '1');
INSERT INTO `clinica`.`clinica` (`razao_social`, `cnpj`, `email`, `telefone`, `valor_consulta`, `id_endereco`) VALUES ('outra clinica', '516565166516', 'outra@teste.com', '8597754112', '300', '2');


INSERT INTO `clinica`.`especialidade` (`nome_especialidade`) VALUES ('cabeça');
INSERT INTO `clinica`.`especialidade` (`nome_especialidade`) VALUES ('pulmão');

INSERT INTO `clinica`.`medico` (`nome_medico`, `cpf`, `data_nascimento`, `foto_medico`, `telefone`, `numero_crm`, `id_especialidade`, `id_estado_crm`, `id_clinica`) VALUES ('Outro Medico', '15165165165', '1971-03-12', 'img/url/teste.jpg', '8594410324', '65416546', '1', '1', '2');
INSERT INTO `clinica`.`medico` (`nome_medico`, `cpf`, `data_nascimento`, `foto_medico`, `telefone`, `numero_crm`, `id_especialidade`, `id_estado_crm`, `id_clinica`) VALUES ('Outro Medico', '15165165165', '1971-03-12', 'img/url/teste.jpg', '8594410324', '65416546', '2', '1', '3');

INSERT INTO `clinica`.`clinica_medico` (`id_clinica`, `id_medico`) VALUES ('1', '2');
INSERT INTO `clinica`.`clinica_medico` (`id_clinica`, `id_medico`) VALUES ('2', '1');

INSERT INTO `clinica`.`usuario` (`nome_usuario`, `email`, `senha`, `foto_usuario`) VALUES ('User teste', 'eron@teste.com.br', 'uhcvsivi', 'img/url.jpg');
INSERT INTO `clinica`.`usuario` (`nome_usuario`, `email`, `senha`, `foto_usuario`) VALUES ('outro user teste', 'teste@gmail.com', 'csdbvi', 'img/url3.jpg');


INSERT INTO `clinica`.`agendamento` (`id_usuario`, `id_medico`, `data_agendamento`, `hora_inicio`, `hora_fim`, `descricao`) VALUES ('1', '2', '2023-03-12', '10:20', '11:30', 'teste');



SELECT * FROM agendamento;
SELECT * FROM medico;

SELECT * FROM medico INNER JOIN clinica_medico on clinica_medico.id_medico = medico.id_medico INNER JOIN clinica on clinica_medico.id_clinica = clinica.id_clinica;
