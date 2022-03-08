#!/bin/bash

# Script to start a containerized tango device server.
# To function, the server needs to have and publish a fixed ORBEndPoint
#
# These are read from environment variables, to allow for easy configuration
# when deploying the container.
#
# Variables used: (Note: "tango_server" refers to the device server, NOT the TANGO_HOST!)
#
#   - INSTANCE_NAME: Instance name to start
#   - OMNIORB_PORT: The fixed ORBEndPoint port. The container needs to publish this port.
#   - OMNIORB_PUBLISH: hostname of the docker HOST machine.

DSERVER=$1

if [[ -z $INSTANCE_NAME ]]; then
    echo "INSTANCE_NAME not defined!"
    exit 2
fi

if [[ -z $OMNIORB_PORT ]]; then
    echo "TANGO_SERVER_PORT not defined!"
    exit 2
fi

if [[ -z $OMNIORB_PUBLISH ]]; then
    echo "OMNIORB_PUBLISH not defined!"
    exit 2
fi

echo $TANGO_HOST > /etc/tangorc

$DSERVER $INSTANCE_NAME -ORBendPoint giop:tcp::$OMNIORB_PORT -ORBendPointPublish giop:tcp:$OMNIORB_PUBLISH:$OMNIORB_PORT

