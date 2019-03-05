class Quizmaster

    def Start

      puts "Welcome to QuizMasters!"
      puts "How good is your Knowledge?"
      puts ""
      puts "Please enter (Y)- to Start Quiz (N) - Exit)"

      result = gets.chomp

      while result != 'Y' && result.chomp != 'N'
          puts "Please enter (Y - Start Quiz N - Exit)"
          result = gets.chomp
      end

      case result
        when "Y"
              return true
        when "N"
              return false
      end

    end

end
