require 'sinatra/base'

class Birthday < Sinatra::Base

get '/' do
  erb(:index)
end

put '/birthday' do
  erb(:birthday)
end

end
