class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :factor1
      t.integer :factor2
      t.integer :question_total

      t.timestamps null: false
    end
  end
end