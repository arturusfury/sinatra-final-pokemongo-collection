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
    if session[:user_id]
      @user = User.find(session[:user_id])
      @pokemons = @user.pokemons
      erb :'users/show'
    else
      flash(:three)[:error] = 'You must be logged in to view your collection'
      redirect to '/login'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:loginUsername])
    if user && user.authenticate(params[:loginPassword])
      session[:user_id] = user.id
      redirect to '/collection'
    else
      flash(:one)[:error] = 'Invalid Username or Password'
      redirect to '/login'
    end
  end

  post '/new' do
    if params[:inputUsername] == '' || params[:inputEmail] == '' || params[:inputPassword] == ''
      flash(:two)[:error] = 'You must fill in all of the available items before continuing'
      redirect to '/login'
    else
      @user = User.new(username: params[:inputUsername], email: params[:inputEmail], password: params[:inputPassword])
      @user.save
      session[:user_id] = @user.id
      redirect to '/collection'
    end
  end

  # Route for adding a Pokemon to a user's collection
  post '/add' do
    user = User.find(session[:user_id])
    if params[:add_cp] != ''
      pokemon = Pokemon.new(user_id: user.id, pokedex_id: params[:pokedex_num], cp: params[:add_cp])
      pokemon.save
      redirect to '/collection'
    else
      flash(:four)[:error] = 'You must enter a value into the Combat Power field to add a pokemon to your collection'
      redirect to '/login'
    end
  end

  # Route for editing a pokemon in the user's collection
  patch '/modify' do
    if params[:modify_cp] != ''
      pokemon = Pokemon.find(params[:modify_id])
      pokemon.cp = params[:modify_cp]
      pokemon.save
    else
      flash(:five)[:error] = 'You must enter a value into the Combat Power field to edit an existing pokemon'
    end

    redirect to '/collection'
  end

  # Route for deleting a pokemon in the user's collection
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
