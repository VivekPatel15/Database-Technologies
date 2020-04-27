   /*
    Vivek Patel
    CSC 453 Section 810
    Assignment 2
    2/03/2019
*/

select name from restaurant where cuisine = 'Indian';
select distinct name from restaurant r, rating s where s.rid = r.rid and s.stars in(4, 5) order by name;
select name from restaurant where rid not in (select rid from rating);
select name from reviewer inner join rating using(vid) where ratingdate is null;
select reviewer.name, restaurant.name from restaurant inner join rating s1 using (rid) inner join rating s2 using (vid) inner join reviewer using (vid)
    where s1.ratingdate < s2.ratingdate and s1.stars < s2.stars;
select name, max(stars) from restaurant inner join rating using (rid) group by rid, name order by name;
select name, (max(stars) - min(stars)) as RatingSpread from restaurant 
    inner join rating using (rid) group by rid, name order by RatingSpread desc, name;
select avg(indian.avgstars) - avg(chinese.avgstars)
    from (select avg(stars) as avgstars from restaurant r inner join rating s on r.rid = s.rid where r.cuisine = 'Indian') indian,
    (select avg(stars) as avgstars from restaurant r inner join rating s on r.rid = s.rid where r.cuisine = 'Chinese') chinese;