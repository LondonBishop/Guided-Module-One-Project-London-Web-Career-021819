class Game < ActiveRecord::Base

    belongs_to :users
    belongs_to :categories

    def get_random_array(size)
        arr = []
        while arr.length <= size
            random_number = Random.rand(size + 1)
            if !(arr.include?(random_number))
                arr << random_number
            end
        end
        return arr
    end


    def play

        no_fetch_questions = 50
        no_quiz_questions = 10

        no_of_correct_answers = 0
        question_no = 1
        correct_answer_index = nil
        orignal_answer_array = []
        final_answer_array = [0,0,0,0]
        final_questions = []

        system ('clear')

        ########################################
        # Load questions for quiz and randomize
        ########################################
        game_questions = Question.where(category_id: "#{self.category_id} OR 17 OR 27").take(no_fetch_questions)

        get_random_array(49).each_with_index do |value, index|
            final_questions[value] = game_questions[index]
        end

        final_questions = final_questions.take(no_quiz_questions)



        ################################################
        #randomise the answer for a question
        ################################################
        final_questions.each do |question|

              orignal_answer_array << question.correct_answer
              orignal_answer_array << question.wrong_answer_1
              orignal_answer_array << question.wrong_answer_2
              orignal_answer_array << question.wrong_answer_3

              get_random_array(3).each_with_index do |value, index|
                  final_answer_array[value] = orignal_answer_array[index]
                  if index == 0
                      correct_answer_index = value
                  end
              end

              #binding.pry

              #run each question
              system('clear')
              puts "Question #{question_no} of #{no_quiz_questions}"
              puts question.question
              puts ""
              puts "1. #{final_answer_array[0]}"
              puts "2. #{final_answer_array[1]}"
              puts "3. #{final_answer_array[2]}"
              puts "4. #{final_answer_array[3]}"
              puts ""
              puts "Enter your answer [1..4]"

              question_no = question_no + 1
              answer = gets.chomp

              if answer.to_i == (correct_answer_index + 1)
                  puts "**** CORRECT! *****"
                  no_of_correct_answers =  no_of_correct_answers + 1
              else
                  puts ""
                  puts "Sorry - that's the WRONG answer..."
                  puts "The answer is --> #{correct_answer_index + 1}. #{final_answer_array[correct_answer_index]}"
              end

              # puts ""
              # puts "Press ANY key for next question"
              # gets.chomp
              sleep 0.95

              # binding.pry

              #reset arrays
              orignal_answer_array =[]
              final_answer_array = []

        end

        system ('clear')
        puts "*********** FINAL SCORE ***************"
        puts "Total Score is: #{no_of_correct_answers} out of #{no_quiz_questions}"
        puts "***************************************"
        #binding.pry

        return no_of_correct_answers

    end


    def self.put_top_score_table

        scorenumber = 1

          #SELECT users.name, games.score from users JOIN games ON users.id = games.user_id ORDER BY games.score DESC

          score_arr = User.all.map do |user|
                {name: user.name,
                 score: user.games.max_by{|game|game.score}.score}
          end

          ####### Output League Table.######
          new_score_arr = score_arr.sort_by {|userscore| userscore[:score]}.reverse

          puts "============================="
          puts "------- LEAGUE TABLE --------"

          puts "Name                   Score"
          puts "----                   -----"
          new_score_arr.each { |v| puts "#{scorenumber}.#{v[:name].ljust(20)} #{v[:score]}" }
          puts "----------------------------"

    end


end
