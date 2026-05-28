#!/bin/bash
set -euo pipefail

echo "Initializing Postgres users/databases..."
export PGPASSWORD="${POSTGRES_PASSWORD}"

psql -v ON_ERROR_STOP=1 \
  --username "$POSTGRES_USER" \
  --dbname "$POSTGRES_DB" \
  --set=litellm_user="$POSTGRES_LITELLM_USER" \
  --set=litellm_password="$POSTGRES_LITELLM_PASSWORD" \
  --set=litellm_database="$POSTGRES_LITELLM_DB" \
  --set=pgvector_user="$POSTGRES_PGVECTOR_USER" \
  --set=pgvector_password="$POSTGRES_PGVECTOR_PASSWORD" \
  --set=pgvector_database="$POSTGRES_PGVECTOR_DB" <<'EOSQL'

SELECT format(
  'CREATE ROLE %I LOGIN PASSWORD %L',
  :'litellm_user',
  :'litellm_password'
)
WHERE NOT EXISTS (
  SELECT FROM pg_roles WHERE rolname = :'litellm_user'
)\gexec

SELECT format(
  'CREATE ROLE %I LOGIN PASSWORD %L',
  :'pgvector_user',
  :'pgvector_password'
)
WHERE NOT EXISTS (
  SELECT FROM pg_roles WHERE rolname = :'pgvector_user'
)\gexec

SELECT format(
  'CREATE DATABASE %I OWNER %I',
  :'litellm_database',
  :'litellm_user'
)
WHERE NOT EXISTS (
  SELECT FROM pg_database WHERE datname = :'litellm_database'
)\gexec

SELECT format(
  'CREATE DATABASE %I OWNER %I',
  :'pgvector_database',
  :'pgvector_user'
)
WHERE NOT EXISTS (
  SELECT FROM pg_database WHERE datname = :'pgvector_database'
)\gexec

EOSQL

psql -v ON_ERROR_STOP=1 \
  --username "$POSTGRES_USER" \
  --dbname "$POSTGRES_PGVECTOR_DB" \
  -c "CREATE EXTENSION IF NOT EXISTS vector;"

echo "Postgres init completed."
