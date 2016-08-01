# User Controller Class
class UsersController < ApplicationController
  get '/login' do
    if logged_in?
      redirect '/'
    else
      erb :'users/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
