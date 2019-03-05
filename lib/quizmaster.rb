class Quizmaster

    def Start

      puts "

   ____  __  ___________      __  ___           __
  / __ \/ / / /  _/__  /     /  |/  /___ ______/ /____  __________
 / / / / / / // /   / /     / /|_/ / __ `/ ___/ __/ _ \/ ___/ ___/
/ /_/ / /_/ // /   / /__   / /  / / /_/ (__  ) /_/  __/ /  (__  )
\___\_\____/___/  /____/  /_/  /_/\__,_/____/\__/\___/_/  /____/


"

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

    def get_user_name

        puts "Enter you User Name"
        result = gets.chomp

        if (User.find_by name: result)
          put true
          puts ""

        else
            puts "You user has been created. Please use the User Name next time.."
        end

    end



    def start_quiz

    end




end
