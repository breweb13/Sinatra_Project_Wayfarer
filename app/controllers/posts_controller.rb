class PostsController < ApplicationController
 
 #gets all post 
 get '/posts' do
    #display the index view
    @posts = Post.all
    erb :"posts/index"
 end

 # viewing for user to make a new post
 get '/posts/new' do
    #display the new view
    erb :"posts/new"
end

  #create a new post
  post '/posts' do
    @post = Post.new(params)
    post.save
    redirect '/posts'
 end

  # gets 1 post
  get '/posts/:id' do 
    @post = Post.find_by_id(params["id"])
    erb :"posts/show"
     #displays show view
 end

  # view the form to edit 1 particular post
  get '/posts/:id/edit' do
    @post = Post.find_by_id(params["id"])
    erb :"posts/edit"
     #displays the edit view (render)
  end

    #Update 1 post based on edit form
    patch '/posts/:id' do
    @post = Post.find_by_id(params["id"])
    end

    #Delete 1 post
    delete '/posts/:id' do
    @post = Post.find_by_id(params["id"])
    end

end