#!/bin/sh -e

NGROK_AUTH=$NGROK_AUTH_TOKEN

set -x

# exec $(ngrok authtoken ${NGROK_AUTH})
/bin/ngrok authtoken -config $HOME/ngrok.yml ${NGROK_AUTH}

echo ">>>>>>>>>>> AFTER CONFIGURATION BEING RUN <<<<<<<<<<<"

/bin/ngrok http -config $HOME/ngrok.yml nginx:80

echo ">>>>>>>>>>> AFTER SERVER BEING RUN <<<<<<<<<<<"
