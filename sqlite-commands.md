# Useful sqlite3 commands

## Setting up easier to read query mode
```
.mode column
.header on
```

## List current tables in DB
```
.tables
```

## Source tables in sqlite
```
create table payments (
  id varchar(255),
  created timestamp,
  brand varchar(255),
  merchant varchar(255),
  amount double
);

create table refunds (
  id varchar(255),
  created timestamp,
  payment varchar(255),
  brand varchar(255),
  merchant varchar(255),
  amount double
);

.mode csv
.import data/payments.csv payments
.import data/refunds.csv refunds
```
