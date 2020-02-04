require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')

require_relative('./models/film')
require_relative('./models/ticket')
require_relative('./models/customer')
also_reload('/models/*')

  get '/' do
    erb(:home)
  end

  get '/films' do
    @films = Film.all()
    erb(:index)
  end
