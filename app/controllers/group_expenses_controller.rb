class GroupExpensesController < ApplicationController
  before_action :signed_in?

  def new
    @expense = GroupExpense.new
  end

  def create
    @user = current_user
    @group = Group.find(params[:group_id])
    @expense = Expense.new(expense_params)
    @expense.user_id = @user.id
    if @expense.save
      redirect_to group_expenses_path
    else
      render :new
    end
  end
end
