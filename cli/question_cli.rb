def create_question
  header
  puts "Enter a new question:"
  question_text = gets.chomp
  @current_question = Question.create(:text => question_text, :survey_id => @current_survey.id)
  puts "New question added!"
  create_answer
  create_answer
  puts "Enter 'M' to return to the main menu or any key to add another question."
  case gets.chomp.upcase
  when 'M'
    main_menu
  else
    create_question
  end
end

def delete_question
  puts "Enter question id to delete"
  Question.find_by(id: gets.chomp.to_i).destroy
  puts "Question deleted."
  edit_survey
end

def set_current_question

end

def list_questions

end

def show_question

end


# list
# set_current_(x) ..
# show ..
# edit
# create ..
# delete
