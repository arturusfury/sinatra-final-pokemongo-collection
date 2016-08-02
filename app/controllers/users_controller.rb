# User Controller Class
class UsersController < ApplicationController
  get '/login' do
    if logged_in?
      redirect '/collection'
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

  post '/add' do
    user = User.find(session[:user_id])
    if user
      pokemon = Pokemon.new(user_id: user.id, pokedex_id: params[:pokedex_num], cp: params[:cp])
      pokemon.save
      redirect to '/collection'
    else
      redirect to '/login'
    end
  end

  patch '/modify' do
    if params[:cp] != ''
      pokemon = Pokemon.find(params[:modify_id])
      pokemon.cp = params[:cp]
      pokemon.save
    end

    redirect to '/collection'
  end

  delete '/release' do
    if params[:id] != ''
      pokemon = Pokemon.find(params[:delete_id])
      pokemon.delete
    end

    redirect to '/collection'
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
