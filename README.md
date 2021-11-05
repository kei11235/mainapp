# アプリケーション名 : Bee Your Best
# アプリケーション概要
人の目標と達成度がわかるWebアプリ。

自分の目標と同じような人がいるのか、また、その人はどれくらい目標に向かって進んでいるのか確認することができ、また応援し合うことができる。人と一緒に努力していくことを想定したアプリケーション。

# URL
	http://54.95.64.84/


# 利用方法
新規登録の後、自分の目標とその目標に対してのタスクを登録する（任意）。タスクが進む度に達成率を表したグラフの進行度も上がり100%を目指していく。気になる他ユーザーの目標や達成率も確認することができ、コメントや応援をすることができる。一緒に目標を解決することを主としての利用方法として想定している。

# 想定利用者層
- 年齢：10~20代の若者
- 性別：不定
- 職業：学生、若手の社会人、その他

※何か明確な目標ややりたいことが定まっているユーザー

# 課題
## 皆と一緒に効率的に課題解決ができる
- 私自身感じていることにはなりますが、独りで努力したり目標を達成したりすることは、途中で心が折れてしまったり、目標を達成した喜びが個人的なものとなり時に虚しく感じたりすることがあります。そのような中で他の人と課題解決に向けて切磋琢磨し、また応援をし合うことがモチベーションのアップ、ひいては目標達成への効率が飛躍的に上昇すると思いました。本アプリは独りよりも多人数で課題可決を効率的にできるよう、そのような環境になれることを目指しています。

# 実装機能
実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。

# 使用技術
Ruby / Ruby on Rails / AWS (EC2, RDS, VPC) / Docker / MySQL / GitHub / Visual Studio Code 開発期間：約 4 週間 (2021/10/14~)

# フロントエンド
# バックエンド
# インフラ
# インフラ構成図

# データベース設計
ER図等を添付。

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
- has_many :goals, through: :likes
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
- belongs_to :user, through: :likes
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