# 本番環境
https://furima-35521.herokuapp.com/

# テーブル設計

## usersテーブル (ユーザー情報)

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| email              | string | null: false, unique: true      |
| encrypted_password | string | null: false                    |
| last_name          | string | null: false                    |
| first_name         | string | null: false                    |
| last_name_kana     | string | null: false                    |
| first_name_kana    | string | null: false                    |
| birthday           | date   | null: false                    |

### Association

- has_many :purchases
- has_many :items

## purchasesテーブル (購入記録)

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## itemsテーブル (商品情報)

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| product_name     | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| burden_id        | integer    | null: false                    |
| area_id          | integer    | null: false                    |
| day_delivery_id  | integer    | null: false                    |
| price            | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :purchase

## destinationsテーブル (発送先住所)

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| purchase         | references | null: false, foreign_key: true |
| postal_code      | string     | null: false                    |
| area_id          | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |

### Association

- belongs_to :purchase