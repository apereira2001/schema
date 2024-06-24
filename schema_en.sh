#!/bin/bash

COMMAND=$1
DATABASE=$2
SCHEMA=$3
NEW_SCHEMA=$4

usage() {
    echo
    echo "How to use:"
    echo "  $0 <command> <database> [<schema>] [<new schema>]"
    echo 
    echo "Commands:"
    echo "  create <database> <schema>                  Create a new schema into database"
    echo "  drop <database> <schema>                    Drop the schema of the database"
    echo "  dump <database> <schema>                    Dump the schema of the database"
    echo "  list <database>                             List the schemas in the database"
    echo "  rename <database> <schema> <new schema>     Rename the schema of the database"
    echo "  restore <database> <schema>.sql             Restore the schema of the database"
    echo
}

check() {
    if [ $1 -ne $2 ]; then
        usage
        exit 1
    fi
}

# Execute the chosen command
case "$COMMAND" in
    create) 
        check $# 3     
        # Create a new schema into database
        psql -U postgres -d $DATABASE -c "CREATE SCHEMA $SCHEMA;"
        # List the schemas in the database
        psql -U postgres -d $BANCO_DE_DADOS -c "\dn"
        ;;
    drop)
        check $# 3
        # Drop the schema of the database
        psql -U postgres -d $DATABASE -c "DROP SCHEMA IF EXISTS $SCHEMA CASCADE;"
        # List the schemas in the database
        psql -U postgres -d $DATABASE -c "\dn"
        ;;
    dump)
        check $# 3
        # Dump the schema of the database
        pg_dump -U postgres -FT $DATABASE -n $SCHEMA > $SCHEMA.sql
        ;;
    list)
        check $# 2
        # List the schemas in the database
        psql -U postgres -d $DATABASE -c "\dn"
        ;;
    rename)
        check $# 4
        # Rename the schema of the database
        psql -U postgres -d $DATABASE -c "ALTER SCHEMA $SCHEMA RENAME TO $NEW_SCHEMA;"
        # List the schemas in the database
        psql -U postgres -d $DATABASE -c "\dn"
        ;;
    restore)
        check $# 3
        # Restore the schema of the database
        pg_restore -U postgres -Ft -d $DATABASE < $SCHEMA
        # List the schemas in the database
        psql -U postgres -d $DATABASE -c "\dn"
        ;;
    *)
        usage
        exit 1
esac