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

![ER0707](https://user-images.githubusercontent.com/50174939/60764082-dc30eb00-a0bc-11e9-9525-7cfc2cf684c6.png)


## tbl_userテーブル
|Column|Type|Options|
|------|----|-------|
|last-name|string|index: true, null: false|
|first-name|string|index: true, null: false|
|first-name-kana|string|index: true, null: false|
|last-name-kana|string|index: true, null: false|
|mail|string|null: false|
|password|string|null: false|
|phone|integer|null: false|
|birthday|data|null: false|

### Association
- has_one :tbl_profile
- has_many :tbl_buyers
- has_many :tbl_addresses
- has_many :tbl_cards
- has_many :tbl_products
- has_many :tbl_comments
- has_many :tbl_goods
- has_many :tbl_reviews


## tbl_profileテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|nill:false|
|icon|string||
|description|text||
|tbl_user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :tbl_user


## tbl_addressテーブル
|Column|Type|Options|
|------|----|-------|
|tbl_user_id|references|null: false, foreign_key: true|
|full-name|string|index: true, null: false|
|full-name-kana|string|index: true, null: false|
|zip|integer|null: false|
|mst_prefecture_id|references|null: false, foreign_key: true|
|address|string|null: false|
|phone|integer|null: false|

### Association
- belongs_to :tbl_user


## tbl_cardテーブル
|Column|Type|Options|
|------|----|-------|
|tbl_user_id|references|null: false, foreign_key: true|
|number|integer|null: false|
|valid_year|integer|null: false|
|valid_month|integer|null: false|

### Association
- belongs_to :tbl_user


## tbl_productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|
|description|text|null: false|
|price|integer|null: false|
|mst_category_id|references|null: false, foreign_key: true|
|mst_brand_id|references|foreign_key: true|
|mst_size_id|references|foreign_key: true|
|mst_condition_id|references|null: false, foreign_key: true|
|mst_burden_id|references|null: false, foreign_key: true|
|mst_delivery_method_id|references|foreign_key: true|
|mst_prefecture_id|references|null: false, foreign_key: true|
|mst_delivery_time_id|references|null: false, foreign_key: true|
|mst_status_id|references|null: false, foreign_key: true|
|tbl_user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :tbl_user
- has_many :tbl_product_images
- has_many :tbl_comments
- has_many :tbl_goods
- has_many :tbl_buyers


## tbl_product_imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|tbl_product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :tbl_product


## tbl_commentテーブル
|Column|Type|Options|
|------|----|-------|
|tbl_user_id|references|null: false, foreign_key: true|
|tbl_product_id|references|null: false, foreign_key: true|
|comment|text|null: false|

### Association
- belongs_to :tbl_product
- belongs_to :tbl_user


## tbl_goodテーブル
|Column|Type|Options|
|------|----|-------|
|tbl_user_id|references|null: false, foreign_key: true|
|tbl_product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :tbl_product
- belongs_to :tbl_user


## tbl_buyerテーブル
|Column|Type|Options|
|------|----|-------|
|tbl_user_id|references|null: false, foreign_key: true|
|tbl_product_id|references|null: false, foreign_key: true|
|tbl_address_id|references|null: false, foreign_key: true|
|mst_correspondence_id|references|null: false, foreign_key: true|
|tbl_message_id|references|foreign_key: true|

### Association
- belongs_to :tbl_product
- belongs_to :tbl_user

## tbl_reviewテーブル
|Column|Type|Options|
|------|----|-------|
|review|text||
|tbl_user_id|references|null: false, foreign_key: true|
|tbl_product_id|references|null: false, foreign_key: true|
|mst_score_id|references|null: false, foreign_key: true|

### Association
- belongs_to :tbl_buyer
- belongs_to :tbl_user


## tbl_messageテーブル
|Column|Type|Options|
|------|----|-------|
|tbl_user_id|references|null: false, foreign_key: true|
|tbl_buyer_id|references|null: false, foreign_key: true|
|message|text|null: false, foreign_key: true|

### Association
- belongs_to :tbl_buyer
- belongs_to :tbl_user


---------------------------------------
## mst_major_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|


## mst_middle_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|
|mst_major_category_id|references|null: false, foreign_key: true|

## mst_small_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|
|mst_middle_category_id|references|null: false, foreign_key: true|

## mst_brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## mst_sizeテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## tbl_category_bland
|Column|Type|Options|
|------|----|-------|
|mst_small_category_id|references|null: false, foreign_key: true|
|mst_brand_id|references|null: false, foreign_key: true|

## tbl_category_size
|Column|Type|Options|
|------|----|-------|
|mst_small_category_id|references|null: false, foreign_key: true|
|mst_size_id|references|null: false, foreign_key: true|

## mst_condition
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## mst_burden
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## mst_delivery_method
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## mst_prefecture
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## mst_delivery time
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## mst_status
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## mst_score
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## mst_position
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

## mst_correspondence
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false|

