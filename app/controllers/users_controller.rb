# User Controller Class
class UsersController < ApplicationController
  get '/login' do
    if logged_in?
      redirect '/'
    else
      erb :'users/login'
    end
  end

  get '/collection' do
    @user = User.find(session[:user_id])
    @pokemons = @user.pokemons
    erb :'users/show'
  end

  post '/login' do
    user = User.find_by(username: params[:inputUsername])
    if user && user.authenticate(params[:inputPassword])
      session[:user_id] = user.id
      redirect to '/collection'
    else
      redirect to '/login'
    end
  end

  post '/new' do
    if params[:inputUsername] == '' || params[:inputEmail] == '' || params[:inputPassword] == ''
      redirect to '/login'
    else
      @user = User.new(username: params[:inputUsername], email: params[:inputEmail], password: params[:inputPassword])
      @user.save
      session[:user_id] = @user.id
      redirect to '/collection'
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
