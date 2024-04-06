use Akshat_task1;
create table actor (
	act_id int primary key identity(101,1),
	act_fname varchar(45),
	act_lname varchar(45),
	act_gender char(1)
)

create table genre (
	gen_id int primary key identity(1001,1),
	gen_title varchar(45)
)

create table director (
	dir_id int identity(201,1) primary key, 
	dir_fname varchar(45),
	dir_lname varchar(45)
)

create table movie (
	mov_id int  identity(901,1) primary key,
	mov_title varchar(45),
	mov_year int,
	mov_time int,
	mov_lang varchar(20),
	mov_dt_rel date,
	mov_release_country char(10)
)

create table movie_genres (
	mov_id int foreign key references movie(mov_id),
	gen_id int foreign key references genre(gen_id)
)

create table movie_direction (
	dir_id int foreign key references director(dir_id),
	mov_id int foreign key references movie (mov_id)
)

create table reviewer (
	rev_id int primary key identity(9001,1),
	rev_name varchar(45)
)

create table rating (
	mov_id int foreign key references movie(mov_id),
	rev_id int foreign key references reviewer(rev_id),
	rev_stars float,
	mum_o_rating int
)

create table movie_cast (
	act_id int foreign key references actor(act_id),
	mov_id int foreign key references movie(mov_id),
	role varchar(45)
)
-- insert record in movie
INSERT INTO movie (mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_release_country)
VALUES
    ('Vertigo', 1958, 128, 'English', '1958-08-24', 'UK'),
    ('The Innocents', 1961, 100, 'English', '1962-02-19', 'SW'),
    ('Lawrence of Arabia', 1962, 216, 'English', '1962-12-11', 'UK'),
    ('The Deer Hunter', 1978, 183, 'English', '1979-03-08', 'UK'),
    ('Amadeus', 1984, 160, 'English', '1985-01-07', 'UK'),
    ('Blade Runner', 1982, 117, 'English', '1982-09-09', 'UK'),
    ('Eyes Wide Shut', 1999, 159, 'English', NULL, 'UK'),
    ('The Usual Suspects', 1995, 106, 'English', '1995-08-25', 'UK'),
    ('Chinatown', 1974, 130, 'English', '1974-08-09', 'UK'),
    ('Boogie Nights', 1997, 155, 'English', '1998-02-16', 'UK'),
    ('Annie Hall', 1977, 93, 'English', '1977-04-20', 'USA'),
    ('Princess Mononoke', 1997, 134, 'Japanese', '2001-10-19', 'UK'),
    ('The Shawshank Redemption', 1994, 142, 'English', '1995-02-17', 'UK'),
    ('American Beauty', 1999, 122, 'English', NULL, 'UK'),
    ('Titanic', 1997, 194, 'English', '1998-01-23', 'UK'),
    ('Good Will Hunting', 1997, 126, 'English', '1998-06-03', 'UK'),
    ('Deliverance', 1972, 109, 'English', '1982-10-05', 'UK'),
    ('Trainspotting', 1996, 94, 'English', '1996-02-23', 'UK'),
    ('The Prestige', 2006, 130, 'English', '2006-11-10', 'UK'),
    ('Donnie Darko', 2001, 113, 'English', NULL, 'UK'),
    ('Slumdog Millionaire', 2008, 120, 'English', '2009-01-09', 'UK'),
    ('Aliens', 1986, 137, 'English', '1986-08-29', 'UK'),
    ('Beyond the Sea', 2004, 118, 'English', '2004-11-26', 'UK'),
    ('Avatar', 2009, 162, 'English', '2009-12-17', 'UK'),
    ('Seven Samurai', 1954, 207, 'Japanese', '1954-04-26', 'JP'),
    ('Spirited Away', 2001, 125, 'Japanese', '2003-09-12', 'UK'),
    ('Back to the Future', 1985, 116, 'English', '1985-12-04', 'UK'),
    ('Braveheart', 1995, 178, 'English', '1995-09-08', 'UK');

-- insert records in actor
INSERT INTO actor (act_fname, act_lname, act_gender)
VALUES
    ('James', 'Stewart', 'M'),
    ('Deborah', 'Kerr', 'F'),
    ('Peter', 'OToole', 'M'),
    ('Robert', 'De Niro', 'M'),
    ('F. Murray', 'Abraham', 'M'),
    ('Harrison', 'Ford', 'M'),
    ('Nicole', 'Kidman', 'F'),
    ('Stephen', 'Baldwin', 'M'),
    ('Jack', 'Nicholson', 'M'),
    ('Mark', 'Wahlberg', 'M'),
    ('Woody', 'Allen', 'M'),
    ('Claire', 'Danes', 'F'),
    ('Tim', 'Robbins', 'M'),
    ('Kevin', 'Spacey', 'M'),
    ('Kate', 'Winslet', 'F'),
    ('Robin', 'Williams', 'M'),
    ('Jon', 'Voight', 'M'),
    ('Ewan', 'McGregor', 'M'),
    ('Christian', 'Bale', 'M'),
    ('Maggie', 'Gyllenhaal', 'F'),
    ('Dev', 'Patel', 'M'),
    ('Sigourney', 'Weaver', 'F'),
    ('David', 'Aston', 'M'),
    ('Ali', 'Astin', 'F');

-- inser records in director
INSERT INTO director (dir_fname, dir_lname)
VALUES
    ('Alfred', 'Hitchcock'),
    ('Jack', 'Clayton'),
    ('David', 'Lean'),
    ('Michael', 'Cimino'),
    ('Milos', 'Forman'),
    ('Ridley', 'Scott'),
    ('Stanley', 'Kubrick'),
    ('Bryan', 'Singer'),
    ('Roman', 'Polanski'),
    ('Paul', 'Thomas Anderson'),
    ('Woody', 'Allen'),
    ('Hayao', 'Miyazaki'),
    ('Frank', 'Darabont'),
    ('Sam', 'Mendes'),
    ('James', 'Cameron'),
    ('Gus', 'Van Sant'),
    ('John', 'Boorman'),
    ('Danny', 'Boyle'),
    ('Christopher', 'Nolan'),
    ('Richard', 'Kelly'),
    ('Kevin', 'Spacey'),
    ('Andrei', 'Tarkovsky'),
    ('Peter', 'Jackson');

-- inser the record in movie_direction
INSERT INTO movie_direction (dir_id, mov_id)
VALUES
    (201, 901),
    (202, 902),
    (203, 903),
    (204, 904),
    (205, 905),
    (206, 906),
    (207, 907),
    (208, 908),
    (209, 909),
    (210, 910),
    (211, 911),
    (212, 912),
    (213, 913),
    (214, 914),
    (215, 915),
    (216, 916),
    (217, 917),
    (218, 918),
    (219, 919),
    (220, 920),
    (218, 921),
    (215, 922),
    (221, 923);

-- insert records in movie-genre
INSERT INTO movie_cast(act_id, mov_id, role)
VALUES
    (101, 901, 'John Scottie Ferguson'),
    (102, 902, 'Miss Giddens'),
    (103, 903, 'T.E. Lawrence'),
    (104, 904, 'Michael'),
    (105, 905, 'Antonio Salieri'),
    (106, 906, 'Rick Deckard'),
    (107, 907, 'Alice Harford'),
    (108, 908, 'McManus'),
    (110, 910, 'Eddie Adams'),
    (111, 911, 'Alvy Singer'),
    (112, 912, 'San'),
    (113, 913, 'Andy Dufresne'),
    (114, 914, 'Lester Burnham'),
    (115, 915, 'Rose DeWitt Bukater'),
    (116, 916, 'Sean Maguire'),
    (117, 917, 'Ed'),
    (118, 918, 'Renton'),
    (120, 920, 'Elizabeth Darko'),
    (121, 921, 'Older Jamal'),
    (122, 922, 'Ripley'),
    (114, 923, 'Bobby Darin'),
    (109, 909, 'J.J. Gittes'),
    (119, 919, 'Alfred Borden');

-- insert record in genre
INSERT INTO genre(gen_title)
VALUES
    ('Action'),
    ('Adventure'),
    ('Animation'),
    ('Biography'),
    ('Comedy'),
    ('Crime'),
    ('Drama'),
    ('Horror'),
    ('Music'),
    ('Mystery'),
    ('Romance'),
    ('Thriller'),
    ('War');

-- insert into movie_genre
INSERT INTO movie_genres (mov_id, gen_id)
VALUES
    (922, 1001),
    (917, 1002),
    (903, 1002),
    (912, 1003),
    (911, 1005),
    (908, 1006),
    (913, 1006),
    (926, 1007),
    (928, 1007),
    (918, 1007),
    (921, 1007),
    (902, 1008),
    (923, 1009),
    (907, 1010),
    (927, 1010),
    (901, 1010),
    (914, 1011),
    (906, 1012),
    (904, 1013);

-- insert into reviewer:
INSERT INTO reviewer (rev_name)
VALUES
    ('Righty Sock'),
    ('Jack Malvern'),
    ('Flagrant Baronessa'),
    ('Alec Shaw'),
    (null),
    ('Victor Woeltjen'),
    ('Simon Wright'),
    ('Neal Wruck'),
    ('Paul Monks'),
    ('Mike Salvati'),
    (null),
    ('Wesley S. Walker'),
    ('Sasha Goldshtein'),
    ('Josh Cates'),
    ('Krug Stillo'),
    ('Scott LeBrun'),
    ('Hannah Steele'),
    ('Vincent Cadena'),
    ('Brandt Sponseller'),
    ('Richard Adams');

--insert records in rating 
INSERT INTO rating 
VALUES
    (901, 9001, 8.40, 263575),
    (902, 9002, 7.90, 20207),
    (903, 9003, 8.30, 202778),
    (906, 9005, 8.20, 484746),
    (924, 9006, 7.30, NULL),
    (908, 9007, 8.60, 779489),
    (909, 9008, NULL, 227235),
    (910, 9009, 3.00, 195961),
    (911, 9010, 8.10, 203875),
    (912, 9011, 8.40, NULL),
    (914, 9013, 7.00, 862618),
    (915, 9001, 7.70, 830095),
    (916, 9014, 4.00, 642132),
    (925, 9015, 7.70, 81328),
    (918, 9016, NULL, 580301),
    (920, 9017, 8.10, 609451),
    (921, 9018, 8.00, 667758),
    (922, 9019, 8.40, 511613),
    (923, 9020, 6.70, 13091);



-- 1) From the following table, write a SQL query to find the name and year of the movies. Return movie title, movie release year
 select mov_title , mov_dt_rel from movie;

 -- 2) From the following table, write a SQL query to find when the movie specific released. Return movie release year
 select  year(mov_dt_rel) from movie where mov_title = 'The Innocents';

 -- 3) From the following table, write a SQL query to find the movie that was released in 1999. Return movie title.
 select mov_title from movie where mov_year = 1999;

 -- 4) From the following table, write a SQL query to find those movies, which were released before 1998. Return movie title.
  select mov_title from movie where mov_year < 1998;

-- 5) From the following tables, write a SQL query to find the name of all reviewers and movies together in a single list.
select m.mov_title ,r.rev_name from rating as rt inner join movie as m on m.mov_id = rt.mov_id
inner join reviewer as r on rt.rev_id = r.rev_id;

-- 6) From the following table, write a SQL query to find all reviewers who have rated seven or more stars to their rating. Return reviewer name.
select r.rev_name from reviewer as r inner join rating as rt on rt.rev_id = r.rev_id;

-- 7) From the following tables, write a SQL query to find the movies without any rating. Return movie title.
select m.mov_title from movie as m left join rating as rt on rt.mov_id = m.mov_id
where rt.rev_stars is null;


-- 8)  From the following table, write a SQL query to find the movies with ID 905 or 907 or 917. Return movie title.
select mov_title from movie where mov_id in (905,907,917);

-- 9) From the following table, write a SQL query to find the movie titles that contain the specific word.  Sort the result-set in ascending order by movie year. Return movie ID, movie title and movie release year. 
select mov_id,mov_title,mov_dt_rel from movie where mov_title like '% the %' order by mov_dt_rel;

-- 10) From the following table, write a SQL query to find those actors with the first name 'Woody' and the last name 'Allen'. Return actor ID
select act_id from actor where act_fname ='Woody' and act_lname = 'Allen';

-- 11) get directors who have directed movies with avrage rating higher then 5
select avg(rt.rev_stars) as Rating ,concat(dir_fname,dir_lname) as Director_name from movie as m  
inner join rating as rt on rt.mov_id = m.mov_id
inner join movie_direction as md on md.mov_id = m.mov_id
inner join director as d on md.dir_id = d.dir_id
group by d.dir_id,d.dir_fname,d.dir_lname having avg(rt.rev_stars) > 5;


-- 12)  get all actors who have worked for movies that were directed by specific director
select concat(act_fname ,' ', act_lname) as ACT_NAME from actor as a
inner join movie_cast  as m on m.act_id = a.act_id 
inner join movie_direction as md on md.mov_id = m.mov_id
inner join director as d on d.dir_id = md.dir_id 
where d.dir_fname = 'kevin';


-- 13) create a stored proc to get list of movies which is 3 years old and having rating greater than 5
--ALTER procedure getmovies as
--BEGIN
--	select m.mov_id,m.mov_title,m.mov_year,m.mov_time,m.mov_lang,m.mov_dt_rel,r.rev_stars from movie as m
--	inner join rating as r on r.mov_id = m.mov_id 
--	where r.rev_stars > 5 and year(getdate()) - m.mov_year > 3;
--END
--exec getmovies;
select m.mov_id,m.mov_title,m.mov_year,m.mov_time,m.mov_lang,m.mov_dt_rel,r.rev_stars from movie as m
	inner join rating as r on r.mov_id = m.mov_id 
	where r.rev_stars > 5 and year(getdate()) - m.mov_year > 3;




-- 14) create a stored proc to get list of all directors who have directed more then 2 movies
--insert into movie_direction values (201,901),(201,901);
--alter procedure Director_list as 
--BEGIN
--	select count(md.mov_id) AS Total_Movies,concat(d.dir_fname , ' ' ,d.dir_lname) as Director_name from director as d inner join 
--	movie_direction as md on md.dir_id = d.dir_id 
--	group by md.mov_id,d.dir_fname,d.dir_lname having count(md.mov_id) > 2
--END;

--exec Director_list;
select count(md.mov_id) AS Total_Movies,concat(d.dir_fname , ' ' ,d.dir_lname) as Director_name from director as d inner join 
	movie_direction as md on md.dir_id = d.dir_id 
	group by md.mov_id,d.dir_fname,d.dir_lname having count(md.mov_id) > 2;


-- 15) create a stored proc to get list of all directors which have directed a movie which have rating greater than 3.
--Alter procedure Director_with_Rating as 
--BEGIN 
--	select concat(d.dir_fname , ' ' ,d.dir_lname ),r.rev_stars as Director_name from movie_direction as md
--	inner join rating as r on r.mov_id = md.mov_id
--	inner join director as d on d.dir_id = md.dir_id
--	group by r.rev_stars,d.dir_fname,d.dir_lname having r.rev_stars > 3;
--END;
--exec Director_with_Rating;
--select * from director;
--select * from rating;
select concat(d.dir_fname , ' ' ,d.dir_lname ),r.rev_stars as Director_name from movie_direction as md
	inner join rating as r on r.mov_id = md.mov_id
	inner join director as d on d.dir_id = md.dir_id
	group by r.rev_stars,d.dir_fname,d.dir_lname having r.rev_stars > 3;


-- 16) create a function to get worst director according to movie rating
--alter function worst_director_among_all() 
--returns  table as
--return(
--	select 	top 1 concat(d.dir_fname , ' ' ,d.dir_lname )as Directorname,min(r.rev_stars) as reviewer_stars from movie_direction as md
--	inner join rating as r on r.mov_id = md.mov_id
--	inner join director as d on d.dir_id = md.dir_id
--	group by r.rev_stars,d.dir_fname,d.dir_lname

--);
--select * from worst_director_among_all();
select top 1   concat(d.dir_fname , ' ' ,d.dir_lname) as Director_fullName,r.rev_stars from rating as r inner join movie_direction as md on
md.mov_id = r.mov_id inner join director as d on
d.dir_id = md.dir_id order by r.rev_stars;


-- 17) create a function to get worst actor according to movie rating
select  top 1  concat(a.act_fname , ' ' ,a.act_lname) as Actor_fullName,r.rev_stars from rating as r inner join movie_cast as mvc on
mvc.mov_id = r.mov_id inner join actor as a  on
a.act_id = mvc.act_id order by r.rev_stars;

-- 18) create a parameterized stored procedure which accept genre and give movie accordingly 
--Alter procedure Return_movie_by_gener @genre varchar(45) as 
--BEGIN
--	select m.mov_title from genre as g inner join movie_genres as mg on
--	mg.gen_id = g.gen_id inner join movie as m on
--	mg.mov_id = m.mov_id where g.gen_title = @genre
--END;

--exec Return_movie_by_gener @genre = 'Adventure';
select m.mov_title from genre as g inner join movie_genres as mg on
	mg.gen_id = g.gen_id inner join movie as m on
	mg.mov_id = m.mov_id where g.gen_title = 'Adventure';

-- 19) get list of movies that start with 'a' and end with letter 'e' and movie released before 2015
--insert into movie values('Ace in the Hole',1951,130,'English','1951-05-11','US');
select mov_title from movie where mov_title like 'a%e' and mov_year < 2015;

-- 20) get a movie with highest movie cast
--insert into movie_cast values(101,901,'Kabir');
select top 1 movie.mov_title as Highest_movie_cast from movie_cast as mvc inner join movie on movie.mov_id = mvc.mov_id
group by movie.mov_title order by mvc.mov_id ;

-- 21)  create a function to get reviewer that has rated highest number of movies.
--update  reviewer set rev_name = 'Tony Stars' where rev_name is null;
select top 1 r.rev_name,count(r.rev_id) as Review from rating as rat inner join reviewer as r on
rat.rev_id = r.rev_id group by r.rev_name,r.rev_id order by count(r.rev_id) desc;

-- 22) From the following tables, write a query in SQL to generate a report, which contain the fields movie title, name of the female actor, year of the movie, role, movie genres, the director, date of release, and rating of that movie.

	SELECT 
    m.mov_title AS movie_title,
    concat(a.act_fname , ' ' , a.act_lname) AS female_actor_name,
    m.mov_year AS year_of_movie,
    mc.role,
    STRING_AGG(g.gen_title, ', ') AS movie_genres,
    concat(d.dir_fname , ' ' , d.dir_lname) AS director_name,
    m.mov_dt_rel AS date_of_release,
    r.rev_stars AS rating_of_movie
FROM 
    movie m
JOIN 
    movie_cast mc ON m.mov_id = mc.mov_id
JOIN 
    actor a ON mc.act_id = a.act_id
JOIN 
    movie_genres mg ON m.mov_id = mg.mov_id
JOIN 
    genre g ON mg.gen_id = g.gen_id
JOIN 
    movie_direction md ON m.mov_id = md.mov_id
JOIN 
    director d ON md.dir_id = d.dir_id
LEFT JOIN 
    rating r ON m.mov_id = r.mov_id
WHERE 
    a.act_gender = 'F'
GROUP BY 
    m.mov_title, a.act_fname, a.act_lname, m.mov_year, mc.role, d.dir_fname, d.dir_lname, m.mov_dt_rel, r.rev_stars
ORDER BY 
    m.mov_title;


-- 23) From the following tables, write a SQL query to find the years when most of the ‘Mystery Movies’ produced. Count the number of generic title and compute their average rating. Group the result set on movie release year, generic title. Return movie year, generic title, number of generic title and average rating.
select m.mov_year , count(g.gen_title) as [Total Generetion Title],avg(rat.rev_stars)
from movie as m join movie_genres as mg on mg.mov_id = m.mov_id
join genre as g on g.gen_id = mg.gen_id
join rating as rat on m.mov_id = rat.mov_id
where g.gen_title = 'Mystery'
group by m.mov_year,g.gen_title

-- 24)  From the following tables, write a SQL query to find the highest-rated ‘Mystery Movies’. Return the title, year, and rating
select top 1 g.gen_title,m.mov_year,rat.rev_stars from genre as g
join movie_genres as mg on g.gen_id = mg.gen_id 
join movie as m on  m.mov_id  = mg.mov_id 
join rating as rat on rat.mov_id = m.mov_id
where g.gen_title = 'Mystery';

-- 25) create a function which accepts genre and suggests best movie according to ratings 
select top 1 m.mov_title,max(rat.rev_stars) from movie as m 
inner join movie_genres as mg on mg.mov_id = m.mov_id
inner join genre as g on mg.gen_id = g.gen_id
inner join rating as rat on m.mov_id = rat.mov_id
where g.gen_title = 'Mystery'
group by m.mov_title , rat.rev_stars 
 order by rat.rev_stars desc ;



-- 26) create a function which accepts genre and suggests best director according to ratings. 
select top 1 concat(d.dir_fname , ' ' , d.dir_lname) as [Director name],AVG(rat.rev_stars) AS avg_rating from director as d
join movie_direction as md on d.dir_id = md.dir_id
join movie as m on m.mov_id = md.mov_id 
join movie_genres as mg on m.mov_id = mg.mov_id 
join genre as g on g.gen_id = mg.gen_id 
left join rating as rat on rat.mov_id = m.mov_id
where g.gen_title = 'Mystery'
 GROUP BY md.dir_id, d.dir_fname, d.dir_lname
 ORDER BY avg_rating DESC;

-- 27) create a function that accepts a genre and give random movie according to genre
select top 1 m.mov_title from movie as m 
join movie_genres as mg on mg.mov_id = m.mov_id 
join genre as g on g.gen_id = mg.gen_id
where g.gen_title = 'Mystery'
order by newid();
   

-------------------------------------------------------------------------------------------Exercise----------------------------------------------------------------------------------------------
--1: List all movies along with their genres:

select m.mov_title,mg.gen_id from movie as m join movie_genres as mg on m.mov_id = mg.mov_id JOIN genre g ON mg.gen_id = g.gen_id;

-- 2 : List all actors who starred in the movie "Vertigo"
select a.* from actor as a join movie_cast as mc  on mc.act_id = a.act_id 
join movie as m on mc.mov_id = m.mov_id
where m.mov_title = 'Vertigo';

-- 3 : List all movies directed by Alfred Hitchcock
select m.* from movie as m join movie_direction as md on md.mov_id = m.mov_id
join director as d on d.dir_id = md.dir_id where d.dir_fname = 'Alfred' and d.dir_lname='Hitchcock';

--4 : List all movies with their directors' full names
select m.*,concat(d.dir_fname,d.dir_lname) as Director_full_Name from movie as m join movie_direction as md on md.mov_id = m.mov_id
join director as d on d.dir_id = md.dir_id ;

-- 5 : List all actors who starred in movies released in the UK
select distinct a.act_fname from actor as a join movie_cast as mc 
on mc.act_id = a.act_id join movie as m on
m.mov_id = mc.mov_id where m.mov_release_country = 'UK';


-- 6 : List all movies with their genres and directors
select m.* ,d.dir_fname,g.gen_title from movie as m join movie_direction as md 
on md.mov_id = m.mov_id join director as d on md.dir_id = d.dir_id 
join movie_genres as mg on mg.mov_id = m.mov_id
join genre as g on g.gen_id = mg.gen_id;

-- 7 : List all reviewers along with the movies they rated
select r.*,m.mov_title,rat.rev_stars from reviewer as r join rating as rat on r.rev_id = rat.rev_id
join movie as m on m.mov_id = rat.mov_id;

-- 8 : List all movies rated by the reviewer "Righty Sock"
select m.*,r.rev_name from movie as m join rating as rat 
on rat.mov_id = m.mov_id join reviewer as r on r.rev_id = rat.rev_id
where r.rev_name = 'Righty Sock';

-- 9 : List all actors who starred in movies directed by Stanley Kubrick
select a.* from actor as a 
join movie_cast as mc on mc.act_id = a.act_id 
join movie as m on m.mov_id = mc.mov_id 
join movie_direction as md on md.mov_id = m.mov_id 
join director as d on d.dir_id = md.dir_id 
where d.dir_fname = 'Stanley' and d.dir_lname = 'Kubrick';

-- 10 : List all movies with their respective languages
select m.* , g.gen_title,m.mov_lang from movie as m 
join movie_genres as mg on mg.mov_id = m.mov_id 
join genre as g on g.gen_id = mg.gen_id;

-- 11 : List all movies with their respective directors and release dates
select m.*,d.dir_fname,m.mov_dt_rel from movie as m join movie_direction as md on md.mov_id = m.mov_id 
join director as d on md.dir_id = d.dir_id;

-- 12 : List all movies along with their average ratings
select m.mov_id,avg(rat.rev_stars) from movie as m join rating as rat 
on rat.mov_id = m.mov_id group by m.mov_id;

-- 13 : List all actors who starred in movies released in the UK after the year 2000
select a.* from actor as a 
join movie_cast as mc on mc.act_id = a.act_id
join movie as m on m.mov_id = mc.mov_id 
where m.mov_release_country = 'UK' AND m.mov_year > 2000;

-- 14 : List all movies with their respective genres and average ratings
select m.mov_id,m.mov_title,g.gen_title,avg(rat.rev_stars) from movie as m 
join rating as rat on rat.mov_id = m.mov_id
join movie_genres as mg on mg.mov_id = m.mov_id 
join genre as g on g.gen_id = mg.gen_id group by m.mov_id,m.mov_title,g.gen_title;

-- 15 : List all movies with their directors and languages where the average rating is above 8
select m.mov_title,concat(d.dir_fname ,' ',d.dir_lname),m.mov_lang,avg(rat.rev_stars) from movie as m
join movie_direction as md on md.mov_id = m.mov_id 
join director as d on d.dir_id = md.dir_id
join rating as rat on rat.mov_id = m.mov_id
group by m.mov_title,d.dir_fname,d.dir_lname,m.mov_lang
having avg(rat.rev_stars)>8;

-- 16 : List all reviewers who rated movies directed by Ridley Scott
select r.* from reviewer as r join rating as rat
on rat.rev_id = r.rev_id join movie as m
on m.mov_id = rat.mov_id join movie_direction as md
on md.mov_id = m.mov_id join director as d
on d.dir_id = md.dir_id where d.dir_fname = 'Ridley' and d.dir_lname = 'Scott';

-- 17 : List all movies along with their genres and the number of ratings received
select m.mov_id,g.gen_title,count(rat.rev_stars) from movie as m 
left join rating as rat on rat.mov_id = m.mov_id
join movie_genres as mg on mg.mov_id = m.mov_id 
join genre as g on mg.gen_id = g.gen_id
group by m.mov_id,g.gen_title

-- 18 : List all movies where Nicole Kidman starred along with their directors
select m.*,concat(a.act_fname ,' ' ,a.act_lname) as Actor_name ,concat(d.dir_fname , ' ' , d.dir_lname) from movie as m
join movie_cast as mc on mc.mov_id = m.mov_id
join actor as a on a.act_id = mc.act_id
join movie_direction as md on md.mov_id = m.mov_id 
join director as d on md.dir_id = d.dir_id
where a.act_fname = 'Nicole' and a.act_lname = 'Kidman';

-- 19 : List all movies released before the year 1990 along with their average ratings
select m.mov_title,avg(rat.rev_stars) from movie as m 
join rating as rat on rat.mov_id = m.mov_id
where m.mov_year < 1990 
group by m.mov_title;


-- 20 : Function to calculate the average rating
create function avg_rating(@mid int)
returns float 
as
begin 
declare @avg_rating float
	select  @avg_rating = avg(rev_stars) from rating join movie on movie.mov_id = @mid
	return @avg_rating
end;

select dbo.avg_rating(901);
select * from movie_direction;

-- 21 : Function to get the total number of movies directed by a given director
create function tot_mov_by_dir (@did int)
returns float 
as
begin 
declare @total float
	select @total=count(m.mov_id) as [Total no. of movies]  from movie as m join movie_direction as md 
	on md.mov_id = m.mov_id join director as d on d.dir_id = md.dir_id
	where d.dir_id = @did
	return @total
end;
select dbo.tot_mov_by_dir(201);

-- 22 : What are the titles of movies directed by Alfred Hitchcock?
select m.* from movie as m join movie_direction as md on md.mov_id = m.mov_id
join director as d on d.dir_id = md.dir_id where d.dir_fname = 'Alfred' and d.dir_lname = 'Hitchcock';

-- 23 : Which movies have not been rated yet
select m.*,r.* from movie as m left join rating as r on r.mov_id = m.mov_id where r.mov_id is null;

-- 24 : Which movies have both a genre and a rating associated with them?
select m.mov_title from movie as m join movie_genres as mg on mg.mov_id = m.mov_id
join rating as r on r.mov_id = m.mov_id;

-- 25 : How many movies have genres associated with them, regardless of whether they have ratings?
select count(distinct m.mov_id) from movie as m join movie_genres as mg on mg.mov_id = m.mov_id;

-- 26 : Which movies have ratings above 8.0, and what are the associated genres?
select m.mov_title, g.gen_title  from rating as rat 
join movie as m on m.mov_id = rat.mov_id 
join movie_genres as mg on mg.mov_id = m.mov_id
join genre as g on mg.gen_id = g.gen_id where rat.rev_stars>8.0;

-- 27 : List the names of actors who have played roles in movies directed by Christopher Nolan.
select a.act_fname, a.act_lname from actor as a 
join movie_cast as mc on a.act_id = mc.act_id 
join movie_direction as md on md.mov_id = mc.mov_id
-- 27 : List the names of actors who have played roles in movies directed by Christopher Nolan.
join director as d on md.dir_id = d.dir_id where d.dir_fname = 'Christopher' and d.dir_lname='Nolan';

-- 28 : Which movies have not been associated with any genre?
select m.mov_title from movie as m left join movie_genres as mg on mg.mov_id = m.mov_id where mg.mov_id is null;

-- 29 : How many movies have been directed by Stanley Kubrick and have received ratings?
select count(m.mov_id) from movie as m  
join movie_direction as md on md.mov_id = m.mov_id 
join rating as rat on rat.mov_id = m.mov_id 
join director as d on md.dir_id = d.dir_id 
where d.dir_fname ='Stanley' and d.dir_lname='Kubrick'

-- 30 :  List the names of all directors, along with the number of movies they have directed.

select d.dir_fname, d.dir_lname ,count(md.mov_id) from director as d left join movie_direction as md 
on md.dir_id = d.dir_id  
group by d.dir_fname,d.dir_lname;

-- 31 :  Which movies have been released in the UK and have ratings below 7.0?
select m.mov_title from movie as m join rating as rat on rat.mov_id = m.mov_id
where rat.rev_stars < 7.0 and m.mov_release_country='UK';

-- 32 : List all movies along with their directors' names.
select m.*,d.dir_fname from movie as m join movie_direction as md 
on m.mov_id = md.mov_id join director as d on md.dir_id = d.dir_id;

-- 33 : Show all reviewers who have given ratings and the movies they rated along with their titles.
select r.rev_name,m.mov_title from reviewer as r 
join rating as rat on rat.rev_id = r.rev_id 
join movie as m on rat.mov_id = m.mov_id;

-- 34 : Display all actors and the roles they played in the movies, including those who didn't play any roles.
select a.* from actor as a left join movie_cast as mc on a.act_id = mc.act_id;

-- 35 : List all movies along with their genres.
select m.mov_title,g.gen_title from movie as m left join movie_genres as mg on m.mov_id = mg.mov_id
left join genre as g on mg.gen_id = g.gen_id;

-- shradhha : Combine multiple tables to retrieve movie titles, genres, and reviewer names.
select m.mov_title,g.gen_title,r.rev_name from movie as m 
 join movie_genres as mg on m.mov_id = mg.mov_id
left join genre as g on mg.gen_id = g.gen_id 
left join rating as rat on rat.mov_id = m.mov_id
left join reviewer as r on r.rev_id = rat.rev_id;

-- 36 : Show all directors and the movies they directed, even if they haven't directed any.
select d.*,md.* from director as d left join movie_direction as md  on d.dir_id = md.dir_id
left join movie as m on md.mov_id = m.mov_id;

-- 37 : Display all actors who appeared in movies and the movies they appeared in, along with their roles.
select a.*,m.mov_title,mc.role from actor as a join movie_cast as mc 
on mc.act_id = a.act_id join movie as m on mc.mov_id = m.mov_id;

-- 38 : Show all movies along with their directors' names, including those without directors listed.
select m.mov_title,d.dir_fname 
from movie as m 
left join movie_direction as md on m.mov_id = md.mov_id  
left join director as d on md.dir_id = d.dir_id;

SELECT mov_title, dir_fname
FROM movie
LEFT JOIN movie_direction ON movie.mov_id = movie_direction.mov_id
RIGHT JOIN director ON movie_direction.dir_id = director.dir_id;

SELECT distinct mov_title, dir_fname
FROM movie
LEFT JOIN movie_direction ON movie.mov_id = movie_direction.mov_id
LEFT JOIN director ON movie_direction.dir_id = director.dir_id
WHERE mov_title IS NOT NULL;

