CREATE TABLE empresa (
  id bigint NOT NULL,
  cnpj character varying(255),
  data_atualizacao timestamp without time zone,
  data_criacao timestamp without time zone,
  razao_social varchar(255) NOT NULL,
  CONSTRAINT empresa_pkey PRIMARY KEY (id)
) ;

CREATE TABLE funcionario (
  id bigint NOT NULL,
  cpf character varying(255),
  data_atualizacao timestamp without time zone,
  data_criacao timestamp without time zone,
  email character varying(255),
  nome character varying(255),
  perfil character varying(255),
  qtd_horas_almoco float DEFAULT NULL,
  qtd_horas_trabalho_dia float DEFAULT NULL,
  senha character varying(255),
  valor_hora decimal(19,2) DEFAULT NULL,
  empresa_id bigint NOT NULL,

   CONSTRAINT func_pkey PRIMARY KEY (id),
   CONSTRAINT empres_func_id_fkey FOREIGN KEY (empresa_id)
      REFERENCES empresa (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
) ;

CREATE TABLE lancamento (
  id bigint NOT NULL,
  data timestamp without time zone,
  data_atualizacao timestamp without time zone,
  data_criacao timestamp without time zone,
  descricao varchar(255) DEFAULT NULL,
  localizacao varchar(255) DEFAULT NULL,
  tipo character varying(255),
  funcionario_id bigint NOT NULL,
   CONSTRAINT lan_pkey PRIMARY KEY (id),
   CONSTRAINT func_lanct_id_fkey FOREIGN KEY (funcionario_id)
      REFERENCES funcionario (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
) ;



CREATE SEQUENCE empresa_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE empresa_id_seq
  OWNER TO postgres;


CREATE SEQUENCE funcionario_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE funcionario_id_seq
  OWNER TO postgres;


CREATE SEQUENCE lancamento_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE lancamento_id_seq
  OWNER TO postgres;