create table Linha_BRT (
    ID_Linha_BRT int not null, 
    Nome_Linha_BRT varchar(20), 
    Cor_Linha_BRT varchar(10),
    primary key (ID_Linha_BRT)
);

create table Linha_Metro (
    ID_Linha_Metro int not null, 
    Nome_Linha_Metro varchar(20), 
    Cor_Linha_Metro varchar(10),
    primary key (ID_Linha_Metro)
);

create table Linha_VLT (
    ID_Linha_VLT int not null, 
    Nome_Linha_VLT varchar(20), 
    Cor_Linha_VLT varchar(10),
    primary key (ID_Linha_VLT)
);

create table Bairro (
    ID_Bairro int not null,
    Nome_Bairro varchar(30),
    primary key (ID_Bairro)
);

create table Estacao_BRT (
    ID_Est_BRT int not null, 
    Nome_Est_BRT varchar(50), 
    Flag_BRT_Ativo char(3), 
    BRT_Integra_Trem char(3), 
    BRT_Integra_Metro char(3), 
    BRT_Integra_Aeroporto char(3), 
    ID_Bairro int,
    primary key (ID_Est_BRT),
    foreign key (ID_Bairro) references Bairro(ID_Bairro)
);

create table Estacao_Metro (
    ID_Est_Metro int not null, 
    Nome_Est_Metro varchar(30),
    Flag_Metro_Ativo char(3), 
    Flag_Metro_Superficie char(3), 
    Metro_Integra_Trem char(3), 
    Metro_Integra_BRT char(3), 
    Metro_Integra_Onibus char(3), 
    Metro_Integra_VLT char(3), 
    ID_Bairro int,
    primary key (ID_Est_Metro),
    foreign key (ID_Bairro) references Bairro(ID_Bairro)
);

create table Estacao_VLT (
    ID_Est_VLT int not null, 
    Nome_Est_VLT varchar(30), 
    Flag_VLT_Ativo char(3), 
    VLT_Integra_Metro char(3), 
    VLT_Integra_Barca char(3), 
    VLT_Integra_Onibus char(3), 
    VLT_Integra_Trem char(3), 
    VLT_Integra_Aeroporto char(3), 
    VLT_Integra_Teleferico char(3), 
    ID_Bairro int,
    primary key (ID_Est_VLT),
    foreign key (ID_Bairro) references Bairro(ID_Bairro)
);

create table Estacao_Linha_BRT (
    ID_Est_BRT int not null, 
    ID_Linha_BRT int not null, 
    primary key (ID_Est_BRT, ID_Linha_BRT),
    foreign key (ID_Est_BRT) references Estacao_BRT(ID_Est_BRT),
    foreign key (ID_Linha_BRT) references Linha_BRT(ID_Linha_BRT)
);

create table Estacao_Linha_Metro (
    ID_Est_Metro int not null, 
    ID_Linha_Metro int not null, 
    Flag_Metro_Terminal char(3),
    primary key (ID_Est_Metro, ID_Linha_Metro),
    foreign key (ID_Est_Metro) references Estacao_Metro(ID_Est_Metro),
    foreign key (ID_Linha_Metro) references Linha_Metro(ID_Linha_Metro)
);

create table Estacao_Linha_VLT (
    ID_Est_VLT int not null, 
    ID_Linha_VLT int not null, 
    primary key (ID_Est_VLT, ID_Linha_VLT),
    foreign key (ID_Est_VLT) references Estacao_VLT(ID_Est_VLT),
    foreign key (ID_Linha_VLT) references Linha_VLT(ID_Linha_VLT)
);

create table Saidas_Metro (
    ID_Est_Metro int not null, 
    Nome_Saida varchar(40),
    primary key (ID_Est_Metro, Nome_Saida),
    foreign key (ID_Est_Metro) references Estacao_Metro(ID_Est_Metro)
);