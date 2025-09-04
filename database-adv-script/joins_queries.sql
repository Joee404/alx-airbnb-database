select *
from Booking
inner join User
on Booking.user_id = User.id

select *
from Property
left join Review
on Property.id = Review.property_id


select *
from User
left join Booking
on User.id = Booking.user_id
UNION
select *
from User
right join Booking
on User.id = Booking.user_id;
