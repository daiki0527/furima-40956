# README

## users table
|Column             |Type       |Options                         | 
|-------------------|-----------|--------------------------------|
|nickname           |string     |null: false                     |
|email              |string     |null: false,unique: true        |
|password           |string     |null: false                     |
|password_confirm   |string     |null: false                     |
|last_name          |string     |null: false                     |
|first_name         |string     |null: false                     |
|last_name_kana     |string     |null: false                     |
|first_name_kana    |string     |null: false                     |
|birth              |string     |null: false                     |

### Association
has_many :items
has_many :orders

## items table
|Column             |Type       |Options                         | 
|-------------------|-----------|--------------------------------|
|image              |string     |null: false                     |
|name               |string     |null: false                     |
|items_condition    |string     |null: false                     |
|detail             |string     |null: false                     |
|delivery           |string     |null: false                     |
|price              |string     |null: false                     |
|user               |references |null: false, foreign_key: true  |

### Association
belongs_to  :user
has_one     :order

## orders
|Column             |Type       |Options                         | 
|-------------------|-----------|--------------------------------|
|product_name       |text       |null: false                     |
|image              |string     |null: false                     |
|price              |string     |null: false                     |
|user_name          |string     |null: false                     |
|category           |string     |null: false                     |
|items_condition    |string     |null: false                     |
|shipping_fee       |string     |null: false                     |
|ship_from          |string     |null: false                     |
|shipping_date      |string     |null: false                     |
|comment            |text       |null: false                     |
|user               |references |null: false, foreign_key: true  |
|item               |references |null: false, foreign_key: true  |

### Association
belongs_to :user
belongs_to :item
has_one    :shipping

## shipping
|Column             |Type       |Options                         | 
|-------------------|-----------|--------------------------------|
|post_code          |string     |null: false                     |
|state              |string     |null: false                     |
|municipalities     |text       |null: false                     |
|address            |text       |null: false                     |
|building_name      |text       |null: false                     |
|phone_number       |string     |null: false                     |
|order              |references |null: false, foreign_key: true  |

### Association
belongs_to  :order


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
