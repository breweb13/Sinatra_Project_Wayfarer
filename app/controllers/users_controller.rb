class UsersController < ApplicationController
  get '/signup' do 
      if  logged_in?
          redirect to '/posts'
      else
          erb :'users/signup'
      end
  end

  post '/signup' do
      user = User.new(params)
         if user.save
          flash[:notice] = "Hey Wayfarer, you are all set!" 
          session[:user_id] = user.id 
          redirect to '/posts'
         else
          flash.now[:error] = "Oh snap, let's try again!"
          redirect 'users/signup'
         end
  end

  get '/login' do 
      if logged_in?
          redirect '/posts'
      else
          erb :'/users/login'
      end
  end
  
  post '/login' do
      @current_user = User.find_by(username: params[:username])
      if @current_user && @current_user.authenticate(params[:password]) 
          session[:user_id] = @current_user.id
          flash[:notice] = "Welcome Wayfarer!" 
          redirect '/posts'
          
      else
          flash.now[:error] = "Oh-huh! Something is wrong, please try again"
          redirect 'users/login'
          end
      end
  end 

  get '/logout' do 
      session.clear 
      redirect '/'
  end

end