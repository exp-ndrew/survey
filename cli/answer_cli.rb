def new_answer
  puts "Enter an answer:"
  Answer.create(:text => gets.chomp, :question_id => question.id)
  puts "Answer added!"
end


def list_answers
  puts "Answers:"
  @current_question.answers.each do |a|
    puts a.id.to_s + " - " + a.text
    ws
  end
end
