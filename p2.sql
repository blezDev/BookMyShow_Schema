SELECT
    c.cinema_name,
    m.movie_name,
    mst.show_time
FROM
    cinema c
        JOIN
    movie_showing_time mst ON c.cinema_id = mst.cinema_id
        JOIN
    movie m ON mst.movie_id = m.movie_id
WHERE
    mst.date = '2020-01-01' and c.cinema_name = 'CELEBRATION' -- Specify the date and cinema name
ORDER BY
    mst.show_time;