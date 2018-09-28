require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/Developer.rb'
require_relative './models/Game.rb'
require_relative './controllers/static_controller.rb'
require_relative './controllers/developers_controller.rb'
require_relative './controllers/games_controller.rb'


use Rack::Reloader
use Rack::MethodOverride

run Rack::Casade.new([
  StaticController,
  GamesController,
  DeveloperController
])
