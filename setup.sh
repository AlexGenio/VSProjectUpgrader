#! /bin/bash

echo
echo "*******************************************"
echo "*     SETTING UP VSPROJECTUPDATOR ENV     *"
echo "*******************************************"
echo

virtualDir="./venv"

### Check if the directory does not already exist ###
if [ ! -d "$virtualDir" ] 
then

	### Create a virtual environment and install requirements ###
    mkdir $virtualDir
    virtualenv -p python3 $virtualDir
    source $virtualDir/bin/activate
    pip3 install -r requirements.txts

    ### Process the returned code from the last executed command ###
    ret=$?
    if [ $ret -ne 0 ]
    then
        echo
        echo "ERROR: Unable to set up the environment due to enountered errors."
        echo

        ### remove the virtual directory which failed to be set up correctly ###
        deactivate
        rm -rf $virtualDir
    else
        echo
        echo "INFO: Successfully set up the environment."
        echo
    fi

else
    echo "INFO: Directory $virtualDir already exists."
    echo "INFO: Activating virtual environment."
    echo

    source $virtualDir/bin/activate
fi


