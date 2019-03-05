class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |q|
      q.integer :category_id
      q.text :question
      q.text :correct_answer
      q.text :wrong_answer_1
      q.text :wrong_answer_2
      q.text :wrong_answer_3
      q.datetime :created_on
      q.datetime :updated_on
  end

  end
end
