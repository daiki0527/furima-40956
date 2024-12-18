# README

## users table
|Column             |Type       |Options                         | 
|-------------------|-----------|--------------------------------|
|nickname           |string     |null: false                     |
|email              |string     |null: false,unique: true        |
|encrypted_password |string     |null: false                     |
|last_name          |string     |null: false                     |
|first_name         |string     |null: false                     |
|last_name_kana     |string     |null: false                     |
|first_name_kana    |string     |null: false                     |
|birth              |date       |null: false                     |

### Association
has_many :items
has_many :orders

## items table
|Column             |Type       |Options                         | 
|-------------------|-----------|--------------------------------|
|name               |string     |null: false                     |
|explanation        |text       |null: false                     |
|category_id        |integer    |null: false                     |
|condition_id       |integer    |null: false                     |
|charge_id          |integer    |null: false                     |
|area_id            |integer    |null: false                     |
|delivery_day_id    |integer    |null: false                     |
|price              |integer    |null: false                     |
|user               |references |null: false, foreign_key: true  |

### Association
belongs_to  :user
has_one     :order

## orders table
|Column             |Type       |Options                         | 
|-------------------|-----------|--------------------------------|
|user               |references |null: false, foreign_key: true  |
|item               |references |null: false, foreign_key: true  |

### Association
belongs_to :user
belongs_to :item
has_one    :sending

## sending table
|Column             |Type       |Options                         | 
|-------------------|-----------|--------------------------------|
|postal_code        |string     |null: false                     |
|state              |string     |null: false                     |
|municipalities     |string     |null: false                     |
|address            |string     |null: false                     |
|phone_number       |string     |null: false                     |
|order              |references |null: false, foreign_key: true  |
|area_id            |integer    |null: false                     |

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
