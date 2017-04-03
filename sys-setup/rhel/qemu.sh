sudo yum install gcc gcc-c++ autoconf automake
#
cd /tmp/
#
git clone git://git.qemu-project.org/qemu.git
#
cd qemu/
#
git submodule init
#
mkdir -p ~/local
#
sudo yum install gtk2-devel
#
git clone https://github.com/mgazz/scripts
#
sudo  yum groupinstall "Development Tools"
#
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/q/qemu-system-arm-2.0.0-1.el7.6.x86_64.rpm
#
sudo yum install SDL*
#
sudo yum install vte3-devel
#
sudo yum install bluez-libs-devel
#
wget ftp://ftp.pbone.net/mirror/rnd.rajven.net/centos/7.0.1406/extras/x86_64/qemu-common-2.4.1-5cnt7.x86_64.rpm
#
#
sudo rpm -Uvh qemu-common-2.0.0-1.el7.6.x86_64.rpm 
#
sudo rpm -Uvh qemu-system-arm-2.0.0-1.el7.6.x86_64.rpm 
#
mkdir images
#
cd images/
#
wget https://downloads.raspberrypi.org/raspbian_lite_latest
#
mv raspbian_lite_latest raspbian_lite_latest.zip
#
unzip raspbian_lite_latest.zip 
#
#mount image, comment mm.. in /etc/fstab, comment etc/ld.so.preload
file 2017-03-02-raspbian-jessie-lite.img | awk -F "," '{print $3}' | awk '{print $2}'
# OFFSET = startselector second partition
OFFSET="$(($(file 2017-03-02-raspbian-jessie-lite.img | awk -F ";" '{print $3}' | awk -F "," '{print $3}' | awk '{print $2}') * 512))"
#
sudo mount 2017-03-02-raspbian-jessie-lite.img -o offset=$OFFSET /mnt
#
sudo vim ld.so.conf
#
sudo umount /mnt/
#
wget https://raw.github.com/dhruvvyas90/qemu-rpi-kernel/master/kernel-qemu-4.4.34-jessie
#
git clone https://github.com/dhruvvyas90/qemu-rpi-kernel
#
qemu-system-arm -kernel qemu-rpi-kernel/kernel-qemu-4.4.26-jessie -cpu arm1176 -m 256 -M versatilepb -no-reboot -serial stdio  -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw init=/bin/bash" -hda 2017-03-02-raspbian-jessie-lite.img
#
sudo mount 2017-03-02-raspbian-jessie-lite.img -o offset=$OFFSET /mnt
#
cd /mnt/
#
sudo vim etc/ld.so.preload
#
sudo umount /mnt/
#
qemu-system-arm -kernel qemu-rpi-kernel/kernel-qemu-4.4.26-jessie -cpu arm1176 -m 256 -M versatilepb -no-reboot -serial stdio  -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw init=/bin/bash" -hda 2017-03-02-raspbian-jessie-lite.img

