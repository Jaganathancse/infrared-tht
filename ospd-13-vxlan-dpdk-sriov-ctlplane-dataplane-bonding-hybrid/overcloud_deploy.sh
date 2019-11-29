#!/bin/bash

THT_PATH='/home/stack/ospd-13-vxlan-dpdk-sriov-ctlplane-dataplane-bonding-hybrid'

if [[ ! -f "$THT_PATH/roles_data.yaml" ]]; then
  openstack overcloud roles generate -o $THT_PATH/roles_data.yaml Controller ComputeHCIOvsDpdk
fi

time openstack overcloud deploy \
--timeout 240 \
--templates \
-r $THT_PATH/roles_data.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-ansible.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/network-environment.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/host-config-and-reboot.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/neutron-ovs-dpdk.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-sriov.yaml \
-e $THT_PATH/docker-images.yaml \
-e $THT_PATH/api-policies.yaml \
-e $THT_PATH/os-net-config-mappings.yaml \
-e $THT_PATH/network-environment-overrides.yaml \
-n $THT_PATH/network-data.yaml \
-e $THT_PATH/ceph.yaml
# \
#--log-file overcloud_install.log &> overcloud_install.log
