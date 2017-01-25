require_relative 'contact'
require 'sinatra'

## Temporary fake data so that we always find contact with id 1.
Contact.create('Marty', 'McFly', 'marty@mcfly.com', "Developer")
Contact.create('George', 'McFly', 'george@mcfly.com', "Developer")
Contact.create('Lorraine', 'McFly', 'lorraine@marty@mcfly.com', "Developer")
Contact.create('Biff', 'Tannen', 'biff@tannen.com', "Developer")
Contact.create('Doc', 'Brown', 'doc@brown.com', "Developer")


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

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra: :NotFound
  end
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    redirect to('/')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/')
  else
    raise Sinatra::NotFound
  end
end
