class PostsController < ApplicationController


    #BUILDING OUT CRUD
    #Read - showing all posts

    get '/posts' do
        #attach the posts model so we can view all from double
        @posts = Post.all
        #render all the posts
        erb :'posts/index'
    end


    #Create - render a form for user to create a new post
     get '/posts/new' do
        redirect_to_if_not_logged_in
        erb :'posts/new'
    end

    post '/posts' do
        @post = Post.new(params[:posts])
        #binding.pry
        if @post.save
          flash[:message] = "Post created successfully!"
          redirect "/posts/#{@post.id}"
        else
          flash[:error] = "Unable to create post: #{@post.errors.full_messages.to_sentence}"
          redirect '/posts/new'
        end
    end

    # an issue with the way code is ordered. 

    #To display a single post
    get '/posts/:id' do
        find_post
        erb :'/posts/show'
    end

 
    #Update
    #Edit button that takes us to form
    #Render form to edit post
    
    get '/posts/:id/edit' do
        redirect_to_if_not_logged_in
        find_post
        if authorized_to_edit?(@post)
        erb :'/posts/edit'
        else
        flash[:error] = "You are not authorized to edit this post!"
        redirect "/posts/#{@post.id}"
        end
    end
   
    #Use PATCH method here.. 
    patch '/posts/:id' do 
        
        find_post
        @post.update(location: params[:location], image_url: params[:image_url], journal: params[:journal])
        redirect "/posts/#{@post.id}"
    end
    
    #Delete
    #Delete the post - as well as the existing route
    delete '/posts/:id' do
        #gotta find the post we want to Delete
        find_post
        if authorized_to_edit?(@post)
        @post.destroy
        flash[:message] = "Post deleted successfully!"
        redirect '/posts'
        else
            flash[:error] = "You are not authorized to delete this post!"
            redirect "/posts/#{@post.id}"
        end
    end
    
    
    private

    def find_post
        @post = Post.find_by_id(params[:id])
    end
    
end
