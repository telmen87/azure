create PROCEDURE sp_PopulateDimDate 
    (@EndDate DATE,
    @StartDate date)
AS
BEGIN
  -- Generate rows from @StartDate to @EndDate
  WITH DateCTE (Date) AS (
    SELECT @StartDate
    UNION ALL
    SELECT DATEADD(DAY, 1, Date)
    FROM DateCTE
    WHERE Date < @EndDate
  )
  INSERT INTO DimDate (
      Date,
      DateVal,
      Year,
      Month,
      Day,
      DayOfWeek,
      DayOfMonth,
      WeekOfYear,
      IsWeekend
  )
  select 
      Date,
      DateVal,
      Year, 
      Month, 
      Day, 
      DayOfWeek,
      sum(IsWeekend) over(partition by year, month order by year, month, day) as DayOfMonth,
      WeekOfYear,
      IsWeekend
  from 
      (SELECT 
        day(date) || '/'  || month(date) || '/' || year(date) as Date,
        CONVERT(CHAR(10), Date, 120) as DateVal, -- Format date as YYYY-MM-DD
        YEAR(Date) as Year,  
        MONTH(Date) as Month, 
        DAY(Date) as Day,
        DATENAME(dw, Date) as DayOfWeek,  -- Get DayOfWeek name
        DATEPART(week, Date) as WeekOfyear,  -- Get WeekOfYear
        CASE WHEN DATENAME(dw, Date) IN ('Saturday', 'Sunday') THEN 0 ELSE 1 END AS IsWeekend
      FROM DateCTE) table1
  option (maxrecursion 0);
END
GO