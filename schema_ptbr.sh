#!/bin/bash

COMANDO=$1
BANCO_DE_DADOS=$2
ESQUEMA=$3
NOVO_ESQUEMA=$4

usage()
{
    echo
    echo "Como usar:"
    echo "  $0 <comando> <banco de dados> [<schema>] [<novo schema>]"
    echo 
    echo Comandos:
    echo "  list <banco de dados>                               Lista os Schema do banco de dados"
    echo "  dump <banco de dados> <schema>                      Executa dump do Schema do banco de dados"
    echo "  restore <banco de dados> <schema>.sql               Restaura o Schema do banco de dados"
    echo "  rename <banco de dados> <schema> <novo schema>      Altera o nome do Schema do banco de dados"
    echo "  drop <banco de dados> <schema>                      Exclui o Schema do banco de dados"
    echo
}

check()
{
    if [ $1 -ne $2 ]; then
        usage
        exit 1
    fi
}

# Executar o comando escolhido
case "$COMANDO" in
    list)
        check $# 2
        # Listar os esquemas do banco de dados
        psql -U postgres -d $BANCO_DE_DADOS -c "\dn"
        ;;
    dump)
        check $# 3
        # Fazer o dump do schema no banco de dados
        pg_dump -U postgres -FT $BANCO_DE_DADOS -n $ESQUEMA > $ESQUEMA.sql
        ;;
    restore)
        check $# 3
        # Fazer o restore do schema no banco de dados
        pg_restore -U postgres -Ft -d $BANCO_DE_DADOS < $ESQUEMA
        # Listar os esquemas do banco de dados
        psql -U postgres -d $BANCO_DE_DADOS -c "\dn"
        ;;
    rename)
        check $# 4
        # Fazer o restore do schema no banco de dados
        psql -U postgres -d $BANCO_DE_DADOS -c "ALTER SCHEMA $ESQUEMA RENAME TO $NOVO_ESQUEMA;"
        # Listar os esquemas do banco de dados
        psql -U postgres -d $BANCO_DE_DADOS -c "\dn"
        ;;
    drop)
        check  $# 3
        # Fazer o drop do schema no banco de dados
        psql -U postgres -d $BANCO_DE_DADOS -c "DROP SCHEMA IF EXISTS $ESQUEMA CASCADE; "
        # Listar os esquemas do banco de dados
        psql -U postgres -d $BANCO_DE_DADOS -c "\dn"
        ;; 
    *)
        usage
        exit 1
esac

