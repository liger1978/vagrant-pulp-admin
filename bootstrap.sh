#!/bin/bash

[ -f /etc/yum.repos.d/epel.repo ] || {
  echo Installing EPEL...
  yum -y install epel-release > /dev/null 2>&1
}

[ -f /etc/yum.repos.d/rhel-pulp.repo ] || {
  echo Installing Pulp repo...
  wget https://repos.fedorapeople.org/repos/pulp/pulp/rhel-pulp.repo -P /etc/yum.repos.d/ -q
}

which pulp-admin >/dev/null 2>&1 || {
  echo Installing pulp-admin...
  yum -y groupinstall pulp-admin > /dev/null 2>&1
}
