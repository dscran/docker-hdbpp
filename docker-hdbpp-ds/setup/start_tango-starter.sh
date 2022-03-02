#!/bin/bash

if [[ -z $TANGO_PORT ]]; then
    TANGO_PORT=10000
fi

wait-for-it --host=$TANGO_HOST --port=$TANGO_PORT --timeout=30

# check for database connection
tango_admin --ping-database 5 || exit 2

# register the tango-starter if necessary
tango_admin --check-device tango/admin/`hostname` || tango_admin --add-server Starter/`hostname` Starter tango/admin/`hostname` || exit 2

/usr/lib/tango/Starter `hostname` -ORBendPoint giop:tcp::$TANGO_SERVER_PORT -ORBendPointPublish giop:tcp:$TANGO_SERVER_PUBLISH

