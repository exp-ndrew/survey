require 'spec_helper'

describe 'User' do

  it 'has many responses' do
    new_question = Question.create({text: "Do you like pie?"})
    new_user = User.create({name: "John"})
    new_answer1 = Answer.create({text: "Yes", question_id: new_question.id})
    new_answer2 = Answer.create({text: "No", question_id: new_question.id})
    new_answer3 = Answer.create({text: "Maybe", question_id: new_question.id})
    new_response = Response.create({question_id: new_question.id, answer_id: new_answer1.id, user_id: new_user.id})
    expect(new_user.responses).to eq [new_response]
  end
end
