class Question < ActiveRecord::Base

    belongs_to :catergories

    def self.get_questions(category)

        response = RestClient.get("https://opentdb.com/api.php?amount=50&category=#{category}&difficulty=medium&type=multiple")
        data = JSON.parse(response)

        if data["response_code"] == 0

              data["results"].each do |d|
                  wronganswers = d["incorrect_answers"]
                  Question.create(category_id: category, question: d["question"], correct_answer: d["correct_answer"], wrong_answer_1: wronganswers[0],
                    wrong_answer_2: wronganswers[1], wrong_answer_3: wronganswers[2])
              end

        end

        binding.pry
        "juik"
    end

end
