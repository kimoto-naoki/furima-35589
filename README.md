## usersテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| nickname         | string     | null: false                    |
| email            | string     | null: false                    |
| password         | string     | null: false                    |
| last_name        | string     | null: false                    |
| first_name       | string     | null: false                    |
| ruby_last_name   | string     | null: false                    |
| ruby_first_name  | string     | null: false                    |
| birthday         | date       | null: false                    |

### Association
- has_many :items
- has_many :sold_items



## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| item_text     | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| who_cost      | string     | null: false                    |
| shipping_area | string     | null: false                    |
| days_to_ship  | string     | null: false                    |
| price         | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :sold_items



## purchase_detailsテーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| card_number     | integer | null: false                    |
| expiration_date | date    | null: false                    |
| cvc             | integer | null: false                    |

### Association
- belongs_to :user
- belongs_to :item
- has_many :address



## addressテーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| postal_code  | integer | null: false                    |
| prefictures  | string  | null: false                    |
| city         | string  | null: false                    |
| house_number | integer | null: false                    |
| phone_number | integer | null: false                    |

### Association
- has_many :items
- has_many :sold_items
