class RemoveUFromsearches < ActiveRecord::Migration[5.2]
  def change
    remove_column :searches, :Uid, :string
  end
end
