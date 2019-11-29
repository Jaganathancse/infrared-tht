#!/bin/bash

for node in $(cat nodes);
do 
    echo "Cleaning $node"
    openstack baremetal node manage $node;
    openstack baremetal node clean $node --clean-steps '[{"interface": "deploy", "step": "erase_devices_metadata"}]';
    # wait for node to finish cleaning
    while [[ $(openstack baremetal node show $node -c provision_state -f value) != "manageable" ]]; do 
	sleep 5
	echo -n "."
    done
    echo ". setting $node to available"
    openstack baremetal node provide $node;
    sleep 5;
done

