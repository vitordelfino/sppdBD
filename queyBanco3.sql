
delimiter //
create trigger adicionaLogin before insert on passageiro
for each row
begin
insert into login(username,password) values (new.cpf, new.cpf);
end //

delimiter //
create trigger deletaLogin before delete on passageiro
for each row
begin
delete from login where username = old.cpf;
end //

delimiter //
create trigger deletaCartao before delete on passageiro
for each row
begin
delete from cartao where codPassageiro = old.codPassageiro;
end //


drop trigger atualizaHistoricoSaldoCartao
delimiter //
create trigger atualizaHistoricoSaldoCartao before update on cartao
for each row
begin	
	declare aux varchar(20);
	if(old.saldo <> new.saldo) then
		if(old.saldo < new.saldo) then
			set aux = 'RECARGA';        
			insert into historicoSaldoCartao
			(codCartao, saldoAnterior, saldoAtual, descricao)
			values
			(old.codCartao, old.saldo, new.saldo, aux);
		else 
			set aux = 'VIAGEM';
            insert into historicoSaldoCartao
			(codCartao, saldoAnterior, saldoAtual, descricao)
			values
			(old.codCartao, old.saldo, new.saldo, aux);
        end if;    
     end if;   
        
end//


drop trigger insereHistoricoSaldoCartao
delimiter //
create trigger insereHistoricoSaldoCartao before insert on cartao
for each row
begin
insert into historicoSaldoCartao
(codCartao, saldoAnterior, saldoAtual)
values
(new.codCartao, new.saldo, new.saldo);
end//