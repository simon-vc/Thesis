###################################################
################### APP DEF #######################
###################################################

defApplication('server') do |server|
   server.binary_path = '/bin/bash'
   server.description = 'Starting the server'
   server.defProperty('script', 'Script to run the server','-c', {:type => :string})
end

defApplication('run') do |run|
   run.binary_path = '/bin/bash'
   run.description = 'Running the containers'
   run.defProperty('script', 'Script to run containers with arguments','', {:type => :string})
   run.defProperty('amount', 'Amount of containers', '-n', {:type => :integer})
end

###################################################
################### EXP DESCRIPTION ###############
###################################################

# Create a group by giving it a name and the DNS name of the resource you want to add to that group
defGroup('servergroup','server.full2.wall2-ilabt-iminds-be.wall2.ilabt.iminds.be') do |servernode|
  servernode.addApplication('server') do |server|
    server.setProperty('script', 'export HOME=/users/simonvc/ ; cd /users/simonvc/code_thesis_simon/Server/ ; bash run_server.sh')
  end
end

defGroup('clientgroup','client1.full2.wall2-ilabt-iminds-be.wall2.ilabt.iminds.be') do |clientnode|
  clientnode.addApplication('run') do |run|
    run.setProperty('script', '/users/simonvc/run_containers.sh')
    run.setProperty('amount', 1)
  end
end

# wait for the event ALL_UP before starting the experiment
# (all resources are booted and OMF RC is started)
onEvent(:ALL_UP) do |event|
  # print some info to the STDOUT of the OMF EC
  info "Starting experiment..."
  after 10 do
    info "Starting server..."
    group('servergroup').startApplications
  end
  after 40 do
    info "Starting client..."
    group('clientgroup').startApplications
  end
  after 220 do
    info "All applications are stopped now..."
    allGroups.stopApplications
    Experiment.done
  end
end
