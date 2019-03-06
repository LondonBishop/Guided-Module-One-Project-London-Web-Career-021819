class Question < ActiveRecord::Base

    belongs_to :categories

    def self.get_questions(category)

        response = RestClient.get("https://opentdb.com/api.php?amount=50&category=#{category}&difficulty=medium&type=multiple")
        data = JSON.parse(response)

        if data["response_code"] == 0

              data["results"].each do |d|

                  #tidy up question data - remove irregular chars
                  clean_question = Nokogiri::HTML.parse(d["question"]).children.text

                  #load answers
                  wronganswers = d["incorrect_answers"]
                  Question.create(category_id: category, question: clean_question, correct_answer: d["correct_answer"], wrong_answer_1: wronganswers[0],
                    wrong_answer_2: wronganswers[1], wrong_answer_3: wronganswers[2])
              end

        end

        # binding.pry
        # "juik"
    end

end
