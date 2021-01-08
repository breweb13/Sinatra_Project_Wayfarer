require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "secret_vibes"
  end


  get "/" do
    
    erb :welcome
  end

  helpers do 

    def logged_in? 
      !!session[:user_id]
    end

    def current_user
      User.find_by_id(session[:user_id])
    end

    def redirect_to_if_logged_in
      redirect '/posts' if logged_in?
    end

    def redirect_to_if_not_logged_in
      redirect '/users/login' unless logged_in?
    end

  end

  def authorized_to_edit?(post)      
    post.user == current_user    
  end

end