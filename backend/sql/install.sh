#! /bin/bash

function err {
  echo 'ERROR: '$1;
  exit 1;
}

[ -e ../config.sh ] && . ../config.sh || err 'config.sh not found';

# Install schemas
FILES="schema.sql procedures.sql"

echo 'Installing SQL from files:'
for i in $FILES; do 
    echo " - $i";
done
(echo 'BEGIN TRANSACTION; ' && cat $FILES && echo 'COMMIT; ' ) |  PGPASSWORD=$DBPASS PGOPTIONS="--client-min-messages=warning" psql -v ON_ERROR_STOP=1 -q -h localhost -U $DBUSER $DBNAME
