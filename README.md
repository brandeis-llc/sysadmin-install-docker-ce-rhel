### Installing docker-ce on RHEL

As the department of computer science at Brandeis uses RHEL on internal workstations, this repository provides scripts for installing `docker-ce` on RHEL machines. 

* **NOTE** This script is for RHEL 7++. Docker dropped support for CentOS 6 family at some point in 2015. Run `cat /etc/*release` to check linux version. 
* **NOTE** Starting from 17.06, `docker-ce` does not install on RHEL, as redhat and docker team started making money by forcing `docker-ee` via the RHEL yum repository. 

