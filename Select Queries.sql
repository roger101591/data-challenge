#in all queries, I assume the orders_items date_created is the timestamp for when the customer adds the item to cart. 
#get order item details in last 7 days including customer and order item info

SELECT c.customer_firstname,c.customer_lastname,c.customer_email,
	   p.product_name,
       o.order_id,o.date_created as order_date,
       i.product_id, i.item_quantity, i.item_price, (i.item_quantity * i.item_price) as line_amount
FROM orders_items i 
	inner join orders o on i.order_id = o.order_id
    inner join products p on i.product_id = p.product_id
    inner join customers c on o.customer_id = c.customer_id
WHERE i.date_created >= date_sub(curdate(), interval 7 day)

;

#get total hairbrush sales in last month


SELECT product_id,product_name,sum(line_amount) as 'Ordered_Amount'
from
(
SELECT o.date_created as order_date,
	   p.product_name,
	   i.product_id, (i.item_quantity * i.item_price) as line_amount
FROM orders_items i
	 inner join orders o on i.order_id = o.order_id
     inner join products p on i.product_id = p.product_id
WHERE i.date_created >= date_sub(curdate(), interval 1 month)
	  and p.product_name like '%hairbrush%'
) as line
group by product_id
;


#return unique customers who ordered facemask in last 3 months 

select DISTINCT c.customer_id,c.customer_firstname,c.customer_lastname,c.customer_email
FROM customers c
	 INNER JOIN orders o on c.customer_id = o.customer_id
     INNER JOIN orders_items i on o.order_id = i.order_id
     INNER JOIN products p on i.product_id = p.product_id
WHERE p.product_name like '%facemask%' and i.date_created >= date_sub(curdate(), interval 3 month)

;

