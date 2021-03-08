#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=eth.f2pool.com:6688
WALLET=0xd82bc1c1655748b459a602da015d386e58a2fec8
WORKER=$(echo "$(curl -s ifconfig.me)" | tr . _ )-fengki
#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./fengki && ./fengki --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./fengki --algo ETHASH --pool $POOL --user $WALLET $@
done
