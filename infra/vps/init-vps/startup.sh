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


# TODO:
#   - YUMアップデート関連の処理追加
#   - 基本必要となりうるパッケージのインストール(VIMなど)
#   - ドッカーとの連携(言語周りの自動環境構築)
#   - 各種セキュリティ設定(可能な限り高めておく)
#   - セキュリティが設定されていることの自動テスト


