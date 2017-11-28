class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :login, null: false, limit: 80, unique: true
      t.string :token, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
