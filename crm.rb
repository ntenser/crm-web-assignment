require 'sinatra'

# get '/' do
#   'Main Menu'
# end
#
# get '/' do
#   'Hello World'
# end


get '/' do
  erb :index
end
