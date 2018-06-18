#!/bin/bash

# Tell Ansible how to decrypt vaults
export ANSIBLE_VAULT_PASSWORD_FILE=/opt/factory/running/vault-env.sh

# Run from the repo root
cd /opt/factory/repo/

# Try NUMLOOPS times
NUMLOOPS=3


for i in $(seq 1 ${NUMLOOPS});
do
        [ $i -gt 1 ] && sleep 15 ; /opt/factory/running/factory.sh main.yml && retcode=0 && break || (
            retcode=$?
            echo "Command failed with error code ${retcode}"
            /opt/factory/running/factory.sh cleanup.yml)
done

# make sure that if all attempts fail, we set a return code not equal to n0.
exit $retcode

