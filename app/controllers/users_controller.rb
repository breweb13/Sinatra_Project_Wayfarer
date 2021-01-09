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
            flash[:notice] = "You have succesfully signed up!" 
            session[:user_id] = user.id 
            redirect to '/posts'
           else
            flash.now[:error] = "Something went wrong, please try again"
            erb :'users/signup'
           end
    end

    get '/login' do 
        if logged_in?
            redirect  to '/posts'
        else
            erb :'/users/login'
        end
    end
    
    post '/login' do
        current_user = User.find_by(username: params[:username])
        if current_user && current_user.authenticate(params[:password]) 
            session[:user_id] = current_user.id
            flash[:notice] = "You have succesfully logged in!" 
            redirect to '/posts'
        else
            if @current_user
                flash.now[:error] = "Oh-huh! Something is wrong, please try again"
                erb :'users/login'
            else
                flash.now[:error] = "Oh-huh! Something is wrong, please try again"
                erb :'users/login'
            end
        end
    end 

    get '/logout' do 
        if logged_in?
            session.clear 
            redirect to '/'
        else
            redirect to '/'
        end
    end

end
