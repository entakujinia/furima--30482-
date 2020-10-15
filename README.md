# テーブル設計

## users テーブル

| Column            | Type         | Options                       |
| ----------------- | ------------ | ----------------------------- |
| email             | string       | null: false                   |
| encrypted_password| string       | null: false                   |
| nickname          | string       | null: false                   |
| first_name        | string       | null: false                   |
| last_name         | string       | null: false                   |
| first_name_kana   | string       | null: false                   |
| last_name_kana    | string       | null: false                   |
| birthday          | date         | null: false                   |

### Association

- has_many :items
- has-many :purchases


## items テーブル

| Column            | Type         | ----------------------------- |
| ----------------- | ------------ | ----------------------------- |
| name              | string       | null: false                   |
| description       | text         | null: false                   |
| category_id       | integer      | null: false                   |
| status_id         | integer      | null: false                   |
| delivery_fee_id   | integer      | null: false                   |
| delivery_area_id  | integer      | null: false                   |
| delivery_days_id  | integer      | null: false                   |
| price             | integer      | null: false                   |
| user              | references   | null: false, foreign_key:true |

### Association

- belongs_to       :user
- has_one          :purchase
- has_one_attached :image


## street_addressテーブル

| Column            | Type      | ------------------------------ |
| ----------------- | --------- | ------------------------------ |
| post_code         | string    | null: false                    |
| prefectures_id    | integer   | null: false                    |
| city              | string    | null: false                    |
| address           | string    | null: false                    |
| appointment_name  | string    |                                |
| phone_number      | string    | null: false                    |
| purchase          | references| null: false, foreign_key: true |

### Association

- belongs_to :purchase


## purchase  テーブル

| Column     | Type         | ----------------------------- |
| ---------- | ------------ | ----------------------------- |
| user       | references   | null: false, foreign_key:true |
| product    | references   | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :street_address