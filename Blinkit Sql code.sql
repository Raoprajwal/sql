select * from blinkit;
desc blinkit;
UPDATE blinkit_data
SET Item_Fat_Content = 
    CASE 
        WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
        WHEN Item_Fat_Content = 'reg' THEN 'Regular'
        ELSE Item_Fat_Content
    END;
    
#first three kpi
select concat(cast(sum(total_sales)/1000000 as decimal(10,2))," M") Total_sales_milions from blinkit;
select cast(avg(total_sales) as decimal(10,1))as avg_sales from blinkit;
select count(*) as No_of_items from blinkit;
select cast(avg(rating) as decimal(10,2)) as Avg_rating from blinkit;

#granular requirement
select item_fat_content,
	concat(cast(sum(total_sales)/1000  as decimal(10,2))," k")as Total_sales_thousands,
	cast(avg(total_sales) as decimal(10,1))as Avg_sales,
	count(*) as No_of_items,
	cast(avg(rating) as decimal(10,2)) as Avg_rating
from blinkit  
group by item_fat_content 
order by total_sales_thousands desc;
#for top 5 item_type
select item_type,
	cast(sum(total_sales)  as decimal(10,2))as Total_sales,
	cast(avg(total_sales) as decimal(10,1))as Avg_sales,
	count(*) as No_of_items,
	cast(avg(rating) as decimal(10,2)) as Avg_rating
from blinkit 
group by item_type
order by total_sales desc
limit 5;

#for bottom 5 item type
select item_type,
	cast(sum(total_sales)  as decimal(10,2))as Total_sales,
	cast(avg(total_sales) as decimal(10,1))as Avg_sales,
	count(*) as No_of_items,
	cast(avg(rating) as decimal(10,2)) as Avg_rating
from blinkit 
group by item_type
order by total_sales asc
limit 5;


#for oultlet with item content 
select outlet_location_type,
cast(sum(case when item_fat_content='Low Fat' then total_sales else 0 end)as decimal(10,2))as Low_fat,
cast(sum(case when item_fat_content='Regular' then total_sales else 0 end)as decimal(10,2))as Regular
from blinkit
group by outlet_location_type
order by outlet_location_type;

##
select outlet_establishment_year,
cast(sum(total_sales)  as decimal(10,2))as Total_sales,
cast(avg(total_sales) as decimal(10,1))as Avg_sales,
count(*) as No_of_items,
cast(avg(rating) as decimal(10,2)) as Avg_rating
from blinkit 
group by outlet_establishment_year
order by total_sales desc;

##percent
select outlet_size,
cast(sum(total_sales) as decimal(10,2)) as total_sales,
cast(sum(total_sales)/sum(sum(total_sales)) over() *100 as decimal(10,2)) as percent_total_sales
from blinkit
group by outlet_size
order by total_sales desc;

#
select outlet_location_type,
cast(sum(total_sales) as decimal(10,2)) as total_sales,
cast(avg(total_sales) as decimal(10,1))as Avg_sales,
count(*) as No_of_items,
cast(avg(rating) as decimal(10,2)) as Avg_rating
from blinkit
group by outlet_location_type
order by total_sales desc;

###last
select outlet_type,
cast(sum(total_sales) as decimal(10,2)) as total_sales,
cast(avg(total_sales) as decimal(10,1))as Avg_sales,
count(*) as No_of_items,
cast(avg(rating) as decimal(10,2)) as Avg_rating
from blinkit
group by outlet_type
order by total_sales desc;



















