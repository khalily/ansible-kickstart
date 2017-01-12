#version=DEVEL
# System authorization information
install
lang en_US.UTF-8
auth --enableshadow --passalgo=sha512
# Use network installation
url --url="{{ install_url }}"
# Use graphical install
graphical
firewall --disabled
# Run the Setup Agent on first boot
firstboot --enable
eula --agreed
ignoredisk --only-use=sda
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=em1 --onboot=off --ipv6=auto
network  --bootproto=dhcp --device=em2 --onboot=off --ipv6=auto
network  --bootproto=dhcp --device=em3 --onboot=off --ipv6=auto
network  --bootproto=dhcp --device=em4 --onboot=off --ipv6=auto
network  --bootproto=dhcp --device=p1p1 --ipv6=auto --activate
network  --bootproto=dhcp --device=p1p2 --onboot=off --ipv6=auto
network  --hostname=localhost.localdomain

selinux --disabled
reboot

# Root password
rootpw --iscrypted $6$yHBTr7CHbjE0vC99$PLr7WpeF7rEX4S5X/HqgW9/9Koqez4qGAGdkfaRZhllNvCXo.BFEut3ooMt0MjPYs0u7wT5gc1XeRAty/1E/j0
# System timezone
timezone Asia/Shanghai --isUtc
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda
zerombr
# Partition clearing information
clearpart --all --initlabel --drives=sda
# Disk partitioning information

part biosboot --fstype=biosboot --ondisk=sda --size=1
part / --fstype="xfs" --ondisk=sda --size=61440
part /usr --fstype="xfs" --ondisk=sda --size=102400
part /var --fstype="xfs" --ondisk=sda --size=40960
part swap --fstype="swap" --ondisk=sda --size=10240
part /data --fstype="xfs" --ondisk=sda --size=1 --grow

services  --disabled NetworkManager --enabled sshd

%packages
@^infrastructure-server-environment
@base
@core
@development
@hardware-monitoring
@performance
kexec-tools

%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end
