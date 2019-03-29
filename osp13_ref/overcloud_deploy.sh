#!/bin/bash

openstack overcloud deploy --templates \
    --timeout 90 \
    -r ~/osp13_ref/roles_data.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/services-docker/neutron-ovs-dpdk.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/host-config-and-reboot.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/ovs-dpdk-permissions.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/neutron-sriov.yaml \
    -e ~/osp13_ref/network-environment.yaml \
    -e ~/osp13_ref/docker_registry.yaml \
    -e ~/osp13_ref/api-policies.yaml \
    -e ~/osp13_ref/nic-mapping-env.yaml
