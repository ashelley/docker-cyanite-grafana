#!/bin/bash

if [ -f /etc/default/cyanite ]; then
    . /etc/default/cyanite
fi

cat /opt/cyanite/schema.cql | cqlsh cass01

CYANITE_VERSION="0.1.3"

JAR="$EXTRA_CLASSPATH:/opt/cyanite/cyanite-${CYANITE_VERSION}-standalone.jar"
CONFIG="/etc/cyanite.yaml"

EXTRA_JAVA_OPTS="-Xmx1024m -Xms1024m"

exec java $EXTRA_JAVA_OPTS $OPTS -cp "$JAR" io.cyanite "$CONFIG"
