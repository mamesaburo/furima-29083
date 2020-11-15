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
- has_many :buyer_purchased_items, dependent: :destroy, class_name: "Purchased_item", foreign_key: "buyer_id"
- has_many :seller_purchased_items, dependent: :destroy, class_name: "Purchased_item", foreign_key: "seller_id"

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
| brand_id         | references | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |

### Association

- has_many :item_images, dependent: :destroy
- belongs_to :category
- belongs_to :brand
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

## Brands テーブル

| Column   | Type   | Options     |
| -------- | ------ | ------------|
| name     | string | null: false |

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

| Column    | Type       | Options                                        |
| --------- | ---------- | -----------------------------------------------|
| item_id   | references | null: false, foreign_key: true                 |
| buyer_id  | references | foreign_key: { to_table: :users }, null: false |
| seller_id | references | foreign_key: { to_table: :users }, null: false |

### Association

- belongs_to :item
- belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
- belongs_to :seller, class_name: "User", foreign_key: "seller_id"