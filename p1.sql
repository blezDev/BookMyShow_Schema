create database if not exists book_my_show;

use book_my_show;

-- creates table for cinema
create table cinema(
                       cinema_id int primary key,
                       cinema_name varchar(50)
);

insert into cinema values
                       (1, 'PVR'),
                       (2, 'CELEBRATION'),
                       (3, 'Cinepolis'),
                       (4, 'INOX'),
                       (5, 'Carnival');

-- creates table for cinema_location
create table cinema_location(
                                location_id int primary key,
                                city varchar(50),
                                state varchar(50),
                                pin_code varchar(10),
                                cinema_id int,
                                foreign key (cinema_id) references cinema(cinema_id)
);

insert into cinema_location values
                                (1, 'Bangalore', 'Karnataka', '560001', 1),
                                (2, 'Hyderabad', 'Telangana', '500001', 2),
                                (3, 'Pune', 'Maharashtra', '111045', 3);

-- creates table for movie
create table movie(
                      movie_id int primary key,
                      movie_name varchar(50),
                      movie_category varchar(50)
);

insert into movie values
                      (1, 'Your Name', 'U'),
                      (2, 'Joker', 'U'),
                      (3, '3 Idiots', 'U'),
                      (4, 'Martin', 'UA'),
                      (5, 'Solo Leveling', 'UA');

-- create table for cinema_movie (junction table)
CREATE TABLE cinema_movie (
                              cinema_id INT,
                              movie_id INT,
                              PRIMARY KEY (cinema_id, movie_id),
                              FOREIGN KEY (cinema_id) REFERENCES cinema(cinema_id),
                              FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

INSERT INTO cinema_movie VALUES
                             (1, 1),
                             (2, 2),
                             (3, 3),
                             (1, 4),
                             (2, 5),
                             (1,3),
                             (2,1),
                             (3,5);
-- create table for movie_language
create table movie_language(
                               language_id int primary key,
                               language varchar(50),
                               movie_id int,
                               foreign key (movie_id) references movie(movie_id)
);

insert into movie_language values
                               (1, 'Hindi', 1),
                               (2, 'English', 2),
                               (3, 'Hindi', 3),
                               (4, 'Hindi', 4),
                               (5, 'Japanese', 5);

-- create table for movie_format
create table movie_format(
                             format_id int primary key,
                             format varchar(50),
                             movie_id int,
                             foreign key (movie_id) references movie(movie_id)
);

insert into movie_format values
                             (1, '2D', 1),
                             (2, '3D', 2),
                             (3, '2D', 3),
                             (4, '2D', 4),
                             (5, '2D', 5);

-- creates table for movie_showing_time
create table movie_showing_time(
                                   time_id int primary key,
                                   movie_id int,
                                   cinema_id int,
                                   date date,
                                   show_time time,
                                   foreign key (movie_id) references movie(movie_id),
                                   foreign key (cinema_id) references cinema(cinema_id)
);

insert into movie_showing_time values
                                   (1, 1, 1, '2020-01-01','10:00:00'),
                                   (2, 2, 2, '2020-01-01','12:00:00'),
                                   (3, 3, 3, '2020-01-01','14:00:00'),
                                   (4, 4, 1, '2020-01-01','16:00:00'),
                                   (5, 5, 2, '2020-01-01','18:00:00'),
                                   (6, 1, 1, '2020-01-01','20:00:00'),
                                   (7, 2, 2, '2020-01-01','22:00:00'),
                                   (8, 3, 3, '2020-01-01','00:00:00'),
                                   (9, 4, 1, '2020-01-02','16:00:00'),
                                   (10, 5, 2, '2020-01-02','18:00:00');
