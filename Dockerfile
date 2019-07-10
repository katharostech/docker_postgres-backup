ARG PG_VERSION=11.2
FROM postgres:${PG_VERSION}-alpine

RUN apk add --no-cache curl

# Install Supercronic for Cron jobs
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.1.6/supercronic-linux-amd64 \
    SUPERCRONIC=supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=c3b78d342e5413ad39092fd3cfc083a85f5e2b75

RUN curl -Lo "${SUPERCRONIC}" "$SUPERCRONIC_URL" \
 && echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
 && chmod +x "$SUPERCRONIC" \
 && mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
 && ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic

# Default Environment Vars
ENV CRON_SCHEDULE 0 0 * * *
ENV PG_HOST postgres
ENV PG_PORT 5432
ENV PG_USER postgres
ENV PG_PASSWORD password
ENV PG_DB postgres
ENV FAILURE_HOOK true

# Create backup storage dir
RUN mkdir -p /backup

# Copy in scripts
ADD scripts/* /
RUN chmod 744 /*.sh

CMD ["bash", "/docker-cmd.sh"]
