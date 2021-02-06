## usersテーブル

|Column      |Type Option | Options     |
|----------- |------------|-------------|
|email       | string     | null: false |
|password    | string     | null: false |
|name        | string     | null: false |
|profile     | text       | null: false |
|occupation  | text       | null: false |
|position    | text       | null: false |

### Association
 -  has_many :prototypes
 -  has_many :comments



## commentsテーブル

| Column    | Type Option | Options     |
|---------- | ----------- | ----------- |
| text      | text        | null: false |
| user      | references  |             |
| prototype | references  |             |

### Association 
 - belongs_to :user
 - belongs_to :prototype


## prototypeテーブル

 | Column     | Type Option | Options     |
 | ---------- | ----------- | ----------- |
 | title      | string      | null: false |
 | catch_copy | text        | null: false |
 | concept    | text        | null: false |
 | user       | references  |             |

### Association
 - belongs_to :user
 - has_many :comments
