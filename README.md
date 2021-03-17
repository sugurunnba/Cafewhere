# CafeWhere
サイトURL : https://t.cafewhere.work/
![t cafewhere work_](https://user-images.githubusercontent.com/72184121/111452862-48029c80-8756-11eb-9c87-22d84ddc08a7.jpg)


## サイト概要
大阪府/京都府内にあるカフェを簡単に検索することのできるサイトです。


## 使用技術
・MySQL<br>
・nginx,puma<br>
・HTML,Javascript<br>
・Ruby 2.6.3, Rails 5.2.4.5<br>
・RSpec（テストフレームワーク)<br>
・Docker,Docker-compose（本番環境）<br>
・AWS/本番環境（EC2, RDS, VPC, EIP, Route53)<br>


## 機能一覧
・Dockerにて環境構築<br>
・認証機能(devise)<br>
・管理者権限(admin)<br>
・refileにて複数画像枚を登録/表示<br>
・ブックマーク機能<br>
・地名/ジャンル/店名でカフェ検索(ransack不使用)<br>
・星5段階評価(raty)<br>
・評価を平均化してランキング表示<br>
・管理者のメールアドレスへお問い合わせ<br>
・GoogleMapAPIにて地図を表示<br>
・APIキーやメールアドレスを環境変数化<br>
・Rspec(単体テスト)<br>
・HTTPS化<br>
・ゲストアカウント<br>
・ゲストログイン機能<br>


## 設計書
ER図
![ER_page-0001](https://user-images.githubusercontent.com/72184121/106295339-a7364b80-6293-11eb-8c27-45495951c462.jpg)<br>
アプリケーション詳細設計書
![_ 1_page-0001](https://user-images.githubusercontent.com/72184121/106295398-b9b08500-6293-11eb-881d-85d02ce46f1a.jpg)
![_ 1_page-0002](https://user-images.githubusercontent.com/72184121/106295415-bf0dcf80-6293-11eb-88b5-b3bba1073e4e.jpg)


### テーマを選んだ理由
自分がカフェ探しをする時にインスタ・Googleマップ・Web検索など色んなアプリを経由して検索しているのですが、アプリを切り替えて検索していることが手間に感じています。
そこで、検索する手間を減らすため今までやっていたことを一つのアプリで検索できるようにしたいと思い、このアプリを作成いたしました。


### ターゲットユーザ
検索利用者→近場のカフェを探したい人
カフェリクエストする人→自分のお気に入りカフェを広めたい人


### 主な利用シーン
これからどこのカフェに行こうか迷った時<br>
大阪府にどんなカフェがあるかを知りたいと思った時<br>
自分のおすすめカフェを広めたい時


## 使用素材
https://www.pinterest.jp/pin/377809856227469254/
