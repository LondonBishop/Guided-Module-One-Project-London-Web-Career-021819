class Game < ActiveRecord::Base

    belongs_to :users
    belongs_to :catergories

    def play

        game_questions = Question.find_by_category_id(self.id)
        binding.pry
        
    end


end
