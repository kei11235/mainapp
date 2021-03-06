# アプリケーション名 : Bee Your Best

<img src="https://i.gyazo.com/5f307ea4a6b01629e83e72d985a0f1d5.png" width="50%">
<img src="https://i.gyazo.com/36351a13784f092e196a1475f3ed220c.png" width="50%">
<img src="https://i.gyazo.com/5c0958be00780c35b5078f89a1b304c1.png" width="50%">

# アプリケーション概要
人の目標と達成度がわかるWebアプリ。

自分の目標と同じような人がいるのか、また、その人はどれくらい目標に向かって進んでいるのか確認することができ、また応援し合うことができる。人と一緒に努力していくことを想定したアプリケーション。

# URL
	http://bee-your-best.tk

- テスト用アカウント（お好きなアカウントをお使い下さい）

| メールアドレス                     | test@test, test@test2, test@test3 |
| ------------------------------- | --------------------------------- |
| パスワード(上記3つとも同じパスワード) | a11111                            |

# 動作確認方法
- WebブラウザはGoogle Chromeの最新版を利用してアクセスしてください。datetime型のformがあるためFirefox,Safari等でのアクセスはおすすめできません。
- 同時に複数の方がログインしている場合に、ログインできない可能性があります。
- テストアカウントでログイン後、新規の目標・タスク登録、目標・タスクの編集、詳細画面への遷移、イイね機能、メッセージ機能等が活用できます。
- 確認後、ログアウト処理をお願いします。
- その他、新規登録等ご自身の判断で行っていただいても問題はありません。（練習用アプリケーションのため、当サイトにより引き起こされた問題に対して一切の責任は取れません。個人情報等の情報漏洩にお気をつけ下さい。）

# 利用方法
新規登録の後、自分の目標とその目標に対してのタスクを登録する（任意）。タスクが進む度に達成率を表したグラフの達成度も上がり100%を目指していく。気になる他ユーザーの目標や達成率も確認することができ、コメントやイイねをすることができる。一緒に目標を解決することを主とした利用方法として想定している。

# 想定利用者層
- 年齢：10~20代の若者
- 性別：不定
- 職業：学生、若手の社会人、その他

※何か明確な目標ややりたいことが定まっているユーザー

# 課題
## 皆と一緒に効率的に課題解決ができる
私自身感じていることにはなりますが、独りで努力したり目標を達成したりすることは、途中で心が折れてしまったり、目標を達成した喜びが個人的なものとなり時に虚しく感じたりすることがあります。そのような中で他の人と課題解決に向けて切磋琢磨し、また応援をし合うことがモチベーションのアップ、ひいては目標達成への効率が飛躍的に上昇すると思いました。本アプリは独りよりも多人数での課題可決を効率的にできるよう、そのような環境になれることを目指しています。

# 実装機能
### ユーザー管理機能
- ユーザー登録を行い、ユーザーとアプリケーション内情報を紐付ける。
### ユーザープロフィール編集機能
- ユーザーの編集を可能にし、状況に合わせてユーザー情報を更新できる。
### 目標登録機能
- ユーザーの目標や達成までの期間を登録し表示する。
### 目標期日のタイムカウント機能
- 目標達成までの期間を秒単位でカウントし、期日が近くなれば色が変わり催促を行う。
### タスク登録機能
- ユーザーの目標と紐付いたタスクを登録し、そのタスクに対して操作をすることで目標の達成度を管理する。
### タスク更新機能
- タスクの移動、削除、追加を行うことが可能。目標の達成度を管理する。
### グラフのビジュアル
- 達成度をキレイに可視化することで達成率をユーザーが上昇させたくなるように促す。

<img src="https://i.gyazo.com/c3de436e7766dcb211dc9a89d98ff157.gif" width="70%">

### 目標の検索機能
- 目標やユーザー情報をもとに検索ができる。
### 目標の並び替え機能
- 並び替えを可能にすることでユーザーにとって使いやすい構造になる。また、検索機能と同時に活用ができる。
### ページネーション機能
- ユーザーや目標の数が多くなってもユーザーが使いやすい構造になる。
### イイね機能
- 非同期通信でのイイね機能。ユーザー感での応援や励ましとして活用される。また、イイねの合計数も表示される。
### メッセージ機能
- ユーザー同士のやり取りをコメントを通じて行うことができる。メッセージは常にランダムに色などが変わる。メッセージのやり取りは非同期通信でやりとりされ、メッセージの削除権限はメッセージを送られた側には全権限、送った側は自分のメッセージのみ削除可能。また、自分のメッセージのみ右側に追加される。

<img src="https://i.gyazo.com/12187b93cbdbaff5ae3bcdfe5f596cc8.jpg" width="70%">

### メッセージ自動スクロール機能
- 通常時またはメッセージを送った際は強制的に新しいメッセージが表示される。
### イイねに関する機能
- 自分がイイねした他ユーザーと自分をイイねしている他ユーザーがそれぞれ確認できる。また、そのページから他ユーザーにアクションを起こすことができる。
### 自動非表示機能
- 目標達成の期日が5日以上立っている目標に関してはトップページ上では非表示になる。

# 実装予定の機能
### レスポンシブ対応
- 現在はwebページかつ100%の時のみしか対応していないためスマートフォンなども視野に入れた開発が必要。
### 全ての期日に対してJavaScriptを用いたカウントダウンタイマーの設置
- 残り期日が知れた方がユーザーにとって便利なため実装予定。
### タスク処理の非同期化
- 最終的には見た目の良いタスク管理を行うことでユーザーの使用感が増すと考えているため、jKanbanなどを用いたタスク処理を行う予定。

# 使用技術
Ruby / Ruby on Rails / AWS (EC2, RDS, VPC) / Docker / MySQL / GitHub / Visual Studio Code
開発期間：約 4 週間 (2021/10/14~)

# フロントエンド
| 名称        | 説明                    |
| ---------- | ----------------------- |
| HTML       | webサイトのコンテンツの構造 |
| CSS        | webサイトのスタイリング    |
| JavaScript | 非同期通信・動的処理       |

# バックエンド
| 名称           | 説明                           |
| ------------- | ------------------------------ |
| Ruby on rails | webアプリケーションのフレームワーク |
| MySQL         | データベース                     |

・データはRDSへ保存されます。

# インフラ
| 名称                    | 説明              |
| ---------------------- | ----------------- |
| AWS EC2                | 仮想サーバー        |
| AWS RDS                | 本番用DB           |
| Docker, docker-compose | コンテナ環境        |
| Git, Github            | バージョン管理ツール |

・環境開発からデプロイまでDockerを使用しています。

# インフラ構成図
<img src="https://i.gyazo.com/0567d66aa151ef5f01b747d86a31da33.png" width="70%">

# データベース設計
<img src="https://i.gyazo.com/4830a79e2ee1ae29de4aa0545dc30721.png" width="70%">

# テーブル
## users テーブル

| Column             | Type    | Options                       |
| ------------------ | ------- | ----------------------------- |
| email              | string  | null: false, uniqueness: true |
| encrypted_password | string  | null: false                   |
| nickname           | string  | null: false                   |
| age_id             | integer | null: false                   |
| sex_id             | integer | null: false                   |
| profession_id      | integer | null: false                   |
| effort             | text    |                               |

### Association
- has_many :likes
- has_many :comments

## goals テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| target      | string     | null: false                    |
| reason      | text       |                                |
| achievement | integer    |                                |
| like        | integer    |                                |
| time        | datetime   | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
- has_many :likes
- has_many :comments
- has_many :tasks
- has_many :completions

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| goal   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :goal

## likes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| goal   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :goal

## tasks テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| goal    | references | null: false, foreign_key: true |

### Association
- belongs_to :goal

## completions テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     | null: false                    |
| goal    | references | null: false, foreign_key: true |

### Association
- belongs_to :goal

# バージョン
ruby : 2.7.4p191

rails :6.1.4.1

mysql : 5.6.51

Docker : 20.10.8

node.js :14.17.6