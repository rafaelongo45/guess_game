# Jogo de Adivinhação

Este é um simples jogo de adivinhação desenvolvido utilizando o framework Flask. O jogador deve adivinhar uma senha criada aleatoriamente, e o sistema fornecerá feedback sobre o número de letras corretas e suas respectivas posições.

## Pré-requisitos

Para iniciar esse projeto, é necessário ter:

- Docker
- Docker Compose
- Git
  
## Utilizando a aplicação

A primeira etapa para a utilização é realizar o clone do projeto usando o seguinte comando:

```
git clone git@github.com:rafaelongo45/guess_game.git
```
Após essa etapa, precisará navegar para a pasta que foi criada e iniciar o projeto utilizando o seguinte comando:

```
docker compose up
```

Por padrão, a aplicação está configurada para ser iniciada na porta 80 (http://localhost/) do localhost, então <b> é extremamente importante garantir que a porta 80 esteja disponível para a utilização</b>.

Para finalizar a execução do container, rode o seguinte comando:

```
docker compose down
```

## Estrutura

O arquivo docker-compose.yml possui todos os serviços necessários para iniciar a aplicação. Nele, para todos os serviços, foi definida a seguinte configuração:

```
restart: always
```

Ela tem o intuito de aumentar a resiliência da aplicação, fazendo com que um serviço seja reiniciado caso ocorra alguma falha.

Foram criados dois arquivos Dockerfile separados (um para o frontend e outro para o backend) com o intuito de facilitar o processo de atualizações.

#### Banco de dados
A aplicação utiliza o <b> sqlite </b> como banco e, para isso, foi criada uma pasta chamada database, que possui um arquivo database.db que irá persistir os dados recebidos.

#### NGINX
O serviço NGINX foi criado para atuar como o balanceador de carga, fazendo a distribuição das requisições para o frontend e o backend da aplicação.

Foi criada uma pasta chamada nginx, que possui o arquivo de configuração para esse serviço (default.conf).

#### Volume

Devido à configuração de volume no arquivo docker-compose.yml, derrubar o container não fará com que a perda de dados criados durante a utilização da aplicação ocorra, ou seja, mesmo derrubando o container, na próxima execução, os dados sobre os jogos criados serão persistidos.

## Balanceamento de carga
Como informado na seção de estrutura, a aplicação utiliza o NGINX, que irá direcionar a rota home (/) para o frontend e o backend será acessado utilizando a rota /api.

Exemplo de rota para o backend:
- /api/create

## Atualização da aplicação
Para realizar qualquer tipo de atualização na aplicação, seja ela em configurações de balanceamento de carga, backend, frontend, Dockerfile ou docker-compose.yml, primeiro garanta que o container não está em execução rodando o comando:

```
docker compose down
```

Realize as alterações necessárias e suba o container novamente utilizando:


```
docker compose up
```
