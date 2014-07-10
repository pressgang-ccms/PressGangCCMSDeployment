#! /bin/sh

# Execute the JVM in the background
eval "java -cp config:lib/* -Xmx32m -Djppf.config=jppf-node.properties -Dlog4j.configuration=log4j-node.properties -Djava.util.logging.config.file=config/logging-node.properties org.jppf.node.NodeLauncher &"
NODE_PID=$!
# Trap common signals and relay them to the node process
trap "kill -HUP  $NODE_PID" HUP
trap "kill -TERM $NODE_PID" INT
trap "kill -QUIT $NODE_PID" QUIT
trap "kill -PIPE $NODE_PID" PIPE
trap "kill -TERM $NODE_PID" TERM
if [ "x$NODE_PIDFILE" != "x" ]; then
    echo $NODE_PID > $NODE_PIDFILE
fi

# Wait for a complete shudown
wait $NODE_PID 2>/dev/null

if [ "x$NODE_PIDFILE" != "x" ]; then
    grep "$NODE_PID" $NODE_PIDFILE && rm $NODE_PIDFILE
fi

#java -cp config:lib/* -Xmx32m -Djppf.config=jppf-node.properties -Dlog4j.configuration=log4j-node.properties -Djava.util.logging.config.file=config/logging-node.properties org.jppf.node.NodeLauncher
