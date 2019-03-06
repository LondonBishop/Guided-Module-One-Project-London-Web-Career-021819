class Game < ActiveRecord::Base

    belongs_to :users
    belongs_to :categories

    def get_random_array
        arr = []
        while arr.length <= 3
            random_number = Random.rand(4)
            if !(arr.include?(random_number))
                arr << random_number
            end
        end
        return arr
    end


    def play

        no_of_correct_answers = 0
        question_no = 1
        correct_answer_index = nil
        orignal_question_array = []
        final_question_array = [0,0,0,0]

        # game_questions = Question.find_by_category_id(self.category_id)
        game_questions = Question.where(category_id: self.category_id).take(5)

        #randomise the questions
        game_questions.each do |question|

              orignal_question_array << question.correct_answer
              orignal_question_array << question.wrong_answer_1
              orignal_question_array << question.wrong_answer_2
              orignal_question_array << question.wrong_answer_3

              get_random_array.each_with_index do |value, index|
                  final_question_array[value] = orignal_question_array[index]
                  if index == 0
                      correct_answer_index = value
                  end
              end

              #binding.pry

              #run each question
              puts ""
              puts "Question : #{question_no}"
              puts question.question
              puts ""
              puts "1. #{final_question_array[0]}"
              puts "2. #{final_question_array[1]}"
              puts "3. #{final_question_array[2]}"
              puts "4. #{final_question_array[3]}"
              puts ""
              puts "Enter your answer [1..4]"

              question_no = question_no + 1
              answer = gets.chomp



              if answer.to_i == (correct_answer_index + 1)
                  puts "CORRECT!"
                  no_of_correct_answers =  no_of_correct_answers + 1
              else
                  puts "Sorry - that's the wrong answer..."
              end

              # binding.pry

              #reset arrays
              orignal_question_array =[]
              final_question_array = []

        end

        puts "Total Score is: #{no_of_correct_answers} out of 5"
        #binding.pry
    end
end
