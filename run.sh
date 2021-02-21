gsettings set org.gnome.shell.app-switcher current-workspace-only true
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf clean all
sudo dnf makecache
sudo dnf update -y 
sudo dnf install -y python3-dnf
sudo dnf install -y python3-virtualenv
virtualenv venv --system-site-packages
./venv/bin/python3 -m pip install -r requirements.txt
./venv/bin/ansible-galaxy collection install community.general
./venv/bin/ansible-galaxy collection install ansible.posix
./venv/bin/ansible-playbook main-playbook.yml --ask-become-pass
chsh -s $(which xonsh)
