require_relative '../config/environment'
#prompt = TTY::prompt


  #Setup initial user

  quizmaster = Quizmaster.new

  if quizmaster.start

      u1 = quizmaster.load_user
      cats = Category.all

      # binding.pry
      puts "You will get 10 questions on General Knowledge."
      puts "Ready! - Here we go..."

      game1 = Game.create(user_id: u1.id, category_id: 9)
      game1.play

  else
      puts ""
      puts "Thank you for playing Quiz Masters!"
  end

  # binding.pry
  # "junk"
