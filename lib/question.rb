class Question < ActiveRecord::Base

    belongs_to :categories

    def self.get_questions(category)

        wronganswers =[]

        response = RestClient.get("https://opentdb.com/api.php?amount=50&category=#{category}&difficulty=medium&type=multiple")
        data = JSON.parse(response)

        if data["response_code"] == 0

              data["results"].each do |d|

                  #tidy up question data - remove irregular chars
                  clean_question = Nokogiri::HTML.parse(d["question"]).children.text

                  ###### load answers ######
                  d["incorrect_answers"].each do |answer|
                      wronganswers << Nokogiri::HTML.parse(answer).children.text
                  end

                  d["correct_answer"] = Nokogiri::HTML.parse(d["correct_answer"]).children.text
                  #############


                  Question.create(category_id: category, question: clean_question, correct_answer: d["correct_answer"], wrong_answer_1: wronganswers[0],
                    wrong_answer_2: wronganswers[1], wrong_answer_3: wronganswers[2])

                  wronganswers =[]

              end

        end

        # binding.pry
        # "juik"
    end

end
