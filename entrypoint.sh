#!/bin/sh

set -e

rm -f /home/app/tmp/pids/server.pd
exec "$@"
