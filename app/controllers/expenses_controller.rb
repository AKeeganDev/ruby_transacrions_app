class ExpensesController < ApplicationController
  before_action :signed_in?

  def index
    @expense = Expense.new
    @group = Group.find(params[:group_id])
    @expenses = @group.expenses
    @prompt = "Expenses for #{@group.name}"
  end

  def new
    @group = Group.find(params[:group_id])
    @prompt = "Add expense for #{@group.name}"
    @expense = Expense.new
  end

  def create
    @user = current_user
    @group = Group.find(params[:group_id])
    @expense = Expense.new(expense_params)
    @expense.user_id = @user.id
    if @expense.save
      @group_expense = GroupExpense.create(group_id: @group.id, expense_id: @expense.id)
    else
      flash[:notice] = 'Number must be greater than 0'
    end
    redirect_to group_expenses_path
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
