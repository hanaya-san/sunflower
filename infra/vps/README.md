# VPS環境構築ツール

## 使い方

1. 作業マシンからVPSサーバーにインストール資材を配置

```bash
cd sunflower/infra/vps
sudo scp -rp ./init-vps root@<IP-ADDRESSS>:~/
```

- 初期化前はrootユーザを使用する


1. VPSにログイン後、インストールシェルの実行

```bash
ssh root@<IP-ADDRESSS>
chmod 755 ~/init-vps/startup.sh
bash ~/init-vps/startup.sh {username} {password}
```

## 参考

- 以下からソースを拝借しsunflower用に微修正しました。ありがとうございます(´；ω；｀)
    - [git clone https://github\.com/haruto167/ansible\-init\.git](https://qiita.com/haruto167/items/481bc520473e061d0725)
        - [【さくらのVPS】サーバの初期設定ガイド](https://help.sakura.ad.jp/hc/ja/articles/206208181--%E3%81%95%E3%81%8F%E3%82%89%E3%81%AEVPS-%E3%82%B5%E3%83%BC%E3%83%90%E3%81%AE%E5%88%9D%E6%9C%9F%E8%A8%AD%E5%AE%9A%E3%82%AC%E3%82%A4%E3%83%89)
            - Step２の２～４ + sudoersの設定まで実施してくれるイメージ
    - [haruto167/ansible\-init](https://github.com/haruto167/ansible-init)



