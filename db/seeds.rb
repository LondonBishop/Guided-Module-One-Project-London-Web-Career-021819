
#seed data

    ## flush old data
    Category.delete_all
    Question.delete_all

    #Seed new data
    #create category seed data
    Category.create(id: 9, name: "General Knowledge")
    Category.create(id: 21, name: "Sports")
    Category.create(id: 22, name: "Geography")
    Category.create(id: 23, name: "History")
    Category.create(id: 17, name: "Science")
    Category.create(id: 26, name: "Celebrities")
    Category.create(id: 27, name: "Animals")

    #create question data
    Question.get_questions("9")
    Question.get_questions("21")
    Question.get_questions("22")
    Question.get_questions("23")
    Question.get_questions("17")
    Question.get_questions("26")
    Question.get_questions("27")

    # binding.pry
    # "junk"
