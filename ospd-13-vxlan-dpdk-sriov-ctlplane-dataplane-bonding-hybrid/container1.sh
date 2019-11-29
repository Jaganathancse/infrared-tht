openstack overcloud container image prepare \
 -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-ansible.yaml \
 --namespace docker-registry.engineering.redhat.com/rhosp13 \
 --env-file=/home/stack/ospd-13-vxlan-dpdk-sriov-ctlplane-dataplane-bonding-hybrid/docker-images.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/neutron-ovs-dpdk.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-sriov.yaml \
 --prefix=openstack- \
 --tag=2019-10-23.1 \
 --set ceph_namespace=brew-pulp-docker01.web.prod.ext.phx2.redhat.com:8888 \
 --set ceph_image=rhceph --set ceph_tag=3-31
