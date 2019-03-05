
#seed data

    ## flush old data
    Catergory.delete_all
    Question.delete_all

    #Seed new data
    #create category seed data
    Catergory.create(id: 9, name: "General Knowledge")
    Catergory.create(id: 21, name: "Sports")
    Catergory.create(id: 22, name: "Geography")

    #create question data
    Question.get_questions("9")
    Question.get_questions("21")
    Question.get_questions("22")

    binding.pry
    "junk"
