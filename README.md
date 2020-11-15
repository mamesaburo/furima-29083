# テーブル設計

## Users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ------------------------------|
| nickname           | string | null: false                   |
| email              | string | null: false, uniqueness: true |
| encrypted_password | string | null: false                   |
| family_name        | string | null: false                   |
| first_name         | string | null: false                   |
| family_name_kana   | string | null: false                   |
| first_name_kana    | string | null: false                   |
| birth              | date   | null: false                   |

### Association

- has_many :items, dependent: :destroy
- has_many :purchased_item

## Items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | -------------------------------|
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| price            | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchased_item

## Addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | -------------------------------|
| postal_code      | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| city             | string     | null: false                    |
| address_detail   | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |
| purchased_item   | references | null: false, foreign_key: true |

### Association

- belongs_to :purchased_item

## Purchased_items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | -------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address