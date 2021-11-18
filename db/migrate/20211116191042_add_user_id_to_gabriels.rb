class AddUserIdToGabriels < ActiveRecord::Migration[6.1]
  def change
    add_column :gabriels, :user_id, :integer
    add_index :gabriels, :user_id
  end
end
