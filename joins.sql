

select movie_id , title , language_id ,name

from movies m
 left join 
languages l
using(language_id)

union 

select movie_id , title , language_id ,name

from movies m
 right join 
languages l
using(language_id);




select l.name as languagename, count(m . movie_id) as no_of_mov 
from movies m 
left join languages l on m.language_id = l.language_id
group by (l. name)

order by no_of_mov;



select * from moviesdb.movies
cross join moviesdb.financials;


select m.movie_id , title,budget,revenue,currency, unit , 

 CASE 
   WHEN unit = "thousands" THEN ROUND((revenue- budget)/1000,1)
   WHEN unit = "billions" THEN ROUND((revenue- budget)*1000,1)
   ELSE ROUND(revenue - budget,1)
  
   
  END  as profit_mln


from movies m 
join financials l 
ON m.movie_id = l.movie_id
where industry = "bollywood"
order by profit_mln desc ;


select m.title, group_concat(a.name) as actors
from movies m
join movie_actor ma ON m.movie_id = ma.movie_id
join actors a on ma.actor_id = a. actor_id

group by m.movie_id
;




select 
a.name , group_concat( m.title separator "| ")as movies,
count(m.title) as movie_count
from 
actors a 
join movie_actor ma on ma.actor_id = a.actor_id
join movies m on m.movie_id = ma.movie_id
group by a.actor_id
order by movie_count desc;





select 
m.title, f.revenue , f.currency , f.unit,l.name

from movies m
join languages l on m.language_id = l.language_id

join financials f on f.movie_id = m.movie_id


;





