# テーブル設計

## users テーブル

| Column        | Type     | Option      |
|---------------|----------|-------------|
| name          | string   | null: false |
| email         | string   | null: false |
| password      | string   | null: false |
| chinese_name  | string   | null: false |
| japanese_name | string   | null: false |
| birthday      | integer  | null: false |

### Association

user has_many :items
user has_many :comments
user has_many :buys


## items テーブル

| Column        | Type          | Option                         |
|---------------|---------------|--------------------------------|
| user_id       | references    | null: false, foreign_key: true |
| image         | string        | null: false                    |
| title         | string        | null: false                    |
| text          | string        | null: false                    |
| category      | string        | null: false                    |
| state         | string        | null: false                    |
| burden        | string        | null: false                    |
| from          | string        | null: false                    |
| day           | string        | null: false                    |
| charge        | integer       | null: false                    |

### Association

item belongs_to :user
item has_many :comments
item belongs_to :buy


## buy テーブル

| Column        | Type          | Option                         |
|---------------|---------------|--------------------------------|
| user_id       | references    | null: false, foreign_key: true |
| item_id       | references    | null: false, foreign_key: true |

### Association

buy belongs_to :user
buy belongs_to :item


## credit テーブル

| Column        | Type          | Option                         |
|---------------|---------------|--------------------------------|
| buy_id        | references    | null: false, foreign_key: true |

### Association

credit belongs_to :buy


## delivery テーブル

| Column        | Type          | Option                         |
|---------------|---------------|--------------------------------|
| buy_id        | references    | null: false, foreign_key: true |

### Association

credit belongs_to :buy