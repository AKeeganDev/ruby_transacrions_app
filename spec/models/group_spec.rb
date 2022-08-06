require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.create(
      name: 'admin',
      email: 'admin@admin.com',
      password: '111111',
      password_confirmation: '111111'
    )
    @group = Group.create(
      user_id: @user.id,
      name: 'Food',
      icon: '🍔'
    )
  end

  describe 'Group Model Properties' do
    it 'should have an author' do
      @group.user_id = nil
      expect(@group).to_not be_valid
    end

    it 'name should be present' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'icon should be present' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end
  end
end
