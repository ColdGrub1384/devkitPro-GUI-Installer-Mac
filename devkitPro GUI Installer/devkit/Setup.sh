sudo chmod +x /Applications/devkitPro\ GUI\ Installer.app/Contents/Resources/devkit/devkitARMupdate.pl;
cd /Applications/devkitPro\ GUI\ Installer.app/Contents/Resources/devkit/;
sudo /Applications/devkitPro\ GUI\ Installer.app/Contents/Resources/devkit/devkitARMupdate.pl /opt/devkitpro;
sudo chmod 666 /opt/devkitpro/examples/3ds/templates/application
sudo chmod 666 ~/.bashrc
sudo chmod 777 /opt/devkitpro/libctru/
sudo chmod 666 /opt/devkitpro/libctru/default_icon.png

echo "export DEVKITPRO=/opt/devkitpro" >> ~/.bashrc
echo "export DEVKITARM=/opt/devkitpro/devkitARM" >> ~/.bashrc
echo "export PATH=$PATH:/opt/devkitpro/devkitARM/bin" >> ~/.bashrc

# echo "export DEVKITPRO=/opt/devkitpro" >> ~/.bashrc
# echo "export DEVKITARM=/opt/devkitpro/devkitARM" >> ~/.bashrc
# echo "export PATH=$PATH:/opt/devkitpro/devkitARM/bin" >> ~/.bashrc
# source ~/.bashrc

open file:///opt/devkitpro
