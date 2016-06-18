echo "Server installation"

echo "Install Jetty Server"
bash ./server/install_jettyserver.sh "code_thesis_simon_v1.zip"

echo "Install Ruby"
bash ./omf/install_ruby.sh

echo "Install OMF RC"
bash ./omf/install_omf_rc.sh
