class GamesController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set :root, File.join(File.dirname(__FILE__),'..')

  set :views, Proc.new {File.join(root,"views")}

  # index
  get '/games' do
    @title = "Games Index"
    @games = Game.all
    erb :'games/index'
  end
  # new
  get '/games/new' do
    @title = "New Game"
    erb :'games/new'
  end
  # show
  get '/games/:id' do
    id = params[:id].to_i
    @game = Game.find id
    @title = "#{@game.title}"
    erb :'games/show'
  end
  # CREATE
  post '/games' do
    game = Game.new
    game.title = params[:title]
    game.released = params[:released]
    game.genre = params[:genre]
    game.developer_id = params[:developer_id]
    puts game
    game.save

    redirect '/games'
  end
  # UPDATE
  put '/games/:id' do
    id = params[:id].to_i

    game = Game.find id

    game.title = params[:title]
    game.released = params[:released]
    game.genre = params[:genre]
    game.developer_id = params[:developer_id]

    game.save

    redirect '/games'
  end
  # delete
  delete '/games/:id' do
    id = params[:id].to_i
    Game.destroy id
    redirect 'games'
  end
  # edit
  get '/games/:id/edit' do
    id = params[:id].to_i
    @game = Game.find id
    @title ="Edit #{@game.title}"
    erb  :'games/edit'
  end

end
