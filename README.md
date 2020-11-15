# テーブル設計

## Users テーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ------------------------------|
| nickname           | string | null: false                   |
| email              | string | null: false, uniqueness: true |
| encrypted_password | string | null: false, uniqueness: true |
| family_name        | string | null: false                   |
| first_name         | string | null: false                   |
| family_name_kana   | string | null: false                   |
| first_name_kana    | string | null: false                   |
| birth              | date   | null: false                   |

### Association

- has_many :items, dependent: :destroy
- has_one :address, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_one :purchased_items, dependent: :destroy

## Items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | -------------------------------|
| name             | string     | null: false                    |
| description_item | text       | null: false                    |
| price            | integer    | null: false                    |
| condition        | integer    | null: false                    |
| shipping_cost    | integer    | null: false                    |
| shipping_area    | integer    | null: false                    |
| shipping_days    | integer    | null: false                    |
| category         | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- has_many :item_images, dependent: :destroy
- belongs_to :category
- belongs_to :user
- has_one :purchased_item

## Item_images テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | -------------------------------|
| image   | string     | null: false                    |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item

# Categories テーブル

| Column   | Type   | Options     |
| -------- | ------ | ------------|
| name     | string | null: false |
| ancestry | string |             |

### Association

- has_many :items

## Addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | -------------------------------|
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| postal_code      | integer    | null: false                    |
| prefectures      | string     | null: false                    |
| city             | integer    | null: false                    |
| address_detail   | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## Purchased_items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | -------------------------------|
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item