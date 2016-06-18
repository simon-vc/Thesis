echo "Installing Jetty Server"

if [ $# -ne 1 ]
  then
    echo "Use $0 zipfileWithServerCode"
    exit
fi

echo "Unzippping"
unzip $1
cd code_thesis_simon/Server/

echo "Installing"
bash install_server.sh

echo "Copying content"
cp -r bbb_2/ /var/www/html/live_content/
