require 'spec_helper'

describe 'User' do
  before do
    @user = User.create(username: 'bilbo', email: 'test123@aol.com', password: 'onering')
    Pokemon.create(user_id: @user.id, pokedex_id: 1, cp: 259)
    Pokemon.create(user_id: @user.id, pokedex_id: 119, cp: 358)
    Pokemon.create(user_id: @user.id, pokedex_id: 17, cp: 67)
  end

  it 'users have a secure password' do
    expect(@user.authenticate('sting')).to eq(false)
    expect(@user.authenticate('onering')).to eq(@user)
  end

  it 'users have a collection of all of their pokemon' do
    expect(@user.pokemons.count).to eq(3)
  end
end
