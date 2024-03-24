
CREATE TABLE DimDate (
    Date CHAR(10) PRIMARY KEY,
    DateVal date NOT NULL,
    Year INT NOT NULL,
    Month INT NOT NULL,
    Day INT NOT NULL,
    DayOfWeek VARCHAR(10) NOT NULL,
    DayOfMonth INT NOT NULL,
    WeekOfYear INT NOT NULL,
    IsWeekend BIT NOT NULL
);


CREATE TABLE Metric (
  MetricID INT IDENTITY(1,1) PRIMARY KEY,
  MetricName VARCHAR(255) NOT NULL UNIQUE,  -- Enforce unique metric names
  Unit VARCHAR(255)
);

CREATE TABLE Entity (
  EntityID INT IDENTITY(1,1) PRIMARY KEY,
  EntityName VARCHAR(255) NOT NULL UNIQUE  -- Enforce unique entity names
);

CREATE TABLE FactTable (
  FactKey INT IDENTITY(1,1) PRIMARY KEY,
  DateKey INT NOT NULL FOREIGN KEY REFERENCES DimDate(DateKey),
  MetricID INT NOT NULL FOREIGN KEY REFERENCES Metric(MetricID),
  EntityID INT NOT NULL FOREIGN KEY REFERENCES Entity(EntityID),
  TimePeriod VARCHAR(255) NOT NULL,
  Value DECIMAL(18,2) NOT NULL,
  CONSTRAINT FK_FactTable_DateKey FOREIGN KEY (DateKey) REFERENCES DIMDate(DateKey),
  CONSTRAINT FK_FactTable_MetricID FOREIGN KEY (MetricID) REFERENCES Metric(MetricID),
  CONSTRAINT FK_FactTable_EntityID FOREIGN KEY (EntityID) REFERENCES Entity(EntityID)
);



drop table DimDate;