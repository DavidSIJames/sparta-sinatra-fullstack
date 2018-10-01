class DevelopersController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set :root, File.join(File.dirname(__FILE__),'..')

  set :views, Proc.new {File.join(root,"views")}

  #index
  get '/developers' do
    @title = " Developers Index"
    @developers = Developer.all
    erb :'developers/index'
  end
  # new
  get '/developers/new' do
    @title = "New Developer"
    erb :'developers/new'
  end
  # show
  get '/developers/:id' do
    id = params[:id].to_i
    @developers = Developer.find id
    @title = "@developers.name"
    erb :'developers/show'
  end
  # CREATE
  post '/developers' do
    developer = Developer.new

    developer.name = params[:name]
    developer.founded = params[:founded]
    developer.country = params[:country]

    developer.save
    redirect '/developers'
  end
  # UPDATE
  put '/developers/:id' do
    id =params[:id].to_i
    developer = Developer.find id
    developer.name = params[:name]
    developer.founded = params[:founded]
    developer.country = params[:country]
    developer.save
    redirect '/developers'
  end
  # DELETE
  delete '/developers/:id' do
    id = params[:id].to_i
    Developer.destroy id
    redirect '/developers'
  end
  # Edit
  get '/developers/:id/edit' do
    id = params[:id].to_i
    @developer = Developer.find id
    @title = "Edit #{@developer.name}"
    erb :'developers/edit'
  end
end
