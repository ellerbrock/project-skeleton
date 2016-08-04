#!/usr/bin/env bash
#
#   /$$$$$$$$                                                /$$$$$$   /$$
#  | $$_____/                                               /$$__  $$ | $$
#  | $$     /$$$$$$  /$$$$$$   /$$$$$$   /$$$$$$$  /$$$$$$ | $$  \__//$$$$$$
#  | $$$$$ /$$__  $$|____  $$ /$$__  $$ /$$_____/ /$$__  $$| $$$$   |_  $$_/
#  | $$__/| $$  \__/ /$$$$$$$| $$  \ $$|  $$$$$$ | $$  \ $$| $$_/     | $$
#  | $$   | $$      /$$__  $$| $$  | $$ \____  $$| $$  | $$| $$       | $$ /$$
#  | $$   | $$     |  $$$$$$$| $$$$$$$/ /$$$$$$$/|  $$$$$$/| $$       |  $$$$/
#  |__/   |__/      \_______/| $$____/ |_______/  \______/ |__/        \___/
#                            | $$
#                            | $$
#                            |__/
#
#   Developer     Maik Ellerbrock
#   GitHub        https://github.com/ellerbrock
#
#   Company       Frapsoft Web Agency
#
#   Twitter       https://twitter.com/frapsoft
#   Facebook      https://facebook.com/frapsoft
#   Github	  https://github.com/frapsoft
#   Homepage      https://frapsoft.com
#
#   Version       1.0.1
#


# Configuration
error=false
haveLicence=true
inFile="./template.md"
outFile="./readme.md"
outLicence="./licence.txt"
tmpDir="./templates"
font="$tmpDir/shell/frapsoft-font.sh"
contactTpl="$tmpDir/markdown/contact.tpl.md"

# output
licenceMsg=""
licenceTpl=""
licenceFile=""

# MIT
licenceTplMIT="$tmpDir/markdown/licence-mit.tpl.md"
licenceFileMIT="$tmpDir/licences/MIT.txt"

# CC BY (4.0)
licenceTplCCBY40="$tmpDir/markdown/licence-ccby40.tpl.md"
licenceFileCCBY40="$tmpDir/licences/CCBY40.txt"

# CC0
licenceTplCC0="$tmpDir/markdown/licence-cc0.tpl.md"
licenceFileCCO="$tmpDir/licences/CC0.txt"

# CC BY-SA (4.0)
licenceTplCCBYSA40="$tmpDir/markdown/licence-ccbysa40.tpl.md"
licenceFileCCBYSA40="$tmpDir/licences/CCBYSA40.txt"

# GPL (v3)
licenceTplGPLv3="$tmpDir/markdown/licence-gplv3.tpl.md"
licenceFileGPLv3="$tmpDir/licences/GPLv3.txt"

clear

source $font

echo "Choose a Licence for the new Project:"
echo "====================================="
echo "[1] MIT Licence"
echo "[2] CC BY (4.0) Licence"
echo "[3] CC0 Licence"
echo "[4] CC BY-SA (4.0) Licence"
echo "[5] GPL (v3) Licence"
echo "[6] NO Licence"
echo ""

read -p "Make your choice: " -n 1 projectType
echo

# MIT Licence
if [[ $projectType == 1 ]]; then
  licenceMsg="MIT licence"
  licenceTpl=$licenceTplMIT
  licenceFile=$licenceFileMIT

# CC BY (4.0) Licence
elif [[ $projectType == 2 ]]; then
  licenceMsg="CC BY (4.0) licence"
  licenceTpl=$licenceTplCCBY40
  licenceFile=$licenceFileCCBY40

# CC0 Licence
elif [[ $projectType == 3 ]]; then
  licenceMsg="CC0 licence"
  licenceTpl=$licenceTplCC0
  licenceFile=$licenceFileCCO

# CC BY-SA (4.0) Licence
elif [[ $projectType == 4 ]]; then
  licenceMsg="CC BY-SA (4.0) licence"
  licenceTpl=$licenceTplCCBYSA40
  licenceFile=$licenceFileCCBYSA40

# GPL (v3) Licence
elif [[ $projectType == 5 ]]; then
  licenceMsg="GPL (v3) licence"
  licenceTpl=$licenceTplGPLv3
  licenceFile=$licenceFileGPLv3

# NO Licence
elif [[ $projectType == 6 ]]; then
  haveLicence=false
  licenceMsg="no licence"

# wrong User Input
else
    error=true
    echo "The choice was 1-6 you typed:" $projectType
    echo "Maybe you should get some sleep before writing some code :)"
fi

if [[ $error == false ]]; then
    echo "creating skeleton with $licenceMsg"

    if [[ $haveLicence == true ]]; then
      cat $inFile $contactTpl $licenceTpl > $outFile
      cp $licenceFile $outLicence
      cp "$tmpDir/dotfiles/.gitignore" .gitignore

    else
      cat $inFile $contactTpl > $outFile
    fi

    echo "happy hacking ..."
fi
