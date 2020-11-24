# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_day       | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| introduction | text       | null: false                    |
| category     | references | null: false, foreign_key: true |
| status       | references | null: false, foreign_key: true |
| price        | integer    | null: false                    |
| charges      | references | null: false, foreign_key: true |
| area         | references | null: false, foreign_key: true |
| days         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- has_many :images
- has_one :order
- belongs_to :category
- belongs_to :status
- belongs_to :charge
- belongs_to :area
- belongs_to :day

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## images テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| image  |            |                                |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :items

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |
| deliver_address | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :deliver_address

## deliver_addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| post_code     | integer | null: false |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone_number  | integer | null: false |

### Association

- has_one :oder