class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "serenitymedicationsapp"
  end

  # helpers do

  #   def logged_in?
  #     !!session[:email]
  #   end

  #   def login(email)
  #     session[:email] = email
  #   end

  #   def logout!
  #     session.clear
  #   end
  # end
  
end



# helpers do

#   def logged_in?
#     !!current_user
#   end

#   def current_user
#     @current_user ||= User.find_by(:email => session[:email]) if session[:email]
#   end

#   def login(email, password)
#     #check if a user with this email actually exists
#     # if so, set the session
#     user = User.find_by(:email => email)
#     if user && user.authenticate(password)
#       session[:email] = user.email
#     else
#       redirect '/login'
#     end
#   end

#   def logout!
#     session.clear
#   end
# end