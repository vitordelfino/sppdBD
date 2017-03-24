use sppd;

insert into linha
(nome,ativa)
values
('LINHA DIAMENTE',1);

insert into estacao
(linha,nome)
values
(1,'ITAPEVI');

insert into estacao
(linha,nome)
values
(1,'CARAPICUIBA');

insert into estacao
(linha,nome)
values
(1,'BARUERI');

insert into estacao
(linha,nome)
values
(1,'OSASCO');

insert into estacao
(linha,nome)
values
(1,'CARAPICUIBA');

insert into categoria
(nomeCategoria)
values
('NORMAL');

insert into categoria
(nomeCategoria)
values
('ESTUDANTE');

insert into categoria
(nomeCategoria)
values
('IDOSO');

insert into categoria
(nomeCategoria)
values
('PASSE-LIVRE');

insert into cartao
(categoria,codPassageiro)
values
(1,1);

insert into cartao
(categoria,codPassageiro)
values
(2,1);

insert into cartao
(categoria,codPassageiro)
values
(3,1);

insert into cartao
(categoria,codPassageiro)
values
(4,1);

select * from passageiro;
select * from login;
select * from categoria
select * from cartao;

update cartao c 
set c.ativo = 1 where c.codCartao = 100005;

commit;

delete from categoria where codCategoria > 4;

delete from cartao;

delete from passageiro where codPassageiro > 1;


delete from historicoSaldoCartao;
select * from historicoSaldoCartao h where h.codCartao = 100001 order by h.dataTransacao desc;
select * from cartao;

insert into historicoViagem h
(h.codPassageiro, h.codCartao, h.origem, h.saldoAtual)
values
(?,?,?,(select c.saldo from cartao where c.codCartao = ?))

	
insert into historicoViagem
(codPassageiro, codCartao, origem, saldoAtual)	
select 1,100001,1, saldo from cartao where codCartao = 100001


select * from Viagem
rollback

insert into historicoViagem(codPassageiro, codCartao, origem, saldoAtual)select 1,100001,1, saldo from cartao where codCartao = 100001




