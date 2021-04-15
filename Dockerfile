FROM debian:bullseye

LABEL "MAINTAINER" "DiouxX github@diouxx.be"
#Ne pas poser de question à l'installation
ENV DEBIAN_FRONTEND=noninteractive \
    CRON_EVERYMINUTES=2 \
    PHP_VERSION=7.4

#Installation d'apache et de php${PHP_VERSION} avec extension
RUN apt update \
    && apt install --yes --no-install-recommends \
    apache2 \
    curl \
    php${PHP_VERSION} \
    php${PHP_VERSION}-cli \
    php${PHP_VERSION}-mysql \
    php${PHP_VERSION}-ldap \
    php${PHP_VERSION}-imap \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-common \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-gd \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-xmlrpc \
    php${PHP_VERSION}-apcu-bc \
    php${PHP_VERSION}-intl \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-bz2 \
    php${PHP_VERSION}-opcache \
    php${PHP_VERSION}-readline \
    php-cas \
    php-imap \
    php-ssh2 \
    cron \
    wget \
    ca-certificates \
    jq \
    && rm -rf /var/lib/apt/lists/*

#Copie et execution du script pour l'installation et l'initialisation de GLPI
COPY glpi-start.sh /opt/
RUN chmod +x /opt/glpi-start.sh
ENTRYPOINT ["/opt/glpi-start.sh"]

#Exposition des ports
EXPOSE 80
