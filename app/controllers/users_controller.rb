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
      @user = current_user
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
    user = current_user
    add_cp = params[:add_cp]
    if add_cp.to_i == 0 || add_cp.to_i > 9999
      flash(:four)[:error] = 'You must enter a Combat Power that is between 1 and 9999'
    elsif add_cp != ''
      user.pokemons.create(pokedex_id: params[:pokedex_num], cp: add_cp)
    else
      flash(:four)[:error] = 'You must enter a value into the Combat Power field to add a pokemon to your collection'
    end

    redirect to '/collection'
  end

  # Route for editing a pokemon in the user's collection
  patch '/modify' do
    modify_cp = params[:modify_cp]
    if modify_cp.to_i == 0 || modify_cp.to_i > 9999
      flash(:five)[:error] = 'You must enter a Combat Power that is between 1 and 9999'
    elsif modify_cp != ''
      pokemon = Pokemon.find(params[:modify_id])
      pokemon.cp = modify_cp
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
