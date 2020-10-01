create database assignment
-----imported through table data import wizard
use assignment
set sql_safe_updates=0
    select * from `bajaj auto`
	update `bajaj auto`
    set `Date` =STR_TO_DATE(`Date`, "%d-%M-%Y")
    
    
	update `eicher motors`
    set `Date` =STR_TO_DATE(`Date`, "%d-%M-%Y")
    
	update `hero motocorp`
    set `Date` =STR_TO_DATE(`Date`, "%d-%M-%Y")
    
	update `infosys`
    set `Date` =STR_TO_DATE(`Date`, "%d-%M-%Y")
    
	update `tcs`
    set `Date` =STR_TO_DATE(`Date`, "%d-%M-%Y")
    
	update `tvs motors`
    set `Date` =STR_TO_DATE(`Date`, "%d-%M-%Y")
    
    
-----------------------------------------------------------------------------------------------------------------------------------------


create table bajaj1
select `Date`,`close price`,
avg(`close price`)over (rows between 19 preceding and current row) as averageGrowth20,

avg(`close price`)over (rows between 49 preceding and current row) as averageGrowth50
from `bajaj auto`
where `close price` IS NOT NULL and `Date` IS NOT NULL
select * from bajaj1


create table eicher1
select `Date`,`close price`,
avg(`close price`)over (rows between 19 preceding and current row) as averageGrowth20,
avg(`close price`)over (rows between 49 preceding and current row) as averageGrowth50
from `eicher motors`
where `close price` IS NOT NULL and `Date` IS NOT NULL


create table hero1
select `Date`,`close price`,
avg(`close price`)over (rows between 19 preceding and current row) as averageGrowth20,

avg(`close price`)over (rows between 49 preceding and current row) as averageGrowth50
from `hero motocorp`

where `close price` IS NOT NULL and `Date` IS NOT NULL



create table infosys1
select `date`,`close price`,
avg(`close price`)over (rows between 19 preceding and current row) as averageGrowth20,

avg(`close price`)over (rows between 49 preceding and current row) as averageGrowth50
from `infosys`

where `close price` IS NOT NULL and `Date` IS NOT NULL


create table tcs1
select `date`,`close price`,
avg(`close price`)over (rows between 19 preceding and current row) as averageGrowth20,

avg(`close price`)over (rows between 49 preceding and current row) as averageGrowth50
from `tcs`

where `close price` IS NOT NULL and `Date` IS NOT NULL



create table tvs1
select `date`,`close price`,
avg(`close price`)over (rows between 19 preceding and current row) as averageGrowth20,

avg(`close price`)over (rows between 49 preceding and current row) as averageGrowth50
from `tvs motors`

where `close price` IS NOT NULL and `Date` IS NOT NULL

---------------------------------------------------------------------------------------------------------------------------------------

create table master 
select  b.`date`,b.`close price` as bajaj ,e.`close price` as eicher,h.`close price` as hero,i.`close price` as infosys,t.`close price` as tcs,tm.`close price` as tvs
from `bajaj auto` b
inner join `eicher motors` e on b.`date`=e.`date`
inner join `hero motocorp` h on e.`date`=h.`date`
inner join `infosys` i on h.`date`=i.`date`
inner join `tcs` t on i.`date`=t.`date`
inner join `tvs motors` tm  on t.`date`=tm.`date`

select * from master


------------------------------------------------------------------------------------------------------------------------------------------------------
use assignment

CREATE TABLE `bajaj2` AS
	SELECT 
    `Date`,
    `Close Price`,
    (CASE
		WHEN ROW_NUMBER() OVER(ORDER BY `Date`) < 50 THEN "Hold"
        WHEN LAG(`averageGrowth20`,1) OVER(ORDER BY `Date`) > LAG(`averageGrowth50`,1) OVER(ORDER BY `Date`) AND `averageGrowth20` < `averageGrowth50` THEN "Sell"
        WHEN LAG(`averageGrowth20`,1) OVER(ORDER BY `Date`) < LAG(`averageGrowth50`,1) OVER(ORDER BY `Date`) AND `averageGrowth20` > `averageGrowth50` THEN "Buy"
        ELSE "Hold"
	END) AS `Signal`
    FROM `bajaj1`;
    select * from bajaj2



CREATE TABLE `eicher2` AS
	SELECT 
    `Date`,
    `Close Price`,
    (CASE
		WHEN ROW_NUMBER() OVER(ORDER BY `Date`) < 50 THEN "Hold"
        WHEN LAG(`averageGrowth20`,1) OVER(ORDER BY `Date`) > LAG(`averageGrowth50`,1) OVER(ORDER BY `Date`) AND `averageGrowth20` < `averageGrowth50` THEN "Sell"
        WHEN LAG(`averageGrowth20`,1) OVER(ORDER BY `Date`) < LAG(`averageGrowth50`,1) OVER(ORDER BY `Date`) AND `averageGrowth20` > `averageGrowth50` THEN "Buy"
        ELSE "Hold"
	END) AS `Signal`
    FROM `eicher1`;





CREATE TABLE `hero2` AS
	SELECT 
    `Date`,
    `Close Price`,
    (CASE
		WHEN ROW_NUMBER() OVER(ORDER BY `Date`) < 50 THEN "Hold"
        WHEN LAG(`averageGrowth20`,1) OVER(ORDER BY `Date`) > LAG(`averageGrowth50`,1) OVER(ORDER BY `Date`) AND `averageGrowth20` < `averageGrowth50` THEN "Sell"
        WHEN LAG(`averageGrowth20`,1) OVER(ORDER BY `Date`) < LAG(`averageGrowth50`,1) OVER(ORDER BY `Date`) AND `averageGrowth20` > `averageGrowth50` THEN "Buy"
        ELSE "Hold"
	END) AS `Signal`
    FROM `hero1`;




CREATE TABLE `infosys2` AS
	SELECT 
    `Date`,
    `Close Price`,
    (CASE
		WHEN ROW_NUMBER() OVER(ORDER BY `Date`) < 50 THEN "Hold"
        WHEN LAG(`averageGrowth20`,1) OVER(ORDER BY `Date`) > LAG(`averageGrowth50`,1) OVER(ORDER BY `Date`) AND `averageGrowth20` < `averageGrowth50` THEN "Sell"
        WHEN LAG(`averageGrowth20`,1) OVER(ORDER BY `Date`) < LAG(`averageGrowth50`,1) OVER(ORDER BY `Date`) AND `averageGrowth20` > `averageGrowth50` THEN "Buy"
        ELSE "Hold"
	END) AS `Signal`
    FROM `infosys1`;





CREATE TABLE `tcs2` AS
	SELECT 
    `Date`,
    `Close Price`,
    (CASE
		WHEN ROW_NUMBER() OVER(ORDER BY `Date`) < 50 THEN "Hold"
        WHEN LAG(`averageGrowth20`,1) OVER(ORDER BY `Date`) > LAG(`averageGrowth50`,1) OVER(ORDER BY `Date`) AND `averageGrowth20` < `averageGrowth50` THEN "Sell"
        WHEN LAG(`averageGrowth20`,1) OVER(ORDER BY `Date`) < LAG(`averageGrowth50`,1) OVER(ORDER BY `Date`) AND `averageGrowth20` > `averageGrowth50` THEN "Buy"
        ELSE "Hold"
	END) AS `Signal`
    FROM `tcs1`;



CREATE TABLE `tvs2` AS
	SELECT 
    `Date`,
    `Close Price`,
    (CASE
		WHEN ROW_NUMBER() OVER(ORDER BY `Date`) < 50 THEN "Hold"
        WHEN LAG(`averageGrowth20`,1) OVER(ORDER BY `Date`) > LAG(`averageGrowth50`,1) OVER(ORDER BY `Date`) AND `averageGrowth20` < `averageGrowth50` THEN "Sell"
        WHEN LAG(`averageGrowth20`,1) OVER(ORDER BY `Date`) < LAG(`averageGrowth50`,1) OVER(ORDER BY `Date`) AND `averageGrowth20` > `averageGrowth50` THEN "Buy"
        ELSE "Hold"
	END) AS `Signal`
    FROM `tvs1`;


-------------------------------------------------------------------------------------------------------------------------------------




DELIMITER $$
create function bajaj_(input_date date) 
  returns varchar(20)
  deterministic
begin
return (SELECT `Signal` FROM `bajaj2` where `Date` = input_date);
end $$
DELIMITER ;

select * from bajaj2


------------------------------------------------------------------------------------------------------------------------------------





