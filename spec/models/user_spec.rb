require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(
      name: 'admin',
      email: 'admin@admin.com',
      password: '111111',
      password_confirmation: '111111'
    )
  end

  describe 'User Model Properties' do
    it 'name should be present' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'email should be present' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'password should be present' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'name should be unique' do
      @duplicate_user = User.create(
      name: 'admin',
      email: 'admin@admin.com',
      password: '111111',
      password_confirmation: '111111'
    )
      expect(@duplicate_user).to_not be_valid
    end
  end
end