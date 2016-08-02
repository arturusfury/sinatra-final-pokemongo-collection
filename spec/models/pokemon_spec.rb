require 'spec_helper'

describe 'Pokemon' do
  before do
    @user = User.create(username: 'bilbo', email: 'test123@aol.com', password: 'onering')
    @pokemon1 = Pokemon.create(user_id: @user.id, pokedex_id: 1, cp: 259)
    @pokemon2 = Pokemon.create(user_id: @user.id, pokedex_id: 119, cp: 358)
    @pokemon3 = Pokemon.create(user_id: @user.id, pokedex_id: 17, cp: 67)
  end

  it 'expects pokemon created to belong to a user' do
    expect(@pokemon1.user.id).to eq(@user.id)
    expect(@pokemon2.user.id).to eq(@user.id)
    expect(@pokemon3.user.id).to eq(@user.id)
  end
end
