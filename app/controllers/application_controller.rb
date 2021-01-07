require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true #allow us to use patch and delete request
  end

  get "/" do
   "welcome"
  end

end
