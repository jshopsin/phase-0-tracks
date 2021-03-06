# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data

get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that searches the students database by their name
get '/students/:name' do
  name = params[:name]
  name_appended = "%#{name}%"
  p name
  students = db.execute("SELECT * FROM students WHERE name LIKE ?", [name_appended])
  # this was strange above, it did not work when I used the secure way of using a ?, but did work with the string interpolation
  # so instead a made a separate variable with the string interpolation so the selection is still secure
  # students.to_s
  response = ""
  if students.empty?
    response << "There are no registered students by the name: #{name}"
  else
    students.each do |student|
      response << "ID: #{student['id']}<br>"
      response << "Name: #{student['name']}<br>"
      response << "Age: #{student['age']}<br>"
      response << "Campus: #{student['campus']}<br><br>"
    end
  end
  response
end

# write a GET route that retrieves
# a particular student
get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# write a GET route that retrieves contact address
get '/contact' do
  "<h1>Contact us:</h1><br><br>contact@example.com<br><br>123.456.7890<br><br><br><br>1234 Address Street<br><br>Big City, CA 12345"
end

# write a GET route with query parameter
# that take a person's name and
# replies good job if name is present
get '/great_job' do
  name = params[:name]
  if name
    "Good job, #{name}!"
  else
    "Good job!"
  end
end

# write a GET route with route parameters for 2 numbers that returns the sum
get '/:num_1/+/:num_2' do
  sum = params[:num_1].to_i + params[:num_2].to_i
  "#{params[:num_1]} + #{params[:num_2]} = #{sum}"
end