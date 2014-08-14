require 'spec_helper'


describe 'Question' do

  it 'has many answers' do
    new_question = Question.create(:text => 'Do you like Apples?')
    new_answer1 = Answer.create(:text => 'Yes', :question_id => new_question.id)
    new_answer2 = Answer.create(:text => 'No', :question_id => new_question.id)
    new_answer3 = Answer.create(:text => 'Maybe', :question_id => new_question.id)
    expect(new_question.answers).to eq [new_answer1, new_answer2, new_answer3]
  end
end
