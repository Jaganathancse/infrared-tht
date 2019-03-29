#!/bin/bash

openstack overcloud container image prepare   \
    -r ~/osp13_ref/roles_data.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/services-docker/neutron-ovs-dpdk.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/host-config-and-reboot.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/ovs-dpdk-permissions.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/neutron-sriov.yaml \
    -e ~/osp13_ref/network-environment.yaml \
    -e ~/osp13_ref/docker_registry.yaml \
    -e ~/osp13_ref/api-policies.yaml \
    -e ~/osp13_ref//nic-mapping-env.yaml \
    -e ~/osp13_ref/ovs-dpdk-permissions.yaml \
    --namespace docker-registry.engineering.redhat.com/rhosp13  \
    --prefix "openstack-" \
    --tag 2019-02-28.1 \
    --env-file docker_registry.yaml
