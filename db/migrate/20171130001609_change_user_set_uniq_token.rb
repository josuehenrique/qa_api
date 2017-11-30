class ChangeUserSetUniqToken < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :token, :string, null: false, unique: true, limit: 100
  end
end
