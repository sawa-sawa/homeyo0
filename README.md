# **HOMEYO**
***
### 1. "HOMEYO"とは?
- 第三者のタスクを褒めることのできる、SNS機能つきTodoリストのアプリです。
![mainview](https://gyazo.com/0c2bee184bf7577a418cf514ecf8ddb0)
### 2. 本番環境
- デプロイURL
-- http:
- テストアカウント
-- emali: test@test.com
-- password: sample123
### 3. 使用技術(開発環境)
- HTML(Haml)/CSS(sass)/Ruby on Rails/Javascript(jQuery)
### 4. なぜこのようなアプリを制作したのか
![Why](https://gyazo.com/b265fa72f89a8e7b4757959521dbdeaa)
- 私は「人々のちょっとした支えになるアプリが作りたい」と考えて制作しています
- 継続して物事を実行するにあたり、第三者の応援や褒めがあれば続けやすいのではないかと考えて制作しました。
- 家事や日常の業務でも誰かに褒められれば、日々のモチベーションになる思います。些細なことでも投稿してもらえれば幸いです。


### 5. DEMO
1. ログイン後メイン画面が表示されます。
「今日中」「今週中」「今月中」でTodoが仕分けられます。
![mainview](https://gyazo.com/0c2bee184bf7577a418cf514ecf8ddb0)
2. マイページで今までのTodoを確認できます
![mypage](https://gyazo.com/7a526d49842e7471b7977b0f72482ecf)


### 6. 工夫したところ
- Todoを完了する「Done!」ボタンをクリックすると、ボタン周辺に紙吹雪が飛び出し
ちょっとした達成感が味わえます。
![demo](https://gyazo.com/3ed92af693e0afd02b22beacdf0ddb07)

- ネガティブな文章・プライベートな内容が投稿されないよう、定型文字の組み合わせでTODOリストが作成できます
（タスク詳細は、カレントユーザーだけが見ることができるメモに記入・閲覧できます）


### 7. 今後実装・改善予定
- 褒め・褒められポイントの実装
- マイページのカレンダーとTodoの日時の連携
- 過去に作成したTodoの検索機能
- TodoのEdit・Delete機能
- 褒めボタンを押した時のアニメーション実装
- デザインの統一
- コードのリファクタリング


## DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :tasks
- has_many :encouragements

## tasksテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|due_date|DATETIME|null: false|
|place|references|foreign_key: true|
|person|references|foreign_key: true|
|target|references|foreign_key: true|
|action|references|null: false, foreign_key: true|
|memo|string||

### Association
- belongs_to :user
- has_many :tags
- has_one :place
- has_one :person
- has_one :target
- has_one :action

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|

### Association
- has_many :tasks_tags
- has_many :tasks, through::tasks_tags

## tasks_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|task|references|null: false, foreign_key: true|
|tag|references|null: false, foreign_key: true|

### Association
- belongs_to :task
- belongs_to :tag

## encouragementsテーブル
|Column|Type|Options|
|------|----|-------|
|task|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
|message|references|foreign_key: true|
|reaction|references|foreign_key: true|

### Association
- belongs_to :task
- belongs_to :user
- has one :message
- has one :reaction

## placesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :task

## persons(people)テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :task

## targetsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :task

## actionsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- belongs_to :task