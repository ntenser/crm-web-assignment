require_relative 'contact'
require 'sinatra'

Contact.create('Marty', 'McFly', 'marty@mcfly.com', "")
Contact.create('George', 'McFly', 'george@mcfly.com', "")
Contact.create('Lorraine', 'McFly', 'lorraine@marty@mcfly.com', "")
Contact.create('Biff', 'Tannen', 'biff@tannen.com', "")
Contact.create('Doc', 'Brown', 'doc@brown.com', "")


# get '/' do
#   'Main Menu'
# end
#
# get '/' do
#   'Hello World'
# end

@@crm_app_name = "Noah's CRM"
get '/' do
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to ('/')
end
