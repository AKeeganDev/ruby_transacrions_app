class CreateGroupsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.belongs_to :user, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
