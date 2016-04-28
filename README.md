# Thesis

##collect_logs.sh
Script to collect the logs from the Docker cotainers on a client node

##config.yml
OMF configuration script

##copy_files.sh
Personal script to copy the code to the right place

##create_containers.sh
Script to create containers on the client node. -n amount of containers, -i for image name

##install_omf_ec.sh
Script for the controller. Installs ruby and omf_ec, gets the omf-script

##install_omf_rc.sh
Script for all resources. Installs ruby and omf_rc with the right configurations.

##install_server.sh
Unzip code and installs server

#prep_client.sh
Installs Docker and gets the needed scripts

##run_containers.sh
Runs containers. -n amount of containers, -s sleeptime between run. Containers have to be created with create_containers.

##vforce.rb
OMF script to run an experiment
