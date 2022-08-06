class CreateGroupsExpensesJoinTable < ActiveRecord::Migration[7.0]
  create_table :group_expenses do |t|
    t.belongs_to :group, index: true, foreign_key: true
    t.belongs_to :expense, index: true, foreign_key: true

    t.timestamps
  end
end
