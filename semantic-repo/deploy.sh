#!/usr/bin/env bash

function escape_path {
  PATH=$1
  ESCAPED_PATH="$(echo $PATH | /bin/sed -e 's/[\/&]/\\&/g')"
  echo $ESCAPED_PATH
}

FUSEKI_SRC_FOLDER="/project/semantic-repo"
TEMP_FOLDER="$FUSEKI_SRC_FOLDER/tmp"

FUSEKI_PACKAGE_FILE="jena-fuseki-1.0.2-distribution.tar.gz"
FUSEKI_PACKAGE_SRC="http://ftp.unicamp.br/pub/apache/jena/binaries"
FUSEKI_PACKAGE_LOCAL="$TEMP_FOLDER/$FUSEKI_PACKAGE_FILE"

APP_INSTALL_FOLDER="$HOME/od4d"
FUSEKI_DEST_FOLDER="$APP_INSTALL_FOLDER/fuseki"
TDB_DATA_FOLDER="$APP_INSTALL_FOLDER/data"

#download fuseki if needed
echo "Downloading fuseki..."
if [ ! -f $FUSEKI_PACKAGE_LOCAL ]; then
  wget "$FUSEKI_PACKAGE_SRC/$FUSEKI_PACKAGE_FILE" -P $TEMP_FOLDER
else
  echo "Using already downloaded package."
fi
if [ "$(md5sum $FUSEKI_PACKAGE_LOCAL | cut -d ' ' -f 1)" != "43b39c972967903242a8c2acb45e0438" ]; then
  echo "Fuseki package is invalid - failed MD5 verification."
  exit 1
fi
echo "Fuseki downloaded with success."
echo ""

#stop fuseki
$FUSEKI_SRC_FOLDER/stop-fuseki.sh
echo ""

#remove existing installation
if [ -e $FUSEKI_DEST_FOLDER ]; then
  rm -rf $FUSEKI_DEST_FOLDER
fi

#copy fuseki to installation folder
echo "Copying fuseki files..."
pushd $TEMP_FOLDER > /dev/null
tar zxf jena-fuseki-1.0.2-distribution.tar.gz
mkdir -p $APP_INSTALL_FOLDER
mv jena-fuseki-1.0.2 $FUSEKI_DEST_FOLDER
popd > /dev/null
echo "Copy done."
echo ""

#set execute permission for commands
echo "Setting execute permission for commands..."
pushd $FUSEKI_DEST_FOLDER > /dev/null
chmod +x fuseki-server s-*
popd > /dev/null
echo "Permissions set."
echo ""

#create tdb data folder
if [ ! -e $TDB_DATA_FOLDER ]; then
  mkdir -p $TDB_DATA_FOLDER
fi

#create configuration file
echo "Creating configuration file..."
ESCAPED_TDB_DATA_FOLDER="$(escape_path $TDB_DATA_FOLDER)"
/bin/sed -e "s/{TDB_DATA_FOLDER}/$ESCAPED_TDB_DATA_FOLDER/g" fuseki-config-template.ttl > "$FUSEKI_DEST_FOLDER/fuseki-config.ttl"
echo "Configuration file created."
echo ""

#start fuseki
$FUSEKI_SRC_FOLDER/start-fuseki.sh
