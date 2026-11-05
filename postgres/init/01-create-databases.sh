#!/bin/bash
set -e

psql \
    --username "$POSTGRES_USER" \
    --dbname "$POSTGRES_DB" \
    --set=auth_user="$AUTH_USER" \
    --set=document_user="$DOCUMENT_USER" \
    --set=link_user="$LINK_USER" \
    --set=auth_password="$AUTH_PASSWORD" \
    --set=document_password="$DOCUMENT_PASSWORD" \
    --set=link_password="$LINK_PASSWORD" \
    --set=ON_ERROR_STOP=1 <<'SQL'

CREATE USER auth_user WITH PASSWORD :'auth_password';
CREATE USER document_user WITH PASSWORD :'document_password';
CREATE USER link_user WITH PASSWORD :'link_password';

CREATE DATABASE dockloud_auth OWNER :'auth_user';
CREATE DATABASE dockloud_document OWNER :'document_user';
CREATE DATABASE dockloud_link OWNER :'link_user';

SQL