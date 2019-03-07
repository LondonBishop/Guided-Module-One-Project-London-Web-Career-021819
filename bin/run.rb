require_relative '../config/environment'
#prompt = TTY::prompt


  #Game.put_top_score_table
  #binding.pry

      quizmaster = Quizmaster.new

      if quizmaster.start

            #Setup initial user
            u1 = quizmaster.load_user
            cats = Category.all

            puts "You will get 10 questions on General Knowledge."
            puts "Ready! - Here we go..."

            game1 = Game.create(user_id: u1.id, category_id: 9)
            game1.score = game1.play

            ### Update score for user
            game1.user_id = u1.id
            game1.category_id = 9
            game1.save

            ### Output league table.
            Game.put_top_score_table

      else
            puts ""
            puts "Thank you for playing Quiz Masters!"
      end

  # binding.pry
  # "junk"
