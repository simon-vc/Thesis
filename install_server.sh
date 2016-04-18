echo "Install Server"

echo "Unzippping"
unzip code_thesis_simon_v1.zip
cd code_thesis_simon/Server/

echo "Installing Server"
bash install_server.sh

echo "Copying content"
cp -r bbb_2/ /var/www/html/live_content/
