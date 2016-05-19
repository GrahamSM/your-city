# Homepage (Root path)
require 'pry'
  enable :sessions

  helpers do
    def current_user
       User.find(session[:user_id]) if session[:user_id]
    end
  end

  get '/' do
    erb :index
  end

  get '/city/:city' do
    erb :'city/categories'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.new(username: params[:username], email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect'/'
    else
      redirect '/users/new'
    end
  end

  get '/users/login' do
    @user = User.new
    erb :'users/login'
  end

  post '/users/login' do
    @user = User.find_by(username: params[:username])

    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/'
    else
      binding.pry
      redirect '/users/login'
    end
  end

  get '/users/logout' do
    session.clear
    redirect '/'
  end
