# テーブル設計

## users テーブル

| Column                  | Type     | Option                     |
|-------------------------|----------|----------------------------|
| name                    | string   | null: false                |
| email                   | string   | null: false, unique: true  |
| encrypted_password      | string   | null: false                |
| last_name               | string   | null: false                |
| first_name              | string   | null: false                |
| last_name_kana          | string   | null: false                |
| first_name_kana         | string   | null: false                |
| birthday                | date     | null: false                |

### Association

user has_many :items
user has_many :comments
user has_many :buys


## items テーブル

| Column        | Type          | Option                         |
|---------------|---------------|--------------------------------|
| user_id       | references    | null: false, foreign_key: true |
| title         | string        | null: false                    |
| text          | text          | null: false                    |
| category_id   | integer       | null: false                    |
| state_id      | integer       | null: false                    |
| burden_id     | integer       | null: false                    |
| from_id       | integer       | null: false                    |
| day_id        | integer       | null: false                    |
| charge        | integer       | null: false                    |

### Association

item belongs_to :user
item has_many :comments
item has_one :buy


## buys テーブル

| Column        | Type          | Option                         |
|---------------|---------------|--------------------------------|
| user_id       | references    | null: false, foreign_key: true |
| item_id       | references    | null: false, foreign_key: true |

### Association

buy belongs_to :user
buy belongs_to :item
has_one :buyer


##  buyersテーブル

| Column        | Type          | Option                         |
|---------------|---------------|--------------------------------|
| buy_id        | references    | null: false, foreign_key: true |
| postcode      | references    | null: false                    |
| prefecture_id | integer       | null: false                    |
| city          | string        | null: false                    |
| block         | string        | null: false                    |
| building      | string        | null: false                    |
| phone_number  | boolean       | null: false                    |

### Association

buyer belongs_to :buy