    /*
    Vivek Patel
    CSC 453 Section 810
    Assignment 2
    2/03/2019
*/
    select distinct rentalcompany from bycar where (mileage >= 27);
    select tid from trips where (travelmode = 'Train' and fare > 150);
    select tid, fare from trips where tripstate = 'Non-US';
    select distinct byplane.tid from trips, byplane where byplane.class = 'Business' and trips.fare > 1000;
    select tid from trips where travelmode = 'Car' and fare > any (select fare from trips where travelmode = 'Train');
    select tid1.tid, tid2.tid 
        from (select * from bycar) tid1 inner join (select * from bycar) tid2 on tid1.mileage = tid2.mileage
        where tid1.tid < tid2.tid order by tid1.tid;
    select tid1.tid, tid2.tid 
        from (select * from bytrain) tid1 inner join (select * from bytrain) tid2 on tid1.trainspeed != tid2.trainspeed
        where tid1.tid < tid2.tid order by tid1.tid;
    select tid1.tid, tid2.tid 
        from (select * from trips) tid1 inner join (select * from trips) tid2 
        on tid1.tripstate = tid2.tripstate and tid1.travelmode = tid2.travelmode
        where tid1.tid < tid2.tid order by tid1.tid;
    select distinct t1.tripstate from trips t1, trips t2, trips t3 
        where (t1.tid < t2.tid and t2.tid < t3.tid)
        and (t1.tripstate = t2.tripstate and t2.tripstate = t3.tripstate) 
        and (t1.travelmode != t2.travelmode and t2.travelmode != t3.travelmode);
    select tid from trips minus select t1.tid from trips t1, trips t2 where t1.fare != t2.fare and t1.fare < t2.fare;
    select tid from trips minus select t1.tid from trips t1, trips t2 where t1.fare != t2.fare and t1.fare > t2.fare;
    