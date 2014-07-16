#!/bin/bash

HEAP_SPACE=2048
ZANATA_SERVER=http://localhost:8080/zanata/
REST_SERVER=http://localhost:8080/pressgang-ccms/rest
USERNAME=
TOKEN=
PROJECT=skynet-topics
PROJECT_VERSION=1
MAINCLASS=org.jboss.pressgang.ccms.services.zanatasync.Main
DEFAULT_LOCALE=en-US
MIN_ZANATA_CALL_INTERVAL=0.2

# Get the directory hosting the script. This is important if the script is called from
# another working directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${DIR}

java -Xmx${HEAP_SPACE}m -Dpressgang.zanataServer=${ZANATA_SERVER} \
-Dpressgang.zanataUsername=${USERNAME} \
-Dpressgang.zanataToken=${TOKEN} \
-Dpressgang.zanataProject=${PROJECT} \
-Dpressgang.zanataProjectVersion=${PROJECT_VERSION} \
-Dpressgang.restServer=${REST_SERVER} \
-Dpressgang.defaultLocale=${DEFAULT_LOCALE} \
-Dpressgang.minZanataCallInterval=${MIN_ZANATA_CALL_INTERVAL} \
-Dpressgang.rest.cache.timeout=30 \
-cp lib/* ${MAINCLASS} @command.txt