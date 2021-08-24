# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Co-authored-by: Ben Pawlik <james.benjamin.pawlik@gmail.com>
co-authored-by: Adrian Camacho <adriancamacho18@gmail.com>
co-authored-by: Araceli Valdovinos <valdovinosaraceli50@gmail.com>

Time math:

water_time = Time.now.to_i + (time interval to next watering || water_wait)
calendar_date = Time.strptime(water_time.to_s, '%s')

a day in epoch is 86400

other methods to know
beginning_of_hour
beginning_of_day

Time.now.beginning_of_day = 2021-08-24 00:00:00 -0700 (time stamp that can be compared to another time stamp)

How to add watering schedule:
  - add column water_time to plants DONE
  - add a method to determine water_wait depending on type of plant DONE
  - add time logic for comparing timestamps DONE
  - update a watering time by selecting Plant watered or some such
  - add new timestamp to calendar