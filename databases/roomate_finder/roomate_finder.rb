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
    gender VARCHAR (255),
    smoker BOOLEAN
  )
SQL

db.execute(create_table)

# create a method to add a single user
def create_user(db, name, email, convention_name, convention_location, start_date, end_date, home_state, home_city, age, gender, smoker)
  db.execute("INSERT INTO users (name, email, convention_name, convention_location, start_date, end_date, home_state, home_city, age, gender, smoker) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [name, email, convention_name, convention_location, start_date, end_date, home_state, home_city, age, gender, smoker])
end

# random arrays needed for creating data
random_smoker = ['true', 'false'].sample
random_gender = ['male', 'female'].sample
random_start_date_BMES = ['2017-10-08', '2017-10-09', '2017-10-10', '2017-10-11', '2017-10-12'].sample
random_end_date_BMES = ['2017-10-12', '2017-10-13', '2017-10-14', '2017-10-15', '2017-10-16', '2017-10-17', '2017-10-18'].sample
random_start_date_PMH = ['2017-11-04', '2017-11-05','2017-11-06','2017-11-07', '2017-11-08'].sample
random_end_date_PMH = ['2017-11-08', '2017-11-09', '2017-11-10', '2017-11-11', '2017-11-12', '2017-11-13', '2017-11-14'].sample

# add lots of fake people for testing
# 50.times do
#   create_user(db, Faker::Name.name, Faker::Internet.email, "BMES", "Pheonix", random_start_date_BMES, random_end_date_BMES, Faker::Address.state, Faker::Address.city, Faker::Number.number(2), random_gender, random_smoker)
# end

# 50.times do
#   create_user(db, Faker::Name.name, Faker::Internet.email, "Perinatal Mental Health Conference", "Chicago", random_start_date_PMH, random_end_date_PMH, Faker::Address.state, Faker::Address.city, Faker::Number.number(2), random_gender, random_smoker)
# end

# create a method that finds matches
def match_user(db, email)
  user = db.execute("SELECT * FROM users WHERE email=?", [email])
  user_convention_name = user[0]["convention_name"]
  user_convention_location = user[0]["convention_location"]
  user_start_date = user[0]["start_date"]
  user_end_date = user[0]["end_date"]
  user_home_state = user[0]["home_state"]
  user_gender = user[0]["gender"]
  user_smoker = user[0]["smoker"]
  user_age = user[0]["age"].to_i
  match_age_min = ((user_age/10.round).to_s + 0.to_s).to_i
  match_age_max = match_age_min + 10

  matches = db.execute("SELECT * FROM users WHERE email!=? AND convention_name=? AND convention_location=? AND start_date=? AND end_date=? AND (age>? AND age<?) AND gender=? AND smoker=?", [email, user_convention_name, user_convention_location, user_start_date, user_end_date, match_age_min, match_age_max, user_gender, user_smoker])

  puts "#{user[0]['name']}'s possible matches:"
  matches.each do |match|
    puts "--------------------------------------------------------------------------------------"
    puts "#{match['name']} is attending #{match['convention_name']} in #{match['convention_location']} from #{match['start_date']} through #{match['end_date']}."
    puts "#{match['name']} is from #{match['home_city']}, #{match['home_state']}."
    puts "#{match['name']} is #{match['gender']} and is #{match['age']} years old."
    if match['smoker'] == "true"
      puts "#{match['name']} is a smoker."
    elsif match['smoker'] == "false"
      puts "#{match['name']} is not a smoker."
    end
    puts "-------------------------------------------------------------------------------------- \n\n"
  end
end

match_user(db, "rickey@mcclurehegmann.net")



# create a method to send requested match
  # if interested then respond yes
  # else request is ignored and noted that match not desired

# UI
# allow user to create a profile
# allow user to find a match

