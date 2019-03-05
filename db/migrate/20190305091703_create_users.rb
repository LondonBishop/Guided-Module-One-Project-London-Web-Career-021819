class CreateUsers < ActiveRecord::Migration[5.0]
  def change

    create_table :users do |u|
        u.string :name
        u.datetime :created_on
        u.datetime :updated_on
    end

  end
end
