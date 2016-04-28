###################################################
################### APP DEF #######################
###################################################

defApplication('start_server') do |app|
   app.binary_path = "/bin/bash"
   app.description = "Starting the server"
   app.defProperty('command', 'Script to run the server','', {:type => :string})
end

defApplication('run_containers') do |app|
   app.binary_path = "/bin/bash"
   app.description = "Running the containers"
   app.defProperty('command', 'Script to run containers with arguments','', {:type => :string})
   app.defProperty('amount', 'Amount of containers','-n', {:type => :integer})
end

defApplication('collect_logs') do |app|
   app.binary_path = "/bin/bash"
   app.description = "Collect the logs"
   app.defProperty('command', 'Script to collect the logs','', {:type => :string})
end

###################################################
################### EXP DESCRIPTION ###############
###################################################

# Create a group by giving it a name and the DNS name of the resource you want to add to that group
defGroup("server","server.largeset.wall2-ilabt-iminds-be.wall1.ilabt.iminds.be") do |node|
  node.addApplication("start_server") do |app|
    app.setProperty('command', '/users/simonvc/code_thesis_simon/Server/run_server.sh')
  end
end

defGroup("client_run","client1.largeset.wall2-ilabt-iminds-be.wall1.ilabt.iminds.be") do |node|
  node.addApplication("run_containers") do |app|
    app.setProperty('script', '/users/simonvc/run_containers.sh')
    app.setProperty('amount', '1')
  end
end

defGroup("client_collect","client1.largeset.wall2-ilabt-iminds-be.wall1.ilabt.iminds.be") do |node|
  node.addApplication("collect_logs") do |app|
    app.setProperty('script', '/users/simonvc/collect_logs.sh')
  end
end

# wait for the event ALL_UP before starting the experiment
# (all resources are booted and OMF RC is started)
onEvent(:ALL_UP) do |event|
  # print some info to the STDOUT of the OMF EC
  info "Starting experiment..."
  after 5 do
    info "Starting server..."
    group("server").startApplications
  end
  after 15 do
    info "Starting client..."
    group("client_run").startApplications
  end
  after 900 do
    group("client_collect").startApplications
  end
  after 1000 do
    info "All applications are stopped now..."
    allGroups.stopApplications
    Experiment.done
  end
end

