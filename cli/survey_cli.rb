def list_surveys
  puts "Surveys:"
  puts "------------"
  Survey.all.each do |result|
    puts result.id.to_s + " - " + result.name
  end
  ws
end

def start_survey
  header
  list_surveys
  puts "Enter the survey #:"
  num = gets.chomp.to_i
  set_current_survey(num)

  @current_survey.questions.each do |question|
    @current_question = question
    puts question.text
    ws
    list_answers
    puts "Enter answer id:"
    Response.create(question_id: @current_question.id, answer_id: gets.chomp.to_i)
  end
  sleep 1.0
  main_menu
end

def edit_survey
  header
  list_surveys
  puts "Enter the # of the survey to edit:"
  num = gets.chomp.to_i
  @current_survey = Survey.find_by(id: num)
  puts "Editing: " + @current_survey.name
  puts "--------"
  puts "Questions:"
  @current_survey.questions.each do |q|
    @current_question = q
    ws
    puts q.id.to_s + " - " + q.text
    ws
    list_answers
  end
  puts "1 > Change survey name"
  puts "2 > Edit a question"
  puts "3 > Remove a question"
  case gets.chomp
  when '1'
    change_survey_name
  when '2'
    edit_question
  when '3'
    delete_question
  end
end

def set_current_survey survey_id
  @current_survey = Survey.find_by(id: survey_id)
end

def create_survey
  header
  puts "Create a new survey!"
  ws
  puts "Enter the title of your survey:"
  name = gets.chomp
  new_survey = Survey.create(:name => name)
  puts "#{name} survey created!"
  sleep 0.4
  create_question(new_survey.id)
end

def change_survey_name
  puts "Enter the new name for #{@current_survey.name}"
  input = gets.chomp
  @current_survey.update(name: input)
  puts "Survey name changed to #{@current_survey.name}!"
  edit_survey
end

def show_survey survey
end


def delete_survey
  header
  list_surveys
  puts "Enter the # of the survey to delete:"
  num = gets.chomp.to_i
  survey = Survey.find_by(id: num)
  survey.destroy
  puts "Survey deleted!"
  sleep 0.5
  main_menu
end

# list
# set_current_(x) ..
# show ..
# edit
# create ..
# delete
