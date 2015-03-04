class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :num1
      t.integer :num2
      t.integer :correct

      t.timestamps null: false
    end
  end
end
