# CafeWhere
サイトURL : https://t.cafewhere.work/
![t cafewhere](https://user-images.githubusercontent.com/72184121/106092822-70b4df80-6172-11eb-85c7-9721433c18a8.png)



## サイト概要
大阪府/京都府内にあるカフェを簡単に検索することのできるサイトです。


### サイトテーマ
最寄りのカフェを探したい人の手助けをいたします。


### テーマを選んだ理由
自分がカフェ探しをする時にインスタ・Googleマップ・Web検索など色んなアプリを経由して検索しているのですが、アプリを切り替えて検索していることが手間に感じています。
そこで、検索する手間を減らすため今までやっていたことを一つのアプリで検索できるようにしたいと思い、このサイトを制作いたしました。


### ターゲットユーザ
検索利用者→近場のカフェを探したい人
カフェリクエストする人→自分のお気に入りカフェを広めたい人


### 主な利用シーン
これからどこのカフェに行こうか迷った時<br>
大阪府にどんなカフェがあるかを知りたいと思った時<br>
自分のおすすめカフェを広めたい時


## 機能一覧
・認証機能(devise)
・管理者権限(admin)
・refileにて複数画像枚を登録/表示
・ブックマーク機能
・地名/ジャンル/店名でカフェ検索(ransack不使用)
・星5段階評価(raty)
・評価を平均化してランキング表示
・管理者のメールアドレスへお問い合わせ
・GoogleMapAPIにて地図を表示
・APIキーやメールアドレスを環境変数化
・Rspec(単体テスト)
・HTTPS化


## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9


## 設計書
ER図　
![ER_page-0001](https://user-images.githubusercontent.com/72184121/106093911-81665500-6174-11eb-8d9d-ab615a40cd46.jpg)<br>
アプリケーション詳細設計書　
![_ 1_page-0001](https://user-images.githubusercontent.com/72184121/106093967-95aa5200-6174-11eb-8762-9ca8800efcd5.jpg)
![_ 1_page-0002](https://user-images.githubusercontent.com/72184121/106093982-9a6f0600-6174-11eb-8358-af20d428a64c.jpg)
