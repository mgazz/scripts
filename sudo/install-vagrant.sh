wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb
sudo dpkg -i vagrant_1.8.1_x86_64.deb
vagrant box add ubuntu/trusty64 https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box
rm vagrant_1.8.1_x86_64.deb


#mkdir vagrant_project
#cd vagrant_project
#vagrant init ubuntu/trusty64; vagrant up --provider virtualbox
