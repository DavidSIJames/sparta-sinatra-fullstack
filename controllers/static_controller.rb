class StaticController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set :root, File.join(File.dirname(__FILE__),'..')

  set :views, Proc.new {File.join(root,"views")}

  get '/' do
    @title="Main Page"
    erb :'static/landing'
  end
end
