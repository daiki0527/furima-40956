# README

## users table
|Column             |Type       |Options                         | 
|-------------------|-----------|--------------------------------|
|name               |string     |null: false                     |
|email              |string     |null: false,unique: true        |
|user_password      |string     |null: false                     |
|user_image         |string     |null: false                     |
|last_name          |string     |null: false                     |
|first_name         |string     |null: false                     |
|user               |references |null: false, foreign_key: true|

### Association
has_many :items
has_many :order

## items table
|Column             |Type       |Options                         | 
|-------------------|-----------|--------------------------------|
|name               |string     |null: false                     |
|price              |string     |null: false                     |
|detail   　　　　　　|text       |null: false                     |
|items_condition    |text       |null: false                     |
|size               |string     |null: false                     |
|cost               |string     |null: false                     |

### Association
belongs_to　：user
has_many    :order_items

## order_items
|Column             |Type       |Options                         | 
|-------------------|-----------|--------------------------------|
|items              |references |null: false, foreign_key: true  |
|order              |references |null: false, foreign_key: true  |
|order_items  　　　 |references |null: false                     |

### Association
belongs_to　：items
belongs_to　：order

## order
|Column             |Type       |Options                         | 
|-------------------|-----------|--------------------------------|
|user               |references |null: false, foreign_key: true  |
|size               |string     |null: false                     |
|price        　　　 |string     |null: false                     |
|name               |string     |null: false                     |

### Association
has_many :order_items
has_one  :shipping

## shipping
|Column             |Type       |Options                         | 
|-------------------|-----------|--------------------------------|
|user               |references |null: false, foreign_key: true  |
|total amount       |string     |null: false                     |
|order_date       　|text        |null: false                    |
|price              |string     |null: false                     |
  
### Association
has_one  :order
has_one  :items


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
