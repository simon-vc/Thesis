###################################################
################### APP DEF #######################
###################################################

defApplication('start_server') do |app|
   app.binary_path = '/bin/bash'
   app.description = 'Starting the server'
   app.defProperty('script', 'Script to run the server','-c', {:type => :string})
end

defApplication('run_clients') do |app|
   app.binary_path = '/bin/bash'
   app.description = 'Running the containers'
   app.defProperty('script', 'Script to run containers with arguments','', {:type => :string})
   app.defProperty('amount', 'Amount of containers', '-n', {:type => :integer})
end

###################################################
################### EXP DESCRIPTION ###############
###################################################

# Create a group by giving it a name and the DNS name of the resource you want to add to that group
defGroup('servers','server.full2.wall2-ilabt-iminds-be.wall2.ilabt.iminds.be') do |node|
  node.addApplication('start_server') do |app|
    app.setProperty('script', 'export HOME=/users/simonvc/ ; cd /users/simonvc/code_thesis_simon/Server/ ; bash run_server.sh')
  end
end

defGroup('clients','client1.full2.wall2-ilabt-iminds-be.wall2.ilabt.iminds.be') do |node|
  node.addApplication('run_clients') do |app|
    app.setProperty('script', 'export HOME=/users/simonvc/ ; cd /users/simonvc/ ; bash run_containers.sh')
    app.setProperty('amount', 1)
  end
end

# wait for the event ALL_UP before starting the experiment
# (all resources are booted and OMF RC is started)
onEvent(:ALL_UP) do |event|
  # print some info to the STDOUT of the OMF EC
  info "Starting experiment..."
  after 10 do
    info "Starting server..."
    group('servers').startApplications
  end
  after 40 do
    info "Starting client..."
    group('clients').startApplications
  end
  after 220 do
    info "All applications are stopped now..."
    allGroups.stopApplications
    Experiment.done
  end
end
