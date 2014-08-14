def list_responses
  list_surveys
  puts "Enter the survey id to view:"
  set_current_survey(gets.chomp.to_i)
  @current_survey.questions.each do |q|
    puts q.text
    q.responses.each do |res|
      a = Answer.find_by(id: res.answer_id)
      user = User.find_by(id: res.user_id)
      puts a.text + " (" + user.name + ")"
    end
  end
  list_responses
end
