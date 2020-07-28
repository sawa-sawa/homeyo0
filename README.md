# homeyo DB設計
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