require 'sinatra/base'

class Birthday < Sinatra::Base

  def days_till_birthday
    birthday = Date.new(Date.today.year, @month, @day)
    birthday += 365 if Date.today >= birthday
    (birthday - Date.today).to_i
  end

get '/' do
  erb(:index)
end

post '/birthday' do
  @name = params[:name]
  @day = params[:day].to_i
  @month = params[:month].to_i
  @days_till_birthday = days_till_birthday
  erb(:birthday)
end

end
