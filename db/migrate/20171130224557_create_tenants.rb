class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.string :api_token, null: false, unique: true
      t.string :name, null: false, limit: 100
      t.string :login, null: false, limit: 80, unique: true

      t.timestamps
    end
  end
end
