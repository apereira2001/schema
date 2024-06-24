**English**

# PostgreSQL Schema Management Script

This script is designed to manage PostgreSQL schemas in a database. It allows you to list, dump, restore, rename, and drop schemas.

### Usage

```bash
schema_en.sh <command> <database> [schema] [new schema]
```

### Commands

* `create <database> <schema>`: Create a new schema into database.
* `list <database>`: List the schemas in the specified database.
* `drop <database> <schema>`: Drop the specified schema in the specified database.
* `dump <database> <schema>`: Dump the schema of the specified database to a SQL file.
* `rename <database> <schema> <new schema>`: Rename the specified schema in the specified database.
* `restore <database> <schema>.sql`: Restore the schema of the specified database from a SQL file.

### Example

```bash
schema_en.sh dump mydb my_schema my_schema.sql
```

This command will dump the `my_schema` schema from the `mydb` database to a file named `my_schema.sql`.

**Português Brasil**

# Script de Gerenciamento de Esquemas do PostgreSQL

Este script é projetado para gerenciar esquemas no banco de dados PostgreSQL. 
Ele permite listar, criar backup, restaurar, renomear e excluir esquemas no banco de dados.

### Uso

```bash
schema_ptbr.sh <comando> <banco_de_dados> [esquema] [novo_esquema]
```

### Comandos

* `create <banco_de_dados> <esquema>`: Cria um novo schema no banco de dados.
* `drop <banco_de_dados> <esquema>`: Exclui o esquema especificado do banco de dados especificado.
* `dump <banco_de_dados> <esquema>`: Cria uma backup do esquema do banco de dados especificado para um arquivo SQL.
* `list <banco_de_dados>`: Liste os esquemas do banco de dados especificado.
* `rename <banco_de_dados> <esquema> <novo_esquema>`: Renomeie o esquema especificado no banco de dados especificado.
* `restore <banco_de_dados> <esquema>.sql`: Restaure o esquema do banco de dados especificado a partir de um arquivo SQL.

### Exemplo

```bash
schema_ptbr.sh dump meu_db meu_esquema meu_esquema.sql
```

Este comando cria um backup do esquema `meu_esquema` do banco de dados `meu_db` para um arquivo chamado `meu_esquema.sql`.
