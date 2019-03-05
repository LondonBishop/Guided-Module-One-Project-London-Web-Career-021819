class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |q|
       q.integer  :user_id
       q.integer  :category_id
       q.integer  :score
       q.datetime :created_on
       q.datetime :updated_on
  end
  end
end
