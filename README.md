# Introdution
   use ansible to deploy PXE Server with kickstart
# Usage

    $ ansible-playbook -i hosts pxe.yml

# Config
    $ cat group_vars/all
    ---
    # repo for centos7.2
    install_url: http://mirrors.aliyun.com/centos/7.2.1511/os/x86_64/
    # install dhcp、tftp server and copy vmlinuz to target server
    pxe_server: 192.168.1.1
