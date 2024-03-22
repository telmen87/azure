create PROCEDURE sp_PopulateDimDate (@EndDate DATE)
AS
BEGIN
  DECLARE @StartDate DATE;

  -- Set StartDate to beginning of the year for @EndDate
  SET @StartDate = '2019-01-01';

  -- Generate rows from @StartDate to @EndDate
  WITH DateCTE (Date) AS (
    SELECT @StartDate
    UNION ALL
    SELECT DATEADD(DAY, 1, Date)
    FROM DateCTE
    WHERE Date < @EndDate
  )
  INSERT INTO DimDate (
      DateKey,
      Date,
      FullDate,
      Year,
      Month,
      Day,
      DayOfWeek,
      DayOfMonth,
      WeekOfYear,
      IsWeekend
  )
  SELECT 
    ROW_NUMBER() OVER (ORDER BY Date), -- Generate unique sequential DateKey
    Date,
    CONVERT(CHAR(10), Date, 120), -- Format date as YYYY-MM-DD
    YEAR(Date), 
    MONTH(Date), 
    DAY(Date),
    DATENAME(dw, Date),  -- Get DayOfWeek name
    DAY(Date),
    DATEPART(week, Date),  -- Get WeekOfYear
    CASE WHEN DATENAME(dw, Date) IN ('Saturday', 'Sunday') THEN 1 ELSE 0 END AS IsWeekend
  FROM DateCTE
  option (maxrecursion 0);
END
GO

--drop PROCEDURE sp_PopulateDimDate