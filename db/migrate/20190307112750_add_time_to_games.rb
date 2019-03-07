class AddTimeToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :timetaken, :float
  end
end
