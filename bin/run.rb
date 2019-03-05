require_relative '../config/environment'


  #Setup initial user

  quizmaster = Quizmaster.new

  if quizmaster.Start
      quizmaster.get_user
      puts "You will get 10 questions on General Knowledge."
      puts "Ready! - Here we go..."
  else
      puts ""
      puts "Thank you fro playing QuizMasters!"
  end

  # binding.pry
  # "junk"
