#!/bin/bash

ip route add ${UE_IPV4_IMS} via ${UPF_IP}

exec /usr/sbin/opensips -F $@
