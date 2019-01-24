require 'sinatra/base'

class Birthday < Sinatra::Base

def days_till_birthday(month, day)
  birthday = Date.new(Date.today.year, month, day)
  birthday += 365 if Date.today >= birthday
  (birthday - Date.today).to_i
end

get '/' do
  erb(:index)
end

post '/birthday' do
  @name = params[:name]
  @days_till_birthday = days_till_birthday(params[:month].to_i, params[:day].to_i)
  erb(:birthday)
end

end
