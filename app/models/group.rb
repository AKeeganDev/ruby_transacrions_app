class Group < ApplicationRecord
  belongs_to :user
  has_many :group_expenses
  has_many :expenses, through: :group_expenses

  def total_sum
    expenses.sum(:amount)
  end
end
