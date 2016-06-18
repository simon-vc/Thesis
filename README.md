# Framework for a large scale test environment on the Virtual Wall

Clone the entire repository to the desired installation folder.

Run the server, client, switch and controller installation scripts on the server, client, switch and controller node.

Before installing:
- Edit omf/config.yml to point the OMF Resource Controller to the used message server. Doing this after installation will require a restart of the Resource Controller.

##Server
Before installing the server, the zip-file with the server code should be provided in the directory next to the server installation script.
The script installs the Jetty Web server, Ruby and the OMF Resource Controller.

##Client
The client installation scrip installs Docker, sysstat, Ruby and the OMF Resource Controller. In the client directory are the following files provided:
- client configuration file
- script to create containers
- script to start the containers
- script to gather the log information

##Switch
The switch installation script install bridg-utils and the OMF Resource Controller. It also adds the tc class for limiting the bandwidth. The script 'change_bandwidth' can be used to change the bandwidth.

##Controller
The controller installation script installs rabbitmq, Ruby and the OMF Experiment Controller.

##Running an experiment
In the omf directory, the following files are included:
- vforce.rb is the main experiment description to execute an experiment. This file needs to be changed in order to work in a setup.
- collect.rb is used to gather the log files after an experiment has ended.
- Providing working experiment description, an experiment can be started with the script 'run_ec.sh'
- 'iterate.sh' can be used to execute multiple iterations.
