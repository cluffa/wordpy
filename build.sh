#!/bin/bash
# need wine with python 3.8 + path installed

if ! command -v wine &> /dev/null; then
    sudo apt install wine
    read -p "remember to checkmark 'add path', enter to continue" asdf
    wget https://www.python.org/ftp/python/3.8.8/python-3.8.8.exe
    wine python-3.8.8.exe
    rm python-3.8.8.exe  
    rm python-3.8.8.exe.1
fi

if [ -n "$1" ]; then
  ver=$1
else
  read -p "What version? " ver
fi

wine pip install -r requirements.txt
wine pyinstaller --onefile --add-data "C:\users\\$USER\Local Settings\Application Data\Programs\Python\Python38-32\Lib\site-packages\pyfiglet;./pyfiglet" word.py
mv dist/word.exe "dist/wordpy_v$ver.exe"
