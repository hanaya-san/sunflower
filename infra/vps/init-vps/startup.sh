#!/bin/sh

echo "======================================"
echo "start vps init"
echo "\$1（作成ユーザ）: $1"
echo "\$2（作成パスワード）: $2"
echo ""

yum update
yum install -y ansible
yum install epel-release

rm -rf /tmp/init-vps
mkdir /tmp/init-vps
cp -rp ~/init-vps/init.yml /tmp/init-vps/

echo "======================================"
echo 'ansible-playbook init.yml --extra-vars "user_name=$1"'
ansible-playbook /tmp/init-vps/init.yml --extra-vars "user_name=$1 password=$2"

echo "======================================"
echo "vps init complete."
echo "Please DL SSH key !!"
echo ""
ls -l /home/$1/.ssh
echo ""

rm -rf /tmp/init-vps
export HISTSIZE=0
rm .bash_history



