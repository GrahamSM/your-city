# Homepage (Root path)
get '/' do
  erb :index
end

get '/city' do
  erb :'city/categories'
end
