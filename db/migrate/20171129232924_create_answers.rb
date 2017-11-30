class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :answer, null: false
      t.integer :provider_id, null: false, index: true
      t.integer :question_id, null: false, index: true

      t.timestamps
    end

    add_foreign_key :answers, :users, column: :provider_id
    add_foreign_key :answers, :questions
  end
end
