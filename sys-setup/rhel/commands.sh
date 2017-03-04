sudo yum install ruby
#
git clone https://github.com/mgazz/scripts
#
cd scripts/
#
cd sys-setup/
#
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
#
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
#
sudo yum install -y openssl-devel readline-devel zlib-devel
#
./.rbenv/bin/rbenv install 2.3.3
#
./.rbenv/bin/rbenv global 2.3.3
#
sudo gem update --system
#
cd /tmp/
#
wget https://releases.hashicorp.com/vagrant/1.9.2/vagrant_1.9.2_x86_64.rpm?_ga=1.62663913.490764421.1488642864
#
mv vagrant_1.9.2_x86_64.rpm\?_ga\=1.62663913.490764421.1488642864 vagrant_1.9.2_x86_64.rpm
#
sudo rpm -Uvh vagrant_1.9.2_x86_64.rpm 
#
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-centos-7
sudo yum install epel-release
#
sudo yum install -y ansible
# trash-cli
git clone https://github.com/andreafrancia/trash-cli.git
#
cd trash-cli/
#
python setup.py install --user
#
VERSION=2016.3.4
#
wget http://download.jetbrains.com/idea/ideaIC-$VERSION.tar.gz
#
tar xvzf ideaIC-2016.3.4.tar.gz
#
cd idea-IC-163.12024.16/
#
mkdir -p ~/sw
#
mv idea-IC-163.12024.16 ~/sw/
#
git clone https://github.com/y3sh/Intellij-Colors-Sublime-Monokai.git
# Intellij -> File -> Import Settings -> Select Jar
# Select Sublime Monokai as the theme in Settings -> Editor -> Colors & Fonts
