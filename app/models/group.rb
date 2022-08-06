class Group < ApplicationRecord
  belongs_to :user
  has_many :group_expenses, dependent: :destroy
  has_many :expenses, through: :group_expenses, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true

  def convert_to_currency
    amount = total_sum

    if amount.to_s.include?('.')
      return format('%.2f', "#{amount}0") if amount.to_s.split('.').last.size == 1
      return format('%.2f', amount.to_s) if amount.to_s.split('.').last.size >= 2
    else
      format('%.2f', "#{amount}0")
    end
  end

  def total_sum
    expenses.sum(:amount)
  end
end
