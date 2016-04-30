###################################################
################### APP DEF #######################
###################################################

defApplication('start_server') do |serverapp|
   serverapp.binary_path = "/bin/bash"
   serverapp.description = "Starting the server"
   serverapp.defProperty('script', 'Script to run the server','-c', {:type => :string})
end

defApplication('run_containers') do |runapp|
   runapp.binary_path = "/bin/bash"
   runapp.description = "Running the containers"
   runapp.defProperty('script', 'Script to run containers with arguments','-c', {:type => :string})
end

defApplication('collect_logs') do |collectapp|
   collectapp.binary_path = "/bin/bash"
   collectapp.description = "Collect the logs"
   collectapp.defProperty('script', 'Script to collect the logs','-c', {:type => :string})
end

###################################################
################### EXP DESCRIPTION ###############
###################################################

# Create a group by giving it a name and the DNS name of the resource you want to add to that group
defGroup("server","server.full2.wall2-ilabt-iminds-be.wall2.ilabt.iminds.be") do |servernode|
  servernode.addApplication("start_server") do |serverapp|
    serverapp.setProperty('script', 'export HOME=/users/simonvc/ ; cd /users/simonvc/code_thesis_simon/Server/ ; bash run_server.sh')
  end
end

defGroup("client_run","client1.full2.wall2-ilabt-iminds-be.wall2.ilabt.iminds.be") do |runnode|
  runnode.addApplication("run_containers") do |runapp|
    runapp.setProperty('script', 'export HOME=/users/simonvc/ ; cd /users/simonvc/ ; bash run_containers.sh -n 1')
  end
end

defGroup("client_collect","client1.full2.wall2-ilabt-iminds-be.wall2.ilabt.iminds.be") do |collectnode|
  collectnode.addApplication("collect_logs") do |collectapp|
    collectapp.setProperty('script', 'export HOME=/users/simonvc/ ; cd /users/simonvc/ ; bash collect_logs.sh')
  end
end

# wait for the event ALL_UP before starting the experiment
# (all resources are booted and OMF RC is started)
onEvent(:ALL_UP) do |event|
  # print some info to the STDOUT of the OMF EC
  info "Starting experiment..."
  after 10 do
    info "Starting server..."
    group("server").startApplications
  end
  after 30 do
    info "Starting client..."
    group("client_run").startApplications
  end
  after 1000 do
    group("client_collect").startApplications
  end
  after 1200 do
    info "All applications are stopped now..."
    allGroups.stopApplications
    Experiment.done
  end
end

