class PostsController < ApplicationController

  get '/posts' do
    "A list of publically available posts"
  end 

  get '/posts/new' do
    #Checking if they are logged in
    if !session[:email] #!logged_in? => method logged_in? !!session[:email]
      redirect "/login" #Redirecting if they aren't
    else
      "A new post form" # rendering if they are
    end
  end

  get '/posts/:id/edit' do
    #Checking if they are logged in
    current_user ||= User.find_by(:email => session[:email]) if session[:email]
    if !current_user
      redirect "/login" #Redirecting if they aren't
    else
      # how do I find the post that only the author user is allowed to edit
      # post = Post.find(params[:id])
      # if post.user_id == current_user.id
      # if post = current_user.posts.find_by(params[:id]) //In Avi's video he left this line like this which is wrong. You have to put "(id: params[:id])"
      if post = current_user.posts.find_by(id: params[:id])
        "An edit post form #{current_user.id} is editing #{post.id}" # rendering if they are
      else
        redirect '/posts'
      end
    end
  end

  # get '/posts/:id/edit' do
  #   #Checking if they are logged in
  #   if !session[:email] #!logged_in? => method logged_in? !!session[:email]
  #     redirect "/login" #Redirecting if they aren't
  #   else
  #     # how do I find the post that only the author user is allowed to edit
  #     # post = Post.find(id: params[:id]) would not work. Has to be find_by
  #     post = Post.find(params[:id])
  #     current_user ||= User.find_by(:email => session[:email]) if session[:email]
  #     if post.user_id == current_user.id
  #       "An edit post form #{current_user.id} is editing #{post.id}" # rendering if they are
  #     else
  #       redirect '/posts'
  #     end
  #   end
  # end

end


