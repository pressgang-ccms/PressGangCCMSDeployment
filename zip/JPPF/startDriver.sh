#! /bin/sh

# Execute the JVM in the background
eval "java -cp config:lib/* -Xmx32m -Djppf.config=jppf-driver.properties -Dlog4j.configuration=log4j-driver.properties -Djava.util.logging.config.file=config/logging-driver.properties org.jppf.server.DriverLauncher &"
DRIVER_PID=$!
# Trap common signals and relay them to the driver process
trap "kill -HUP  $DRIVER_PID" HUP
trap "kill -TERM $DRIVER_PID" INT
trap "kill -QUIT $DRIVER_PID" QUIT
trap "kill -PIPE $DRIVER_PID" PIPE
trap "kill -TERM $DRIVER_PID" TERM
if [ "x$DRIVER_PIDFILE" != "x" ]; then
    echo $DRIVER_PID > $DRIVER_PIDFILE
fi

# Wait for a complete shudown
wait $DRIVER_PID 2>/dev/null

if [ "x$DRIVER_PIDFILE" != "x" ]; then
    grep "$DRIVER_PID" $DRIVER_PIDFILE && rm $DRIVER_PIDFILE
fi

#java -cp config:lib/* -Xmx32m -Djppf.config=jppf-driver.properties -Dlog4j.configuration=log4j-driver.properties -Djava.util.logging.config.file=config/logging-driver.properties org.jppf.server.DriverLauncher
