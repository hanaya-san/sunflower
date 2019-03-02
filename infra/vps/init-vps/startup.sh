#!/bin/sh

echo "======================================"
echo "start vps init"
echo "\$1（作成ユーザ）: $1"
echo "\$2（作成パスワード）: $2"
echo ""

yum update
yum install -y ansible

rm -r /tmp/init-vps
cd /tmp/
mkdir init-vps

# git init
# git config core.sparsecheckout true
# git remote add origin リポジトリのURL # TODO: 追記する
# echo 目的のフォルダ > .git/info/sparse-checkout # TODO: 追記する
# git pull origin master
# cd /tmp/ansible-init/

echo 'ansible-playbook init.yml --extra-vars "user_name=$1"'
ansible-playbook init.yml --extra-vars "user_name=$1 password=$2"


echo "======================================"
echo "vps init complete."
echo "Please DL SSH key !!"
echo ""
ls -l /home/$1/.ssh
echo ""

rm -r /tmp/init-vps
export HISTSIZE=0
rm .bash_history



