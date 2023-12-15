# My DBT project

## Introduction 
- Create 2 postgres database : 
    - 1 production database with transactional data 
    - 1 warehouse database where data are transferred from production database to data warehouse using dbt


## Chapter fo tutorial page 
    1 = Creation of postghres sql docker 
        set up initial docker with postgres sql 
        set up database connection 
        set up scripts to create database 
        load database file at set up 
        test connection 
    2 - install dbt core and init project 
        set up profile with database connection 
        "dbt debug" cmd line to check connection success 
    3 - dbt model
        start with the 2 example and dbt run 
        see in database the creation of the table and view 
    4 - first staging model for payments
        Start making sources.yml with oly payments
        create stg_payments.sql
        create stg_payments.yml with tests
        dbt run 
        dbt tests
        >> Normally tests are successfull   
    5 - dbt order 
        modify the status to be capitilize 
        add column of benefit 
        made the tests
        add tests in payment of relationship with order 
    6 - dbt customer 
        add in snapshot folder the snapshot of customers and config the timestamp on correct update field value
        dbt snapshot -> create a snapshot database
        create a stg customers database from snapshot (need to add the dbt valid to and valid from)
        transform the status field 
        add test and dbt run 
        change a value in source -> dbt snapshot -> dbt run 
            see change of value via SCD 2 

    Marketing 