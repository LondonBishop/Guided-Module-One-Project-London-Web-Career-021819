class CreateCategorys < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |c|
       c.string :name
       c.datetime :created_on
       c.datetime :updated_on
   end
  end
end
