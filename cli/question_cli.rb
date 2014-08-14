def create_question survey_id
  header
  puts "Enter a new question:"
  question_text = gets.chomp
  @current_question = Question.create(:text => question_text, :survey_id => survey_id)
  puts "New question added!"
  create_answer
  create_answer
  puts "Enter 'M' to return to the main menu or any key to add another question."
  case gets.chomp.upcase
  when 'M'
    main_menu
  else
    create_question(survey_id)
  end
end

def edit_question

end

def delete_question

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
