require_relative '../config/environment'

  quizmaster = Quizmaster.new

  if quizmaster.Start
      puts ""
      puts "You will get 10 questions on General Knowledge."
      puts "Ready! - Here we go..."
  else
      puts ""
      puts "Thank you fro playing QuizMasters!"
  end

  # binding.pry
  # "junk"
