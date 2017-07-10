# ROOMATE FINDER
# Going to a convention and want to share a hotel room with someone to save some money...
# Use roomate finder to create a profile and find matches who are attending the same convention as you

# require gems
require 'sqlite3'
require 'faker'

# create SQLite3 database
db = SQLite3::Database.new("users.db")
db.results_as_hash = true

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
  user = db.execute("SELECT * FROM users WHERE email=?", [email])
  if user.empty?  # only create if the email address has not aready been used
    db.execute("INSERT INTO users (name, email, convention_name, convention_location, start_date, end_date, home_state, home_city, age, gender, smoker) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", [name, email, convention_name, convention_location, start_date, end_date, home_state, home_city, age, gender, smoker])
  else
    puts "This email has already been added."
  end
end

# random arrays needed for creating fake data
random_smoker = ['true', 'false']
random_gender = ['male', 'female']
random_start_date_BMES = ['2017-10-08', '2017-10-09', '2017-10-10', '2017-10-11', '2017-10-12']
random_end_date_BMES = ['2017-10-12', '2017-10-13', '2017-10-14', '2017-10-15', '2017-10-16', '2017-10-17', '2017-10-18']
random_start_date_PMH = ['2017-11-04', '2017-11-05','2017-11-06','2017-11-07', '2017-11-08']
random_end_date_PMH = ['2017-11-08', '2017-11-09', '2017-11-10', '2017-11-11', '2017-11-12', '2017-11-13', '2017-11-14']

# add lots of fake people for testing - COMMENTED OUT AFTER DATA WAS CREATED
# 50.times do
#   create_user(db, Faker::Name.name, Faker::Internet.email, "BMES", "Pheonix", random_start_date_BMES.sample, random_end_date_BMES.sample, Faker::Address.state, Faker::Address.city, Faker::Number.number(2), random_gender.sample, random_smoker.sample)
# end

# 50.times do
#   create_user(db, Faker::Name.name, Faker::Internet.email, "Perinatal Mental Health Conference", "Chicago", random_start_date_PMH.sample, random_end_date_PMH.sample, Faker::Address.state, Faker::Address.city, Faker::Number.number(2), random_gender.sample, random_smoker.sample)
# end

# create a method that finds matches - only if the given user exists in the database
def find_user(db, email)
  user = db.execute("SELECT * FROM users WHERE email=?", [email])
  if user.empty?
    puts "This email address cannot be found."
    user_found = false
  else
    user_found = true
  end
end

def match_user(db, email)
  user_found = find_user(db, email)
  if user_found == true
    user = db.execute("SELECT * FROM users WHERE email=?", [email])

    user_age = user[0]["age"].to_i
    match_age_min = ((user_age/10.round).to_s + 0.to_s).to_i
    match_age_max = match_age_min + 10

    matches = db.execute("SELECT * FROM users WHERE email<>? AND convention_name=? AND convention_location=? AND start_date=? AND end_date=? AND (age BETWEEN ? AND ?) AND gender=? AND smoker=? AND home_state=?", [email, user[0]["convention_name"], user[0]["convention_location"], user[0]["start_date"], user[0]["end_date"], match_age_min, match_age_max, user[0]["gender"], user[0]["smoker"], user[0]['home_state']])

    puts "The profile for #{user[0]['name']} shows:"
    puts "--------------------------------------------------------------------------------------"
    puts "#{user[0]['name']} is attending #{user[0]['convention_name']} in #{user[0]['convention_location']} from #{user[0]['start_date']} through #{user[0]['end_date']}."
    puts "#{user[0]['name']} is from #{user[0]['home_city']}, #{user[0]['home_state']}."
    puts "#{user[0]['name']} is #{user[0]['gender']} and is #{user[0]['age']} years old."
    if user[0]['smoker'] == "true"
      puts "#{user[0]['name']} is a smoker."
    elsif user[0]['smoker'] == "false"
      puts "#{user[0]['name']} is not a smoker."
    end
    puts "-------------------------------------------------------------------------------------- \n\n"

    if matches.empty?
      puts "There are no matches for #{user[0]['gender']} attendees of #{user[0]['convention_name']} with the same dates as you that also live in the same state, are in the same age range as you and that share your smoking preference."
      puts "Would you like to expand your search?"
      response = gets.chomp
      until response == "yes" || response == "no"
        puts "Please respond 'yes' or 'no'."
        response = gets.chomp!
      end
      if response == "yes"
        matches = db.execute("SELECT * FROM users WHERE email<>? AND convention_name=? AND convention_location=? AND start_date=? AND end_date=? AND gender=?", [email, user[0]["convention_name"], user[0]["convention_location"], user[0]["start_date"], user[0]["end_date"], user[0]["gender"]])

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
    else
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
  end
end


# UI

def create_custom_user(db)
  puts "Please answer some of the following questions so we can show you your possible matches."
  puts "What is your name?"
  custom_name = gets.chomp
  puts "What is your email address?"
  custom_email = gets.chomp
  puts "What is the name of the convention you are attending?"
  custom_convention_name = gets.chomp
  puts "What is the location of the convention where you will be needing to find lodging?"
  custom_convention_location = gets.chomp
  puts "What day would you like to check-in to the hotel or lodging? Please answer YYYY-MM-DD."
  custom_start_date = gets.chomp
  puts "What day would you like to check-out of the hotel or lodging? Please answer YYYY-MM-DD."
  custom_end_date = gets.chomp
  puts "What state do you currently live in? Please type the full name of the state."
  custom_home_state = gets.chomp
  puts "What city do you currently live in?"
  custom_home_city = gets.chomp
  puts "What is your age?"
  custom_age = gets.chomp
  puts "What is your gender? Please type 'male', 'female', or 'other'."
  custom_gender = gets.chomp
  puts "Are you a smoker? Please type 'true' or 'false'."
  custom_smoker = gets.chomp
  until custom_smoker == "true" || custom_smoker == "false"
    puts "Please answer 'true' or 'false'."
    custom_smoker = gets.chomp!
  end
  puts "\n\n"

  create_user(db, custom_name, custom_email, custom_convention_name, custom_convention_location, custom_start_date, custom_end_date, custom_home_state, custom_home_city, custom_age, custom_gender, custom_smoker)

  match_user(db, custom_email)
end

# allow user to create a profile
puts "Are you looking for a roomate to save some money while attending your next convention?"
puts "Have you already created a profile? Please answer 'yes' or 'no'."
answer = gets.chomp
user_found_status = false
until user_found_status == true
  until answer == "yes" || answer == "no"
    puts "Please answer 'yes' or 'no'."
    answer = gets.chomp!
  end
  if answer == "yes"
    puts "Please type the email address you gave in your profile."
    given_email = gets.chomp
    user_found = find_user(db, given_email)
    if !user_found
      puts "Please create a new profile:"
      answer = "no"
      user_found_status = false
    else
      puts "\n\n"
      match_user(db, given_email)
      user_found_status = true
    end
  else
    create_custom_user(db)
    user_found_status = true
  end
end
