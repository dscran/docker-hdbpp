#!/bin/bash

# Script to start a containerized tango device server.
# To function, the server needs to have and publish a fixed ORBEndPoint
#
# These are read from environment variables, to allow for easy configuration
# when deploying the container.
#
# Variables used: (Note: "tango_server" refers to the device server, NOT the TANGO_HOST!)
#
#   - TANGO_SERVER_INSTANCE: Instance name to start
#   - TANGO_SERVER_PORT: The fixed ORBEndPoint port. The container needs to publish this port.
#   - TANGO_SERVER_HOSTNAME: hostname of the docker HOST machine.

DSERVER=$1

if [[ -z $TANGO_SERVER_INSTANCE ]]; then
    echo "TANGO_SERVER_INSTANCE not defined!"
    exit 2
fi

if [[ -z $TANGO_SERVER_PORT ]]; then
    echo "TANGO_SERVER_PORT not defined!"
    exit 2
fi

if [[ -z $TANGO_SERVER_PUBLISH ]]; then
    echo "TANGO_SERVER_PUBLISH not defined!"
    exit 2
fi

$DSERVER $TANGO_SERVER_INSTANCE -ORBendPoint giop:tcp::$TANGO_SERVER_PORT -ORBendPointPublish giop:tcp:$TANGO_SERVER_HOSTNAME:$TANGO_SERVER_PORT

