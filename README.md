# Setup
Install sqlite3 if you don't have it already to access the data in data.db.
The ETL script is written for sqlite3.
You can also use other tools to analyze the input CSVs, `data/payments.csv`, `data/refunds.csv`, and run the ETL script.

# Data Bugsquash

Your task in this exercise is to debug the `DailyTransactions` Spark Scala job and correct the errors present in the job. While debugging the data set, we would also like you to create functional test query(ies) in SQL that test for correctness.

The data sources for this question are individual `payment` and `refund` records found in the `data` folder (`payments.csv`, `refunds.csv`). Payments are transactions by merchants over a one year period, and refunds are transactions refunded by merchants in the same one year period.

The current SQL ETL can be found in daily_merchant_transaction_activity.sql and is intended to generate daily aggregate volume and count information from those two data sources and the current result is loaded into data.db.

The current table schema and intended values are described as follows:

column name | data type | description
--- | --- | ---
day | timestamp | Day of activity being reported.
merchant | varchar(255) | ID of the merchant whose activity is reported.
paymentvolume | double | Total amount of payments that occurred on this day.
paymentcount | double | Total count of payments that occurred on this day.
refundedvolume | double | Total amount refunded on payments created on this day.
refundcount | double | Total count of refunds on payments created on this day.
bookedrefundedvolume | double | Total amount of refunds that occurred on this day.
bookedrefundcount | double | Total count of refunds that occurred on this day.
netprocessedvolume | double | Total amount of payments less booked refund volume that occurred on this day.

The output schema is predetermined and is on a day/merchant granularity. It reports payment and refund volumes and refunds are reported in two ways: "booked" and "attributed".
- A "booked" refund is reported based on the created time of the refund itself.
- An "attributed" refund is reported based on the creation time of the originating payment that is being refunded.

Don't hesitate to ask any clarifying questions about the desired output with your interviewer.

Please walk through how you would approach debugging the data, and make changes to the SQL ETL to regenerate a corrected data set. As outputs we would like to see a corrected, regenerated data set as well as functional validation queries that identify issues and test for correctness.

# Sqlite3 and Utility Scripts
All 3 data sets have been preloaded into a sqlite3 database for easy access.

You can start the sqlite3 instance by loading the data.db database:

`sqlite3 data.db`

Helpful sqlite3 db commands and the table schemas can be found in sqlite3_commands.md.

Currently loaded tables in data.db:

`payments` - raw data on individual transactions

`refunds` - raw data on individual refunds

`daily_merchant_transaction_activity` - current job output, per merchant per day aggregated payment and refund data.

Try `select * from payments limit 100`.

# Good Luck!
