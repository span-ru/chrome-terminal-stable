#!/bin/bash
import_cert.sh $HOME &

CHROME_ARGS="--disable-gpu --headless --no-sandbox --remote-debugging-address=0.0.0.0 --remote-debugging-port=9222 --user-data-dir=/data"

if [ -n "$CHROME_OPTS" ]; then
  CHROME_ARGS="${CHROME_ARGS} ${CHROME_OPTS}"
fi

exec sh -c "/usr/bin/google-chrome-stable $CHROME_ARGS"
