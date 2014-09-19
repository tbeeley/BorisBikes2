#Boris Bikes

[![Code Climate](https://codeclimate.com/repos/541bfd0a6956806f6500a2cb/badges/1a49138dd7b8480d8ec7/gpa.svg)](https://codeclimate.com/repos/541bfd0a6956806f6500a2cb/feed)  [![Test Coverage](https://codeclimate.com/repos/541bfd0a6956806f6500a2cb/badges/1a49138dd7b8480d8ec7/coverage.svg)](https://codeclimate.com/repos/541bfd0a6956806f6500a2cb/feed)

![Picture](./assets/arnie_and_boris.png)

##Objectives

To explore and improve my knowledge of **Test Driven Development** (TDD), **Object-Oriented Programming** (OOP) and **Object-Oriented Design** (OOD).

The aim was to create a simple system for managing Boris Bikes in London. Using CRC cards, I decided to employ the following classes: Bike, User, DockingStation, Van and Garage. I added a BikeContainer module in order to extract the common functionality in the DockingStation, Van and Garage. 

##Technologies

    * Ruby 2.0.0
    * RSpec 3.0

#How to run it

git clone https://github.com/tbeeley/BorisBikes2.git

cd BorisBikes2

bundle

irb

require './files.rb'

#How to run the tests

cd BorisBikes2
rspec



