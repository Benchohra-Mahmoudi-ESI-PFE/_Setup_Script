#!/usr/bin/env bash

# - This script takes one argument, the desired path of the project. 
#   If the path doesn't exist, it will be created with the full hierarchy 


# Checking project path
if [ $# -eq 0 ]; then
    echo " " && echo "     No project path detected!"
    echo "     Please specify project path in arguments" && echo " "
    exit 1
fi
if [ $# -gt 1 ]; then
    echo " " && echo "     Multiple arguments detected!"
    echo "     Please specify only the project path" && echo " "
    exit 1
fi

export project_path="$1"
echo "Installation environment in : " + $project_path
mkdir -p $project_path
cd $project_path

# Checking internet connection
echo "Checking internet connection ..."
nc -z 8.8.8.8 53  >/dev/null 2>&1
online=$?
if [ $online -ne 0 ]; then
    echo " " && echo "     No internet connection!" && echo " "
    exit 1
fi

# Checking Python version
ver=$(python3 -V 2>&1 | sed 's/.* \([0-9]\).\([0-9]\).*/\1\2/')
if [ "$ver" -lt "36" ]; then
    echo " " && echo "     This script requires python 3.6 or greater" && echo " "
    exit 1
fi

# Installing system packages
echo "Installing system packages ..."
sudo apt install -qq sox 
sudo apt install -qq libgomp1 
sudo apt install -qq libstdc++6
sudo apt install -qq libpthread-stubs0-dev

# Installing Miniconda 3
echo "Installing Miniconda 3 ..."
wget --no-check-certificate "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86.sh"
bash Miniconda3-latest-Linux-x86.sh
echo "Installed, " && conda --version
rm "Miniconda3-latest-Linux-x86.sh"
conda deactivate
conda deactivate

# Cloning GitHub repositories
git clone  https://github.com/Benchohra-Mahmoudi-ESI-PFE/receiver_app.git
git clone  https://github.com/Benchohra-Mahmoudi-ESI-PFE/face_recognition.git
git clone  https://github.com/Benchohra-Mahmoudi-ESI-PFE/speaker_recognition.git
mv receiver_app/config ../

# Creating miniconda environements 
cd face_recognition
conda env create -f environment_pytorch_main.yml
conda deactivate
conda env create -f environment_vgg_py3.yml
conda deactivate
conda env create -f environment_voice_py3.yml
conda deactivate
cd ../

# Installing virtualenv python module
python3 -m pip install virtualenv

# Creating and activating the virtual environment
cd receiver_app
virtualenv flask_app

# Activate the virtual environment
source flask_app/bin/activate

# Install packages
pip install -r requirements.txt

# Deactivate the virtual environment
deactivate

# Downloadables (for offline speech-to-text and word corrector)
echo "Downloading speech-to-text models ..."
wget https://github.com/mozilla/DeepSpeech/releases/download/v0.8.2/deepspeech-0.8.2-models.pbmm
mv deepspeech-0.8.2-models.pbmm deepspeech_model.pbmm
wget https://github.com/mozilla/DeepSpeech/releases/download/v0.8.2/deepspeech-0.8.2-models.scorer
mv deepspeech-0.8.2-models.scorer deepspeech_model.scorer
cd ../


