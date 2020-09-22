# README

# アプリケーション名

ゼロ秒メモアプリ

# アプリケーション概要

思いついたのこと、思っていることなどをひたすら書き出し、頭を整理するためのアプリ。
60秒カウントダウンと、タイムバーの減少を目安に行う。
記入したメモは、翌日、90日後、180日後にメールにて配信される。

# URL
https://zero-second-memo.herokuapp.com/memos/new

# 利用方法
** 使用方法説明動画
https://youtu.be/f81Oo0yPnsw
1. Basic認証を通過
2. ユーザ登録（必須）
3. メモ記入開

# 目指した問題解決

ゼロ秒メモの習慣は、毎日10枚のメモ書きを行う。
「紙が増え続ける」「検索性が低い」という問題を解決するためにアプリを開発。

# 洗い出した要件

## ユーザ管理機能	
・ユーザ登録ができる
・ユーザ登録が完了していれば、ログインすることができる。
・ログアウトできる
## メモ入力機能	
・テーマを設定できる
・メモを入力できる
・制限時間は1分
・メモを複数枚入力することができる
・メモにタグを付加することができる

## メモ閲覧機能	
・メモ一覧を閲覧できる
・メモは作成日ごとに管理される
・メモはタグごとに閲覧できる

## メモ検索機能
・日付検索、タグ検索可能

## メール配信
・前日、30日前・60日前のメモをメール配信する

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
- has_many :memos_tags
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

