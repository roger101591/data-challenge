# Thanks for applying to Dermstore

## Information

* Set aside around 2 hours to complete this challenge
* Fork this repo and build your project in your forked repo
* Target MySQL 5.7+
* When you are done send a link with your repo back to us.

## Challenge

* Write CREATE DATABASE statements for the schema below (assume 10K-100K rows per table)
* Write a 2-3 interesting SELECT queries to report on the data
* In any language of your choice, write a script to INSERT five rows of random data into the customers table

## Schema

* customers
  * customer_id, customer_firstname, customer_lastname, customer_email, date_created
* products
  * product_id, product_name, product_price, product_cost, product_status, date_created
* orders
  * order_id, customer_id, order_total, order_source, date_created
* orders_items
  * order_id, product_id, item_quantity, item_price, date_created
