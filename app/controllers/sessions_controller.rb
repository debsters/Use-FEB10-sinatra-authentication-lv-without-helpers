class SessionsController < ApplicationController

  get '/login' do
    erb :"sessions/login"
  end

  # post '/sessions' do
  #   session[:email] = params[:email] #login(params[:email]) => method login(email) session[:email] = email
  #   redirect '/posts'
  # end

  post '/sessions' do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:email] = user.email
      redirect '/posts'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear #logout! => method logout! session.clear
    redirect '/posts'
  end
  
end
