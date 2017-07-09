# ROOMATE FINDER
# Going to a convention and want to share a hotel room with someone to save some money...
# Use roomate finder to create a profile and find matches who are attending the same convention as you

# require gems
require 'sqlite3'
require 'faker'

# create SQLite3 database
db = SQLite3::Database.new("users.db")
db.results_as_hash = true

# create table
  # values:
    # id integer primary key
    # name
    # email
    # convention_name
    # convention_location
    # start_date
    # end_date
    # home_state
    # home_city
    # age
    # smoker

create_table = <<-SQL
  CREATE TABLE IF NOT EXISTS users(
    id INTEGER PRIMARY KEY,
    name VARCHAR (255),
    email VARCHAR (255),
    convention_name VARCHAR (255),
    convention_location VARCHAR (255),
    start_date DATE,
    end_date DATE,
    home_state VARCHAR (255),
    home_city VARCHAR (255),
    age INT,
    smoker BOOLEAN
  )
SQL

db.execute(create_table)

# create a method to add a single user
def create_user(db, name, email, convention_name, convention_location, start_date, end_date, home_state, home_city, age, smoker)
  db.execute("INSERT INTO users (name, email, convention_name, convention_location, start_date, end_date, home_state, home_city, age, smoker) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [name, email, convention_name, convention_location, start_date, end_date, home_state, home_city, age, smoker])
end

# random arrays needed for creating data
random_smoker = ['true', 'false'].sample
random_start_date_BMES = ['2017-10-08', '2017-10-09', '2017-10-10', '2017-10-11', '2017-10-12'].sample
random_end_date_BMES = ['2017-10-12', '2017-10-13', '2017-10-14', '2017-10-15', '2017-10-16', '2017-10-17', '2017-10-18'].sample
random_start_date_PMH = ['2017-11-04', '2017-11-05','2017-11-06','2017-11-07', '2017-11-08'].sample
random_end_date_PMH = ['2017-11-08', '2017-11-09', '2017-11-10', '2017-11-11', '2017-11-12', '2017-11-13', '2017-11-14'].sample

# add lots of fake people for testing
50.times do
  create_user(db, Faker::Name.name, Faker::Internet.email, "BMES", "Pheonix", random_start_date_BMES, random_end_date_BMES, Faker::Address.state, Faker::Address.city, Faker::Number.number(2), random_smoker)
end

50.times do
  create_user(db, Faker::Name.name, Faker::Internet.email, "Perinatal Mental Health Conference", "Chicago", random_start_date_PMH, random_end_date_PMH, Faker::Address.state, Faker::Address.city, Faker::Number.number(2), random_smoker)
end

# create a method that finds matches




# create a method to send requested match
  # if interested then respond yes
  # else request is ignored and noted that match not desired

# UI
# allow user to create a profile
# allow user to find a match

