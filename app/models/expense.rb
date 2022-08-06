class Expense < ApplicationRecord
  belongs_to :user
  has_many :group_expenses, dependent: :destroy
  has_many :groups, through: :group_expenses

  validates :name, presence: true
  validates :amount, presence: true,
                     numericality: { greater_than: 0, must_not_be_zero: 'The Expense must be greater than $0.00' }

  def convert_to_currency
    if amount.to_s.include?('.')
      return format('%.2f', "#{amount}0") if amount.to_s.split('.').last.size == 1
      return format('%.2f', amount.to_s) if amount.to_s.split('.').last.size >= 2
    else
      format('%.2f', "#{amount}0")
    end
  end
end
