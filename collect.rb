###################################################
################### APP DEF #######################
###################################################

defApplication('collect') do |app|
   app.binary_path = '/bin/bash'
   app.description = 'Collect the logs'
   app.defProperty('script', 'Script to collect the logs','-c', {:type => :string})
end

###################################################
################### EXP DESCRIPTION ###############
###################################################

# Create a group by giving it a name and the DNS name of the resource you want to add to that group
defGroup('clients','client1.full2.wall2-ilabt-iminds-be.wall2.ilabt.iminds.be') do |node|
  node.addApplication('collect') do |app|
    app.setProperty('script', 'export HOME=/users/simonvc/ ; cd /users/simonvc/ ; bash collect_logs.sh')
  end
end

# wait for the event ALL_UP before starting the experiment
# (all resources are booted and OMF RC is started)
onEvent(:ALL_UP) do |event|
  # print some info to the STDOUT of the OMF EC
  info "Starting experiment..."
  after 10 do
    info "Collecting logs"
    group('clients').startApplications
  end
  after 120 do
    info "All applications are stopped now..."
    allGroups.stopApplications
    Experiment.done
  end
end
