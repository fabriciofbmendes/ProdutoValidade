Hibernate: 
    
    create table Estoque (
       id bigint not null auto_increment,
        Data_Validade DATE,
        qualidade varchar(255),
        quantidade integer not null,
        nota_id bigint,
        produto_id bigint,
        primary key (id)
    ) engine=InnoDB
Hibernate: 
    
    create table NotaFiscal (
       id bigint not null auto_increment,
        Data_Emissao DATE,
        nome varchar(10),
        primary key (id)
    ) engine=InnoDB
Hibernate: 
    
    create table Produto (
       id bigint not null auto_increment,
        descricao varchar(200),
        marca varchar(50),
        nome varchar(50),
        valor double precision,
        primary key (id)
    ) engine=InnoDB
Hibernate: 
    
    create table Promocao (
       id bigint not null auto_increment,
        Data_Inicio_Promocao DATE,
        Data_Termino_Promocao DATE,
        porcentagem double precision,
        estoque_id bigint,
        primary key (id)
    ) engine=InnoDB
Hibernate: 
    
    create table Relatorio (
       tipo_relatorio varchar(31) not null,
        id bigint not null auto_increment,
        Data_Emissao DATE,
        Quantidade_Produtos integer,
        valorDesconto double precision,
        valorPrejuizo double precision,
        primary key (id)
    ) engine=InnoDB
Hibernate: 
    
    create table Relatorio_Estoque (
       Relatorio_id bigint not null,
        estoques_id bigint not null
    ) engine=InnoDB
Hibernate: 
    
    alter table NotaFiscal 
       drop index UK_on9p34xx33ccnlr5m4byrkbjb
Hibernate: 
    
    alter table NotaFiscal 
       add constraint UK_on9p34xx33ccnlr5m4byrkbjb unique (nome)
Hibernate: 
    
    alter table Estoque 
       add constraint FKknphcixurf9c7c1ywfnq9ldcx 
       foreign key (nota_id) 
       references NotaFiscal (id)
Hibernate: 
    
    alter table Estoque 
       add constraint FK3nr46aiqk0m258ojetdsasx8r 
       foreign key (produto_id) 
       references Produto (id)
Hibernate: 
    
    alter table Promocao 
       add constraint FK7qtywcnhauxropuy3fbv1hugi 
       foreign key (estoque_id) 
       references Estoque (id)
Hibernate: 
    
    alter table Relatorio_Estoque 
       add constraint FK3ng4hgha4bluvedvy34kwb971 
       foreign key (estoques_id) 
       references Estoque (id)
Hibernate: 
    
    alter table Relatorio_Estoque 
       add constraint FKqo398x41qkkou4wup5rtswfgj 
       foreign key (Relatorio_id) 
       references Relatorio (id)