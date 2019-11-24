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
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|tel|string|null: false|
|self_introduction|text|
|money|integer|
|point|integer|
|zip|string|
|prefecture|string|
|city_name|string|
|block_name|string|
|bill_name|string|
<!-- nameカラム,name_kanaをlast_name,first_name,last_name_kana,first_name_kanaに変更修正 191116堀 -->
<!-- telカラムのTypeをintegerからstringに変更済み -->

### Association
- has_many :products, dependent: :destroy
- has_many :histories, dependent: :destroy
- has_one  :credit, dependent: :destroy
- has_one  :address, dependent: :destroy
- has_many :sns_credentials, dependent: destroy
<!-- oauth認証のため追加 191118平野 -->

## myaddressesテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|zip|string|null: false|
|prefecture|string|null: false|
|city_name|string|null: false|
|block_name|string|null: false|
|bill_name|string|
|tel|string|
|user_id|integer|foreign_key: true, null: false|
<!-- テーブル名が被った為(都道府県テーブル)、テーブル名修正 191116堀 -->


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
|category_id|integer|foreign_key: true, null: false|
|brand_id|integer|foreign_key: true, null: false|
|status_id|integer|foreign_key: true, default: 1|
|size_id||integer||foreign_key: true|
<!-- categorry_idカラム, brand_idカラムを追加 191112平野 -->
<!-- status_idカラム, size_idカラムを追加 191117村上・髙橋 -->


### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :status
- belongs_to :size
- has_many :images, dependent: :destroy
- has_one :history, dependent: :destroy
<!-- size,status を belongs_to に変更191117髙橋-->

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
<!-- product_idカラムを削除しました 191112平野 -->

### Association
- has_many :products


## statusesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
<!-- |product_id|integer|foreign_key: true, null: false|  ← 削除しました 191117髙橋 -->

### Association
- has_many :products


## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size_name|string|null: false|
<!-- |size_tag|integer|  ←  一旦削除しました 191117髙橋 -->
<!-- |product_id|integer|foreign_key: true, null: false|  ←  削除しました 191117髙橋 -->


### Association
- has_many :products
- belongs_to :catefory


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|foreign_key: true, null: false|

<!-- product_idカラムを削除しました 191112平野 -->
<!-- |size_tag|integer| を削除しました　191117髙橋 -->
### Association
- has_many :products
- has_many :sizes


<!-- brandsテーブルとcategoryテーブルが紐づいている可能性あり
brands,categoryの中身をメルカリサイトから引っ張ってくる際に対応予定 -->

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|
|uid|string||
|user_id|integer|

### Association
- belongs_to :user
<!-- oauth認証のため追加 191118平野 -->
