use sakila;

-- Task 1 
select concat(first_name,' ',last_name) as Full_Name from actor;


-- Task 2 (i)
select first_name,count(first_name) as no_of_count from actor group by first_name;

-- Task 2 (ii)
select count(*) as actor_count from (select first_name from actor group by first_name having count(*) =1) as a;
select first_name from actor group by first_name having count(*) =1;


-- Task 3 (i)
select last_name, count(last_name) as no_of_count from actor group by last_name;

-- Task 3 (ii)
select last_name from actor group by last_name having count(*) =1;


-- Task 4 (i)
select * from film where rating = 'R';

-- Task 4 (ii)
select * from film where rating != 'R';

-- Task 4 (iii)
select * from film where rating = 'PG-13';


-- Task 5 (i)
select * from film where replacement_cost <= 11;

-- Task 5 (ii)
select * from film where replacement_cost between 11 and 20;

-- Task 5 (iii)
select * from film order by replacement_cost desc;


-- Task 6
select film.title , count(film_actor.actor_id) as no_of_actor from film join film_actor on film.film_id=film_actor.film_id group by film.title order by no_of_actor desc limit 3; 


-- Task 7
select title from film where title like 'K%' or title like 'Q%';


-- Task 8
select concat(first_name,' ',last_name) as actors from actor where actor_id in (select actor_id from film_actor where film_id in (select film_id from film where title = 'AGENT TRUMAN'));


-- Task 9
select title from film where film_id in (select film_id from film_category where category_id in (select category_id from category where name = 'Family'));


-- Task 10 (i)
select rating, avg(rental_rate) as average_rental, min(rental_rate) as minimun_rental, max(rental_rate) as maximum_rental from film group by rating order by average_rental desc;

-- Task 10 (ii)
select title,rental_duration from film order by rental_duration desc;


-- Task 11
select avg(replacement_cost)-avg(rental_rate) as difference,category.name from film  join film_category on
film.film_id=film_category.film_id join category on category.category_id=film_category.category_id group by category.name
having difference > 15; -- we can see that all the film_category fall in this category

select category.name , avg(replacement_cost) as avg_replacemnt,avg(rental_rate) as avg_rental from film join film_category on
film.film_id=film_category.film_id join category on film_category.category_id=category.category_id group by category.name;


-- Task 12
select category.name,count(title) as no_of_films from film join film_category on film.film_id=film_category.film_id join category on
film_category.category_id=category.category_id group by category.name having count(*)>70;





