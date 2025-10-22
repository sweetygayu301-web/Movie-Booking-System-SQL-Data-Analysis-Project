SELECT * FROM project.`mega_data_cleaning_dataset - sheet1`;
SELECT * FROM Movies WHERE YEAR(ReleaseDate) = 2024;
#2.1 Select all columns from the Movies table
select * from Movies;
#2.2 Select only the Title and Genre of all movies
select Title,Genre from Movies;
#2.3 Selecting unique Genres from Movies
select distinct Genre from Movies;
#3.1 SELECT all customers from the city "Chennai".
select * from Customers where City='Chennai';
#3.2 SELECT all bookings where SeatsBooked is greater than 3.
select * from Bookings where SeatsBooked>3;
#3.3 SELECT all payments where Status is "Pending".
select * from Payments where Status='Pending';
#3.4 SELECT all movies released between '2023-01-01' and '2024-01-01'.
select * from Movies where ReleaseDate between '2023-01-01' and '2024-01-01';
#3.5 SELECT all shows with TicketPrice between 200 and 400.
select * from Shows where TicketPrice between 200 and 400;
#3.6 SELECT all customers whose name starts with "C" using LIKE.
select * from Customers where Name LIKE 'C%';
#4.1 SELECT all movies ordered by ReleaseDate ascending.
select * from Movies order by ReleaseDate asc;
#4.2 SELECT all bookings ordered by BookingDate descending.
select * from Bookings order by BookingDate desc;
#5.1 Find total SeatsBooked per customer (Bookings table).
select CustomerID,sum(SeatsBooked) as TotalSeats from Bookings group by CustomerID;
#5.2 Find total Amount paid per customer (Payments table).
select CustomerID,sum(Amount) AS TotalAmount from Payments group by CustomerID;
#5.3 Find the number of bookings for each show.
select ShowID,count(BookingID) as TotalBookings from Bookings group by ShowID;
#6.1 Find customers who booked more than 2 shows.
select CustomerID, COUNT(ShowID) as TotalShows from Bookings group by CustomerID having count(ShowID)>2;
#6.2 Find shows where total seats booked > 10.
select ShowID,sum(SeatsBooked) as TotalSeats from bookings group by ShowId having sum(SeatsBooked)>10;
#7.1 DELETE the booking with BookingID = 5.
delete from Bookings where BookingID=5;
#7.2 DELETE all payments with Status = "Pending" older than '2024-01-01'.
delete from payments where Status='Pending' and PaymentDate<'2024-01-01';
#8.1 SELECT the first 5 customers using LIMIT.
select * from Customers limit 5;
#8.2 SELECT customers skipping the first 5 rows using LIMIT with OFFSET.
select * from Customers limit 5 offset 5;
#9.1 Find all customers who booked a show with TicketPrice > 400.
select * from Cuatomers where CustomerID in(select b.CustomersID from Bookings b join shows s on b.ShowID=s.ShowID where s.TicketPrice>400);
#9.2 Find movies where the total bookings are more than 10 (use a subquery on Bookings).
select * from Movies where MoviesID in(select s.MoviesID from Shows s join Bookings b on s.ShowID=b.ShowID group by s.MoviesID having count(b.BookingID)>10);
#10.1 INNER JOIN Customers and Bookings to show customer name and their bookings.
select c.Name,b.BookingID,b.SeatsBooked from Customers c inner join Bookings b on c.CustomerID=b.CustomerID;
#10.2 LEFT JOIN Shows and Movies to list all shows and their movie titles.
select s.ShowID,m.Title,s.ShowDate from Shows s left join movies m on s.MoviesID=m.MoviesID;
#10.3 RIGHT JOIN Bookings and Payments to show all payments and associated bookings.
select p.PaymentID,b.BookingID,p.Status from Bookings b right join payments p on b.BookingId=p.BookingID;
#10.4 INNER JOIN Shows, Movies, and Theatres to display movie title, theatre name, and show date.
select m.Title,t.Name as Theatre,s.ShowDate from Shows s inner join Movies m on s.MovieID=m.MovieID inner join Theatres t on s.TheatreID=t.TheatreID;
#11 Find the total revenue per theatre using JOINs between Shows and Bookings/Payments.
select t.Name as theatre,sum(p.Amount)as TotalRevenue from Payments p join Bookings b on p.BookingID=b.BookingID join shows s on b.ShowID=s.ShowID join Theatres t on s.TheatreID=t.TheatreID where p.Status='Paid' group by t.Name;
#11.1 Find customers who booked more than one show in the same day.
select CustomerId,BookingDate,count(*) as BookCount  from Bookings group by CustomerID,BookingDate having count(*);
