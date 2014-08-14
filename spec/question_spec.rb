require 'spec_helper'


describe 'Question' do

  it 'has many responses' do
    new_question = Question.create(:text => 'Do you like Apples?')
    new_response1 = Response.create(:text => 'Yes')
    new_response2 = Response.create(:text => 'No')
    new_response3 = Response.create(:text => 'Maybe')
    binding.pry
    expect(new_question.responses).to eq [new_response1, new_response2, new_response3]
  end
end
