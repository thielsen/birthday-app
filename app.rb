require 'sinatra/base'

class Birthday < Sinatra::Base

get '/' do
  erb(:index)
end

post '/birthday' do
  @name = params[:name]
  @day = params[:day].to_i
  @month = params[:month].to_i
  @birthday = true if @month == Time.now.month && @day == Time.now.day
  erb(:birthday)
end

end
