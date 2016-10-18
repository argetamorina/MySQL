-- 1. What query would you run to get all the customers inside city_id = 312? Your query should return customer first name, last name, email, and address.
select sakila.address.city_id, sakila.city.city, sakila.customer.first_name, sakila.customer.last_name, sakila.customer.email, sakila.address.address
from sakila.customer 
	inner join sakila.address 
    on sakila.customer.address_id = sakila.address.address_id
    left join sakila.city 
    on sakila.address.city_id = sakila.city.city_id
    where sakila.city.city_id = 312;

-- 2. What query would you run to get all comedy films? Your query should return film title, description, release year, rating, special features, and genre.

select sakila.film.film_id, sakila.film.title, sakila.film.description, sakila.film.description, sakila.film.release_year, sakila.film.rating, sakila.film.special_features, sakila.category.name
from sakila.film_category
	inner join sakila.film
    on sakila.film_category.film_id = sakila.film.film_id
    left join sakila.category
    on sakila.film_category.category_id = sakila.category.category_id
    where sakila.category.category_id = 5;
    
-- 3. What query would you run to get all the films joined by actor_id=5? Your query should return the film title, description, and release year.
select sakila.film_actor.actor_id, sakila.actor.first_name, sakila.actor.last_name, sakila.film.title, sakila.film.description, sakila.film.release_year 
from film_actor
	inner join sakila.film
    on sakila.film_actor.film_id = sakila.film.film_id
    left join sakila.actor
    on sakila.film_actor.actor_id = sakila.actor.actor_id
where sakila.film_actor.actor_id = 5;

-- 4. What query would you run to get all the customers in store_id = 1 and inside these cities (1, 42, 312 and 459)? Your query should return customer first name, last name, email, and address.
-- [Todd] Another way to accomplish the city_id WHERE clause is to use the keyword 'IN'
-- ... where sakila.customer.stored_id = 1 and sakila.city.city_id IN (1, 42, 312, 459)
select sakila.customer.first_name, sakila.customer.last_name, sakila.customer.email, sakila.address.address 
from customer
	inner join sakila.address
    on sakila.customer.address_id = sakila.address.address_id
    left join sakila.city
    on sakila.address.city_id = sakila.city.city_id
where sakila.customer.store_id = 1 and ( sakila.city.city_id = 1 or sakila.city.city_id = 42 or sakila.city.city_id = 312 or sakila.city.city_id = 459);

-- 5. What query would you run to get all the films with a "rating = G" and "special feature = behind the scenes", joined by actor_id = 15? Your query should return the film title, description, release year, rate, and special feature. Hint: You may use LIKE function in getting the 'behind the scenes' part.

select sakila.film.title, sakila.film.description, sakila.film.rating, sakila.film.release_year, sakila.film.special_features
from film_actor
	inner join sakila.film
    on sakila.film_actor.film_id = sakila.film.film_id 
    left join sakila.actor
    on sakila.film_actor.actor_id = sakila.actor.actor_id
    where rating = 'G' and special_features like 'behind the scenes' and sakila.actor.actor_id = 15;
    
 -- 6. What query would you run to get all the actors that joined in the film_id = 369? Your query should return the film_id, title, actor_id, and actor_name.
 
 select sakila.film_actor.film_id, sakila.film.title, sakila.film_actor.actor_id, sakila.actor.first_name
 from film_actor
	inner join sakila.film
    on sakila.film_actor.film_id = sakila.film.film_id
    left join sakila.actor
    on sakila.film_actor.actor_id = sakila.actor.actor_id
 where sakila.film_actor.film_id = 369;
 
 -- 7. What query would you run to get all drama films with a rental rate of 2.99? Your query should return film title, description, release year, rating, special features, and genre.
 
 select sakila.film.film_id, sakila.film.title, sakila.film.description, sakila.film.release_year, sakila.film.rating, sakila.film.special_features, sakila.category.name, sakila.film.rental_rate
 from sakila.film_category
	inner join sakila.film
    on sakila.film_category.film_id = sakila.film.film_id
    left join sakila.category
    on sakila.film_category.category_id = sakila.category.category_id
 where sakila.film.rental_rate = 2.99 and sakila.category.name like 'drama';
 
 -- 8.What query would you run to get all the action films which are joined by SANDRA KILMER? Your query should return film title, description, release year, rating, special features, genre, and actor's first name and last name.
 
select sakila.film.title, sakila.film.description, sakila.film.release_year, sakila.film.rating, sakila.film.special_features, sakila.category.name, sakila.actor.first_name, sakila.actor.last_name
from film_actor
	inner join sakila.film
    on sakila.film_actor.film_id = sakila.film.film_id
    left join sakila.category
    on sakila.film.film_id = sakila.category.category_id
    left join sakila.actor
    on sakila.film_actor.actor_id = sakila.actor.actor_id
where sakila.actor.actor_id = 23;
 
