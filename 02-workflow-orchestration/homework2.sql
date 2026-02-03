--quiz 3
CREATE OR REPLACE TABLE `kestra-test-486010.zoomcamp.yellow_tripdata_2020_all` AS
SELECT * FROM `kestra-test-486010.zoomcamp.yellow_tripdata_2020_01`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.yellow_tripdata_2020_02`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.yellow_tripdata_2020_03`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.yellow_tripdata_2020_04`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.yellow_tripdata_2020_05`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.yellow_tripdata_2020_06`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.yellow_tripdata_2020_07`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.yellow_tripdata_2020_08`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.yellow_tripdata_2020_09`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.yellow_tripdata_2020_10`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.yellow_tripdata_2020_11`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.yellow_tripdata_2020_12`;

--count the new table created
SELECT count(*) FROM `kestra-test-486010.zoomcamp.yellow_tripdata_2020_all`

--quiz 4:
CREATE OR REPLACE TABLE `kestra-test-486010.zoomcamp.green_tripdata_2020_all` AS
SELECT * FROM `kestra-test-486010.zoomcamp.green_tripdata_2020_01`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.green_tripdata_2020_02`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.green_tripdata_2020_03`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.green_tripdata_2020_04`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.green_tripdata_2020_05`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.green_tripdata_2020_06`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.green_tripdata_2020_07`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.green_tripdata_2020_08`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.green_tripdata_2020_09`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.green_tripdata_2020_10`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.green_tripdata_2020_11`
UNION ALL
SELECT * FROM `kestra-test-486010.zoomcamp.green_tripdata_2020_12`;

--count all green 2020 data
SELECT count(*) FROM `kestra-test-486010.zoomcamp.green_tripdata_2020_all` 

--quiz 5
SELECT count(*) FROM `kestra-test-486010.zoomcamp.yellow_tripdata_2021_03`
