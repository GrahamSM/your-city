# Homepage (Root path)
  enable :sessions

  helpers do
    def current_user
       User.find_by(id: session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  get '/city/spot/new' do
    @user = Spot.new
    erb :'city/spot/new'
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

  post '/city/spot/new' do
    @spot = Spot.new(title: params[:title], location: params[:location],
    description: params[:description])
  end

  get '/users/login' do
    @user = User.new
    erb :'users/login'
  end

  post '/users/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/'
    else
      redirect '/users/login'
    end
  end

  get '/users/logout' do
    session.clear
    redirect '/'
  end

  get '/city/:city' do
    @current_city = City.new(name: params[:city])
    erb :'city/categories'
  end

get '/city/:city/:category' do
  @current_city = City.where(name: params[:city]).first
  @current_category = Category.find_by(name: params[:category]) ##TODO:Hardcode these into the database!!
  erb :'city/category'
end

get '/city/:city/category/:category/spot/:id/upvote' do
  @current_spot = Spot.find_by(id: params[:id])
  if @current_spot.num_votes
    @current_spot.num_votes += 1
  else
    @current_spot.num_votes = 1
  end
  @current_category = Category.find_by(name: params[:category])
  @current_city = City.find_by(name: params[:city])
  binding.pry
  erb :'city/category'
end
