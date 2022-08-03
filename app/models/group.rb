class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expenses, join_table: 'groups_payments', dependent: :destroy
end
