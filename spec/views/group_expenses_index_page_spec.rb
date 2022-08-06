require 'rails_helper'

RSpec.describe 'Group Show Page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'admin',
      email: 'admin@admin.com',
      password: '111111',
      password_confirmation: '111111'
    )
    @user.save!
    sign_in @user

    @group = Group.create(
      user_id: @user.id,
      name: 'Food',
      icon: '🍔'
    )

    (1..5).each do |id|
      @group.expenses.create(
        user_id: @user.id,
        name: "Expense #{id}",
        amount: 100
      )
    end

    visit group_expenses_path(@group)
  end

  it 'should render the correct text' do
    expect(page).to have_content('Expense 1')
    expect(page).to have_content('Expense 2')
    expect(page).to have_content('Expense 3')
    expect(page).to have_content('Expense 4')
    expect(page).to have_content('Expense 5')
  end

  it 'should have a link to add a new expense' do
    expect(page).to have_link('Add Expenses')
  end

  it 'new expense link should lead to new expense page' do
    click_link('Add Expenses')
    expect(current_path).to eq(new_group_expense_path(@group))
  end
end