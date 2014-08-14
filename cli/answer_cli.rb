def create_answer
  puts "Enter an answer:"
  Answer.create(:text => gets.chomp, :question_id => @current_question.id)
  puts "Answer added!"
end


def list_answers
  puts "Answers:"
  @current_question.answers.each do |a|
    puts a.id.to_s + " - " + a.text
    ws
  end
end

def delete_answer
  puts "Enter answer id to delete"
  Answer.find_by(id: gets.chomp.to_i).destroy
  puts "Answer deleted."
end


# list
# create
# delete
