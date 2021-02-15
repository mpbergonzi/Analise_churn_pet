# Análise de chunr - Petlove


## Ferramentas

Talend open studio (ETL)

Mysql (Base de dados) 

Tableau (Visualização dos dados) 


## Regras aplicadas 

## Classificação período ativo cliente 

CASE WHEN  DATEDIFF(dt_exclusao, dt_criacao) <= 30 THEN 'MENOS DE 1 MÊS'
WHEN DATEDIFF(dt_exclusao, dt_criacao) > 30 AND DATEDIFF(dt_exclusao, dt_criacao) <= 180 THEN 'ENTRE 1 e 6 MESES'
WHEN DATEDIFF(dt_exclusao, dt_criacao) > 180 AND DATEDIFF(dt_exclusao, dt_criacao) <= 360 THEN 'ENTRE 6 MESES E 1 ANO'
WHEN DATEDIFF (dt_exclusao, dt_criacao) > 360 THEN 'MAIS DE 1 ANO'
END Periodo

Essa regra me dá a diferença de dias entre a data que o cliente cancelou a assinatura com a data de criação. 

Menos ou 30 dias, é um cliente com menos de 1 mês 
com um período entre 30 e 180 é um cliente que ficou entre 1 e 6 meses 
Com um período entre 180 e 360 é um cliente que ficou entre 6 meses e 1 ano
e período maior que 360 são clientes com mais de 1 ano de assinatura. 

## Classificação das reigões 

IF [Nm Estado] = 'AC' THEN 'REGIÃO NORTE'
ELSEIF [Nm Estado] = 'AM' THEN 'REGIÃO NORTE'
ELSEIF [Nm Estado] = 'RR' THEN 'REGIÃO NORTE'
ELSEIF [Nm Estado] = 'RO' THEN 'REGIÃO NORTE'
ELSEIF [Nm Estado] = 'PA' THEN 'REGIÃO NORTE'
ELSEIF [Nm Estado] = 'AP' THEN 'REGIÃO NORTE'
ELSEIF [Nm Estado] = 'TO' THEN 'REGIÃO NORTE'
ELSEIF [Nm Estado] = 'MT' THEN 'REGIÃO CENTRO-OESTE'
ELSEIF [Nm Estado] = 'MS' THEN 'REGIÃO CENTRO-OESTE'
ELSEIF [Nm Estado] = 'GO' THEN 'REGIÃO CENTRO-OESTE'
ELSEIF [Nm Estado] = 'DF' THEN 'REGIÃO CENTRO-OESTE'
ELSEIF [Nm Estado] = 'MA' THEN 'REGIÃO NORDESTE'
ELSEIF [Nm Estado] = 'PI' THEN 'REGIÃO NORDESTE'
ELSEIF [Nm Estado] = 'BA' THEN 'REGIÃO NORDESTE'
ELSEIF [Nm Estado] = 'CE' THEN 'REGIÃO NORDESTE'
ELSEIF [Nm Estado] = 'RN' THEN 'REGIÃO NORDESTE'
ELSEIF [Nm Estado] = 'PB' THEN 'REGIÃO NORDESTE'
ELSEIF [Nm Estado] = 'PE' THEN 'REGIÃO NORDESTE'
ELSEIF [Nm Estado] = 'AL' THEN 'REGIÃO NORDESTE'
ELSEIF [Nm Estado] = 'SE' THEN 'REGIÃO NORDESTE'
ELSEIF [Nm Estado] = 'MG' THEN 'REGIÃO SUDESTE'
ELSEIF [Nm Estado] = 'ES' THEN 'REGIÃO SUDESTE'
ELSEIF [Nm Estado] = 'RJ' THEN 'REGIÃO SUDESTE'
ELSEIF [Nm Estado] = 'SP' THEN 'REGIÃO SUDESTE'
ELSEIF [Nm Estado] = 'PR' THEN 'REGIÃO SUL'
ELSEIF [Nm Estado] = 'SC' THEN 'REGIÃO SUL'
ELSEIF [Nm Estado] = 'RS' THEN 'REGIÃO SUL' 
END

Essa regra associada a sigla do estado a uma região brasileira. Cálculo realizado diretamente no Tableau. 

## Churn  

SUM([Total_Excluidos]) / RUNNING_SUM(SUM([Total_ativos]))

Calculei o Churn com o total de saídas do mês / total da base ativa

a base ativa que vem crescendo de 2015 até 2020

exemplo: 
Dezembro 2019 eu tinha 7647 clientes 
em Janeiro 2020 entraram 152 novos clientes

minha base ativa passou a ser 7.799 

em janeiro de 2020 tive 22 saídas de assinantes

meu churn é 

22 / 7799 * 100 = 0,28 %

## Final delivery

