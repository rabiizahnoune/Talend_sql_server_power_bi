CREATE PARTITION FUNCTION SalesYearPartitionFunction (int)
AS RANGE RIGHT FOR VALUES (2019, 2020, 2021, 2022, 2023);


CREATE PARTITION SCHEME SalesYearPartitionScheme
AS PARTITION SalesYearPartitionFunction
TO ([PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY]);


CREATE CLUSTERED INDEX IDX_sales_fact_date_id
ON [dbo].[sales_fact] (Date_key)
ON SalesYearPartitionScheme (Date_key);


CREATE CLUSTERED INDEX IDX_invetory_fact_date_id
ON [dbo].[invetory_fact] (Date_key)
ON SalesYearPartitionScheme (Date_key);

