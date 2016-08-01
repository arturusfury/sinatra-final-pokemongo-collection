require 'spec_helper'

describe UsersController do
  describe 'Login Page' do
    it 'loads a page that lets you login and create a new user' do
      get '/login'
      expect(last_response.status).to eq(200)
    end

    it 'once a user has been created it directs the user to their collection' do
      params = {
        inputEmail: 'skittles@aol.com',
        inputUsername: 'skittles123',
        inputPassword: 'rainbows'
      }
      post '/new', params
      expect(last_response.location).to include('/collection')
    end

    it 'will not let a user signup without a username' do
      params = {
        inputEmail: 'skittles@aol.com',
        inputUsername: '',
        inputPassword: 'rainbows'
      }
      post '/new', params
      expect(last_response.location).to include('/login')
    end

    it 'will not let a user signup without a email' do
      params = {
        inputEmail: '',
        inputUsername: 'skittles123',
        inputPassword: 'rainbows'
      }
      post '/new', params
      expect(last_response.location).to include('/login')
    end

    it 'will not let a user signup without a password' do
      params = {
        inputEmail: 'skittles@aol.com',
        inputUsername: 'skittles123',
        inputPassword: ''
      }
      post '/new', params
      expect(last_response.location).to include('/login')
    end

    it 'will not let a user who is already logged in see the login page' do
      user = User.create(username: 'skittles123', email: 'skittles@aol.com', password: 'rainbows')
      params = {
        inputUsername: 'skittles123',
        inputEmail: 'skittles@aol.com',
        inputPassword: 'rainbows'
      }
      post '/new', params
      session = {}
      session[:id] = user.id
      get '/login'
      follow_redirect!
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Current <strong>Collection</strong>')
    end

    it 'will load the users collection after logging in' do
      User.create(username: 'skittles123', email: 'skittles@aol.com', password: 'rainbows')
      params = {
        inputUsername: 'skittles123',
        inputPassword: 'rainbows'
      }
      post '/login', params
      expect(last_response.status).to eq(302)
      follow_redirect!
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('Current <strong>Collection</strong>')
    end
  end

  describe 'logout' do
    it 'lets a user logout' do
      User.create(username: 'skittles123', email: 'skittles@aol.com', password: 'rainbows')
      params = {
        inputUsername: 'skittles123',
        inputPassword: 'rainbows'
      }
      post '/login', params
      get '/logout'
      expect(last_response.location).to include("/login")
    end
  end
end
