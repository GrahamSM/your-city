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

  get '/city/:city/new' do
    @current_city = City.find(params[:city].to_i)
    @vibes = Vibe.all
    @categories = Category.all
    @spot = Spot.new
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

  post '/city/:city/new' do
    @current_city = City.find_by(name: params[:city])
    @spot = Spot.new(title: params[:title], location: params[:location], description: params[:description], city_id: @current_city.id, latitude: params[:lat].to_f, longitude: params[:long], category_id: params[:category_selection])
    if params[:vibe_one]
       @spot.vibes << Vibe.find_by(id: params[:vibe_one].to_i)
    end
    if params[:vibe_two]
      @spot.vibes << Vibe.find_by(id: params[:vibe_two].to_i)
    end
    if params[:vibe_three]
      @spot.vibes << Vibe.find_by(id: params[:vibe_three].to_i)
    end
    if params[:vibe_four]
      @spot.vibes << Vibe.find_by(id: params[:vibe_four].to_i)
    end
    if params[:file]
      @filename = "#{@spot.id}_spot_image.jpg"
      file_name = params["file"][:filename]
      File.open("./public/images/#{@filename}",'wb',) do |f|
        f.write(params["file"][:tempfile].read)
      end
      @spot.image = file_name
    else
      @spot.save
      erb :'city/spot/new'
    end
    @current_city.spots << @spot
    @current_city.save
    if @spot.save
      @current_category = Category.find_by(id: params[:category_selection])
      redirect "/city?city=#{@current_city.id}&category=#{@current_category.id}"
    else
      erb :'city/spot/new'
    end
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
  @current_city = City.find_by(name: params[:city])
  erb :'city/categories'
end

get '/city/:city/:id' do
  @current_city = City.find(params[:city])
  @current_category = Category.find(params[:id])
  redirect "/city?city=#{@current_city.id}&category=#{@current_category.id}"
end

get '/city' do
  @current_city = City.find(params[:city])
  @current_category = Category.find(params[:category])
  erb :'city/category'
end

get '/city_data' do
  @current_city = City.find(params[:city].to_i)
  @current_category = Category.find(params[:category].to_i)
  @current_spots = @current_city.spots
  my_hash = {city: @current_city, category: @current_category, spots: @current_spots}
  my_data = my_hash.to_json
end

get '/city_data_new' do
  @current_city = City.find(params[:city].to_i)
  my_hash = {city: @current_city}
  my_data = my_hash.to_json
end

get '/filtered_spots' do
  @current_spots = City.find(params[:city].to_i).spots
  if params[:options]
    @current_spots = City.find(params[:city].to_i).spots.includes(:vibes).where('vibes.label IN (?)', params[:options]).references(:vibes)
  end
  @current_spots.to_json
end

post '/:city/:category/upvote/spot/:id' do
  content_type :json
  @current_spot = Spot.find_by(id: params[:id])
  @spot_user_entry = Spotsuser.new(user_id: current_user.id, spot_id: @current_spot.id)
  if @spot_user_entry.save
    if @current_spot.num_votes
      @current_spot.num_votes += 1
    else
      @current_spot.num_votes = 1
    end
    @current_spot.save
    @current_category = Category.find_by(name: params[:category])
    @current_city = City.find_by(name: params[:city])
    # redirect "/city?city=#{@current_city.id}&category=#{@current_category.id}"
    { votes_count: @current_spot.num_votes, id: @current_spot.id }.to_json
  end
end

post '/:city/:category/downvote/spot/:id' do
  content_type :json
  @current_spot = Spot.find_by(id: params[:id])
  @spot_user_entry = Spotsuser.new(user_id: current_user.id, spot_id: @current_spot.id)
  if @spot_user_entry.save
    if @current_spot.num_votes
      @current_spot.num_votes -= 1
    else
      @current_spot.num_votes = -1
    end
    @current_spot.save
    @current_category = Category.find_by(name: params[:category])
    @current_city = City.find_by(name: params[:city])
    { votes_count: @current_spot.num_votes, id: @current_spot.id }.to_json
  end
end

get '/upvote' do
  erb :'city/category'
end
