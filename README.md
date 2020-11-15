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
- has_one :purchased_items, dependent: :destroy

## Items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | -------------------------------|
| name             | string     | null: false                    |
| description_item | text       | null: false                    |
| price            | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- has_many :item_images, dependent: :destroy
- belongs_to :user
- has_one :purchased_item

## Item_images テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | -------------------------------|
| image   | string     | null: false                    |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## Addresses テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | -------------------------------|
| family_name       | string     | null: false                    |
| first_name        | string     | null: false                    |
| family_name_kana  | string     | null: false                    |
| first_name_kana   | string     | null: false                    |
| postal_code       | integer    | null: false                    |
| prefectures       | string     | null: false                    |
| city              | integer    | null: false                    |
| address_detail    | string     | null: false                    |
| building          | string     |                                |
| phone_number      | string     | null: false                    |
| purchased_item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :purchased_item

## Purchased_items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | -------------------------------|
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :Purchased_item