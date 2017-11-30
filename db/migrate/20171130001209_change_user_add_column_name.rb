class ChangeUserAddColumnName < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, null: false, limit: 100
  end
end
