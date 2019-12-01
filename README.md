# README

## Description
 フリマアプリ【メルカリ】のクローンサイト。
 誰でも簡単に売買が楽しめるフリマアプリ機能を再現しています。
 ユーザー登録、出品、購入機能を再現しています。

***DEMO:***
トップページ
https://gyazo.com/5d9e5aacbf84e2b858a57faa4aac2c2f

マイページ一覧
https://gyazo.com/59311c82c51e91cfa5f0421d23aae026

出品一覧ページ
https://gyazo.com/d4abe2e0fe43860b11642a2b9418f864

商品購入画面
https://gyazo.com/2e3f5d2576c4a503cfdb88bde8cf8ee9

商品詳細ページ
https://gyazo.com/9ca15722253b74a0fe9fe9bd1faa4c82

会員情報入力画面
https://gyazo.com/7fef038be95b1fa8b9b47212bf1cf83a

 ## Features

- HAML/SASS記法とBEMの命名規則に基づいたマークアップ
- SNS認証に基づく新規登録、ログイン機能
- ajaxを使用した非同期通信
- RSpecを使った単体テスト
- AWS EC2へのデプロイ
- ActiveStorageを使用しAWS S3への画像アップロード
- pay.jpによる購入処理
- グレーテルgemを使用したパンくず機能
- Jqueryによるスライド・モーダル機能

## Requirement

- Ruby 2.5.1
- Rails 5.2.3

## Installation

   $ git clone http://github.com/kooo0401/freemarket_sample_62a.git
   $ cd freemarket_sample_62a
   $ bundle install

## Author 
6名によるチーム開発
keitaro hirano
hideaki takahashi
koudai  hori
masaki  murakami
daisuke sakurada
masatoshi muraoka

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
|point|integer|
|zip|string|
|prefecture|string|
|city_name|string|
|block_name|string|
|bill_name|string|

### Association
- has_many :products, dependent: :destroy
- has_many :histories, dependent: :destroy
- has_one  :credit, dependent: :destroy
- has_one  :address, dependent: :destroy
- has_many :sns_credentials, dependent: destroy

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
|delivery_charged|integer|null: false|
|delivery_days|integer|null: false|
|sales_status|integer|null: false|
|delivery_way|ingteger|null: false|
|user_id|integer|foreign_key: true, null: false|
|category_id|integer|foreign_key: true, null: false|
|brand|string|
|status_id|integer|foreign_key: true, default: 1|
|size_id||integer||foreign_key: true|
|prefecture_id|integer|null:false|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :status
- belongs_to :size
- belongs_to_active_hash :prefecture
- has_many :images, dependent: :destroy
- has_one :history, dependent: :destroy

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|integer|foreign_key: true, null: false|

### Association
- belongs_to :product

## statusesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :products

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size_name|string|null: false|

### Association
- has_many :products
- belongs_to :catefory

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|foreign_key: true, null: false|

### Association
- has_many :products
- has_many :sizes

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|
|uid|string||
|user_id|integer|

### Association
- belongs_to :user