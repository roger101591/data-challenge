CREATE DATABASE if not exists dermstore_data_challenge;
use dermstore_data_challenge;

create table customers(
	customer_id integer  not null auto_increment,
    customer_firstname varchar(20),
    customer_lastname varchar(20),
    customer_email varchar(40),
    date_created datetime default current_timestamp,
    primary key (customer_id)
    )
    
;

create table products(
	product_id integer not null auto_increment,
    product_name varchar(40),
#decimal field length complies with Generally Accepted Accounting Principles (GAAP) rules src: https://www.mysqltutorial.org/mysql-decimal/
    product_price decimal(19,4),
    product_cost decimal(19,4),
    product_status varchar(20),
    date_created datetime default current_timestamp,
    primary key (product_id)
    )
    
;

create table orders(
	order_id integer not null auto_increment,
    customer_id integer not null,
    order_total decimal(19,4),
#order_source might refer to a URL so allowing up to 65k characters for URL to be expressed
    order_source TEXT,
    date_created datetime default current_timestamp,

    primary key (order_id),
    foreign key (customer_id)
#changes in the customer_id in parent table `customers` will affect child table `orders` to ensure atomicity
		references customers(customer_id)
        on delete cascade
        on update cascade
	)
    
;

create table orders_items(
	order_id integer not null,
    product_id integer not null,
    item_quantity integer,
    item_price decimal(19,4),
    date_created datetime default current_timestamp, 
	primary key(order_id, product_id),
    foreign key (order_id)
		references orders(order_id)
        on delete cascade
        on update cascade,
	foreign key (product_id)
#changes in the customer_id in parent table `products` will affect child table `orders_items` to ensure atomicity
		references products(product_id)
        on delete cascade
        on update cascade
)
    
    
    
;
