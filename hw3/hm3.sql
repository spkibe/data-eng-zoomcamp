-- CREATE OR REPLACE TABLE
--   `kestra-test-486010.hw3.yellow_tripdata_2024`
-- AS
-- SELECT *
-- FROM `kestra-test-486010.hw3.yellow_tripdata_2024_ext`;

select count(PULocationID) from `kestra-test-486010.hw3.yellow_tripdata_2024`;

select count(PULocationID) from `kestra-test-486010.hw3.yellow_tripdata_2024_ext`;

select count(*) FROM `kestra-test-486010.hw3.yellow_tripdata_2024`
WHERE fare_amount = 0;

select PULocationID FROM `kestra-test-486010.hw3.yellow_tripdata_2024`;



select * FROM `kestra-test-486010.hw3.yellow_tripdata_2024` limit 10;

CREATE OR REPLACE TABLE
  `kestra-test-486010.hw3.partitioned_yellow_tripdata_2024`
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID
AS
SELECT *
FROM `kestra-test-486010.hw3.yellow_tripdata_2024_ext`;


SELECT DISTINCT VendorID
FROM `kestra-test-486010.hw3.yellow_tripdata_2024`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';

SELECT DISTINCT VendorID
FROM `kestra-test-486010.hw3.partitioned_yellow_tripdata_2024`
WHERE DATE(tpep_dropoff_datetime) BETWEEN '2024-03-01' AND '2024-03-15';

SELECT count(*) FROM `kestra-test-486010.hw3.partitioned_yellow_tripdata_2024`




