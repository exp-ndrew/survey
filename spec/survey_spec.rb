require 'spec_helper'


describe 'Survey' do

  it 'adds a question to a survey' do
    test_survey = Survey.create({name: "Food"})
    test_question = Question.create({text: "What is your favorite type of apple?"})
    Survey.joins(:questions)
    test_question.assign_to(test_survey.id)
    expect(test_survey.questions).to eq [test_question]
  end

end
