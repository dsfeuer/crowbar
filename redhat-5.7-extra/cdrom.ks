# Kickstart file automatically generated by anaconda.

install
cdrom
key --skip
lang en_US.UTF-8
keyboard us
text
# crowbar
rootpw --iscrypted $1$H6F/NLec$Fps2Ut0zY4MjJtsa1O2yk0
firewall --disabled
authconfig --enableshadow --enablemd5
selinux --disabled
timezone --utc
bootloader --location=mbr --driveorder=sda
zerombr
ignoredisk --drives=sdb,sdc,sdd,sde,sdf,sdg,sdh,sdi,sdj,sdk,sdl,sdm,sdn,sdo,sdp,sdq,sdr,sds,sdt,sdu,sdv,sdw,sdx,sdy,sdz,hdb,hdc,hdd,hde,hdf,hdg,hdh,hdi,hdj,hdk,hdl,hdm,hdn,hdo,hdp,hdq,hdr,hds,hdt,hdu,hdv,hdw,hdx,hdy,hdz
clearpart --all --drives=sda
part /boot --fstype ext3 --size=100 --ondisk=sda
part swap --recommended
part pv.6 --size=0 --grow --ondisk=sda
volgroup lv_admin --pesize=32768 pv.6
logvol / --fstype ext3 --name=lv_root --vgname=lv_admin --size=1 --grow
reboot

%packages
@base
@core
@editors
@text-internet
keyutils
trousers
fipscheck
device-mapper-multipath
OpenIPMI
OpenIPMI-tools
emacs-nox
openssh
createrepo
screen

%post --nochroot
export PS4='${BASH_SOURCE}@${LINENO}(${FUNCNAME[0]}): '
set -x
(
    ls -al /tmp
    mount
    mount /tmp/cdrom /mnt/sysimage/mnt
    mkdir -p /mnt/sysimage/tftpboot/redhat_dvd/dell
    cp -a /mnt/sysimage/mnt/. /mnt/sysimage/tftpboot/redhat_dvd/.
    umount /mnt/sysimage/mnt
) &>/mnt/sysimage/root/post-install-copy.log

%post
export OS_TOKEN="redhat-5.7"
export BASEDIR="/tftpboot/redhat_dvd"
export PS4='${BASH_SOURCE}@${LINENO}(${FUNCNAME[0]}): '
set -x
exec &>/root/post-install.log

. /tftpboot/redhat_dvd/extra/redhat-common-post.sh
