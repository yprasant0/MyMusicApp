class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :user_id, :string
    add_index :searches, :user_id
  end
end
