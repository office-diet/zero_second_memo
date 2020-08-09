# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



# テーブル設計

## users　テーブル

| Column            | Type    | Options                   |
|-------------------|---------|---------------------------|
| nickname          | string  | null: false, unique: true |
| emial             | string  | null: false, unique: true |
| password          | string  | null: false               |

### Association
- has_many  :memos, dependent: :destroy


## memos　テーブル

| column    | type        | Options                           |
|-----------|-------------|-----------------------------------|
| theme     | string      | null: false                       |
| text      | text        | null: false                       |
| user_id   | references  | null: false, foreign_key: true    |

### Association
- belongs_to :user
- has_many :tags_memos
- has_many :tags, through :tags_memos


## memos_tags　テーブル

| column    | type   | Options                        |
|-----------|--------|--------------------------------|
| memo_id   | string | null: false, foreign_key: true |
| tag_id    | text   | null: false, foreign_key: true |

### Association
- belongs_to :memo
- belongs_to :tag

## tags　テーブル

| column   | type        | Options                    |
|----------|-------------|----------------------------|
| name     | string      | null: false, unique: true  |

### Association
- has_many :memos_tags
- has_many :memos, through: :memos_tags

