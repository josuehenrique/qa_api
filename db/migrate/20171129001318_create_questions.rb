class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :question, null: false
      t.integer :asker_id, null: false
      t.boolean :particular, null: false, default: false

      t.timestamps
    end

    add_foreign_key :questions, :users, column: :asker_id
  end
end
