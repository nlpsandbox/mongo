FROM mongo:4.4.3

SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]

# Alter default docker-entrypoint.sh to add non-admin db user
COPY add-db-user /tmp/
RUN sed '/export MONGO_INITDB_DATABASE/ r /tmp/add-db-user' \
    /usr/local/bin/docker-entrypoint.sh -i