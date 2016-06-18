echo "Installing switch"

if [ $# -ne 2 ]
  then
    echo "Use $0 interfaceToServer interfaceToClients"
    exit
fi

bash ./switch/install_bridge_utils.sh
bash ./switch/bridge_setup.sh $1 $2
bash ./switch/bandwidth.sh $2