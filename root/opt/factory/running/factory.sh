#!/bin/bash

export ANSIBLE_FORCE_COLOR=true
ansible-playbook -vv \
                -i /opt/factory/repo/inventories/image-factory/hosts \
                -e "cloud=${CLOUD}" \
                -e "cloud_type=${CLOUD_TYPE}" \
                -e "template=${TEMPLATE}" \
                --vault-password-file /opt/factory/running/vault-env.sh \
                ${ANSIBLE_OPTS} \
                playbooks/${1}
