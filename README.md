# Moodle IOMAD via Docker

Guia simples para subir uma instância local do Moodle usando Docker e Docker Compose.

## Pré-requisitos

- [Docker](https://docs.docker.com/get-docker/) instalado
- [Docker Compose](https://docs.docker.com/compose/install/) instalado (já vem incluso no Docker Desktop)

Obs: Todo esse processo foi executado com o Docker version 29.6.1 e Docker Compose version v5.2.0

## 1. Criar o arquivo `config.php`

Dentro da pasta do moodle, criar o arquivo `config.php` com o seguinte conteúdo:

```<?php  // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'mysqli';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'db';
$CFG->dbname    = 'moodle_iomad_db';
$CFG->dbuser    = 'moodle_iomad_user';
$CFG->dbpass    = 'moodle_iomad_password';
$CFG->prefix    = 'mdl_';
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => 3306,
  'dbsocket' => '',
);

$CFG->wwwroot   = 'http://localhost:8081/moodle';
$CFG->dataroot  = '/var/www/moodledata';
$CFG->admin     = 'admin';

$CFG->directorypermissions = 0777;

require_once(__DIR__ . '/lib/setup.php');

$CFG->disablelogintoken = true;

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!
```

As informações de acesso ao banco estão de acordo com o que foi declarado no `docker-compose.yml`

## 2. Criar a pasta `moodledata`

Criar a pasta `moodledata` na raiz do projeto `docker_moodle_iomad`

## 3. Construir a imagem do contêiner do Docker

Na pasta onde está o `docker-compose.yml`, rode:

```bash
docker compose build
```

Isso vai baixar as imagens dos contêineres.

## 4. Subir os containers

Para subir os conteines, execute o seguinte comando:

```bash
docker compose up -d
```

## 5. Acessar o Moodle

Depois que os containers estiverem de pé, acesse o endereço abaixo para iniciar a instalação do Moodle. Não esqueça de realizar o passo 1.

```
http://localhost:8081/moodle
```
## 5. Acessar o phpMyAdmin

http://localhost:8082/

**Informações de acesso:**

- Usuário: root
- Senha: rootpassword

- Usuário comum: moodle_iomad_user
- Senha: moodle_iomad_password

A instalação do docker criou a base de dados: `moodle_iomad_db`

## Removendo tudo (ambiente limpo)

```bash
docker compose down -v
```
