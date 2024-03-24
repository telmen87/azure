exec sp_populatedimdate @StartDate = '2019-01-01', @EndDate = '2024-12-31'

select 
    *
from DimDate 
inner join facttable on dimdate.Date = facttable.date


select 
    *
from DimDate 
where Date = '12/1/2022'


select 
    *
from facttable 
where Date = '11/1/2022'


select * from facttable;