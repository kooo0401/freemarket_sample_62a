# README

## Description
 フリマアプリ【メルカリ】のクローンサイト。
 誰でも簡単に売買が楽しめるフリマアプリ機能を再現しています。
 ユーザー登録、出品、購入機能を再現しています。

 ## Features

- HAML/SASS記法とBEMの命名規則に基づいたマークアップ
- SNS認証に基づく新規登録、ログイン機能
- ajaxを使用した非同期通信
- RSpecを使った単体テスト
- AWS EC2へのデプロイ

## Requirement

- Ruby 2.5.1
- Rails 5.2.3

## Installation

   $ git clone http://github.com/kooo0401/freemarket_sample_62a.git
   $ cd freemarket_sample_62a
   $ bundle install

# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|name_kana|string|null: false|
|birthday|date|null: false|
|tel|integer|null: false|
|self_introduction|text|

### Association
- has_many :products
- has_many :histories
- has_one  :credit
- has_one  :address
- has_one :point
- has_one :money


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name_kana|string|null: false|
|zip|integer|null: false|
|ken_name|string|null: false|
|city_name|string|null: false|
|block_name|string|null: false|
|bill_name|string|
|tel|integer|
|user_id|integer|foreign_key: true, null: false|

### Association
- belongs_to :user


## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|exp_date|integer|null: false|
|security_code|integer|null: false|
|user_id|integer|foreign_key: true, null: false|

### Association
- belongs_to :user


## moneyテーブル
|Column|Type|Options|
|------|----|-------|
|money|integer|
|user_id|integer|foreign_key: true, null: false|

### Association
- belongs_to :user


## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|point|integer|
|user_id|ineger|foreign_key: true, null: false|

### Association
- belongs_to :user


## historiesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, null: false|
|product_id|integer|foreign_key: true, null: false|

### Association
- belongs_to :user
- belongs_to :product


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|description|text|null :false|
|name|string|null: false|
|price|integer|null: false|
|delivery_charged|string|null: false|
|area|string|null: false|
|delivery_days|string|null: false|
|sales_status|string|null: false|
|delivery_way|string|null: false|
|user_id|integer|foreign_key: true, null: false|

### Association
- belongs_to :user
- has_many :images
- has_one :size
- has_one :small_category
- has_one :brand
- has_one :status
- has_one :history


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|integer|foreign_key: true, null: false|

### Association
- belongs_to :product


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|product_id|integer|foreign_key: true, null: false|

### Association
- belongs_to :product


## statusesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|product_id|integer|foreign_key: true, null: false|

### Association
- belongs_to :product


## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size_name|string|null: false|
|size_tag|integer|
|product_id|integer|foreign_key: true, null: false|

### Association
- belongs_to :product


## large_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :mideum_categories


## mideum_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|large_category_id|integer|foreign_key: true, null: false|

### Association
- has_many :small_categories
- belongs_to :large_category


## small_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|size_tag|integer|
|product_id|integer|foreign_key: true, null: false|
|mideum_category_id|integer|foreign_key: true, null: false|

### Association
- belongs_to :product
- belongs_to :mideum_category
- has_many :sizes