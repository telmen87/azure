
CREATE TABLE DimDate (
  "DateKey" INT NOT NULL PRIMARY KEY,
  "Date" DATE NOT NULL,
  "FullDate" CHAR(10) NOT NULL,
  "Year" INT NOT NULL,
  "Month" INT NOT NULL,
  "Day" INT NOT NULL,
  "DayOfWeek" VARCHAR(10) NOT NULL,
  "DayOfMonth" INT NOT NULL,
  "WeekOfYear" INT NOT NULL,
  "IsWeekend" BIT NOT NULL
);