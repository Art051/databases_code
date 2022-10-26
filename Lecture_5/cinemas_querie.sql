-- SELECT film.film_num, film.film_name, cinema.cinema_num, cinema.cinema_name, takings.takings
-- from film
-- left join takings on takings.film_num = film.film_num
-- left join cinema on cinema.cinema_num = takings.cinema_num;

SELECT film.film_num, film.film_name, cinema.cinema_num, cinema.cinem_name, town.population, manager.manager_num, manager.manager_name, takings.takings
FROM film, cinema, town, manager, takings
JOIN film.film_num on taking.film_num AND
JOIN takings.cinema_num on cinema.cinema_num AND
JOIN towns.town_name on cinema.town_name AND
JOIN manager.manager_num on cinema.manager_num;