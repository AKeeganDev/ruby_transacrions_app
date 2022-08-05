class ExpensesController < ApplicationController
  before_action :signed_in?

  def index
    @prompt = 'Add Expense'
    @expense = Expense.new
    @group = Group.find(params[:group_id])
    @expenses = Expense.where(group_id: params[:group_id])
    p @group.expense
  end

  def new
    @expense = Expense.new
  end

  def create
    @user = current_user
    @group = Group.find(params[:group_id])
    @expense = Expense.new(expense_params)
    @expense.group_id = @user.id
    @expense.user_id = @user.id
    if @expense.save
      redirect_to group_expenses_path
    else
      render :new
    end
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
