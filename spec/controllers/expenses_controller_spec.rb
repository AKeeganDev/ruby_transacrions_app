require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  before(:each) do
    @user = User.create(
      name: 'admin',
      email: 'admin@admin.com',
      password: '111111',
      password_confirmation: '111111'
    )
    sign_in @user
    @group = Group.create(
      user_id: @user.id,
      name: 'Food',
      icon: '🍔'
    )
    @expense = Expense.create(
      user_id: @user.id,
      name: 'Burger',
      amount: 100
    )
    GroupExpense.create(
      group_id: @group.id,
      expense_id: @expense.id
    )
  end

  describe 'GET /index' do
    before { get group_expenses_path(@group) }

    it 'returns a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'should render the correct text' do
      expect(response.body).to include('Burger')
    end
  end
end
