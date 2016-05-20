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
    @current_city = City.first
    erb :'city/categories'
  end

get '/city/:city/:category' do
  @current_city = City.first
  @current_category = Category.first ##TODO:Hardcode these into the database!!
  redirect "/city?city=#{@current_city.name}&category=#{@current_category.name}"
end

get '/city' do
  @current_city = City.first
  @current_category = Category.first
  erb :'city/category'
end

get '/city_data' do
  @current_city = City.first
  @current_category = Category.first
  @current_spots = @current_city.spots
  my_hash = {city: @current_city, category: @current_category, spots: @current_spots}
  my_data = my_hash.to_json
end

post '/:city/:category/upvote/spot/:id' do
  @current_spot = Spot.find_by(id: params[:id])
  if @current_spot.num_votes
    @current_spot.num_votes += 1
  else
    @current_spot.num_votes = 1
  end
  @current_spot.save
  @current_category = Category.find_by(name: params[:category])
  @current_city = City.find_by(name: params[:city])
  redirect "/city?city=#{@current_city.name}&category=#{@current_category.name}"
end

post '/:city/:category/downvote/spot/:id' do
  @current_spot = Spot.find_by(id: params[:id])
  if @current_spot.num_votes
    @current_spot.num_votes -= 1
  else
    @current_spot.num_votes = -1
  end
  @current_spot.save
  @current_category = Category.find_by(name: params[:category])
  @current_city = City.find_by(name: params[:city])
  redirect "/city?city=#{@current_city.name}&category=#{@current_category.name}"
end

get '/upvote' do
  erb :'city/category'
end
