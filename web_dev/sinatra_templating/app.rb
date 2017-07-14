# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true


db2 = SQLite3::Database.new("messages.db")
db2.results_as_hash = true

comments = <<-SQL
  CREATE TABLE IF NOT EXISTS comments (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    message VARCHAR(255)
  );
SQL

db2.execute(comments)
# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

get '/contact' do
  erb :contact
end

get '/contact/submit' do
  @messages = db2.execute("SELECT * FROM comments")
  erb :contact_submit
end

post '/contact' do
  db2.execute("INSERT INTO comments (name, email, message) VALUES (?,?,?)", [params['name'], params['email'], params['message']])
  redirect '/contact/submit'
end


# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

# add static resources