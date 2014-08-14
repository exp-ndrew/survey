require 'pg'
require 'active_record'
require 'pry'
require './lib/survey'
require './lib/question'
require './lib/answer'
require './lib/response'
require './lib/user'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["development"])


@current_survey = nil

def ws
  puts "\n"
end

def header
  system 'clear'
  puts "Survey Elephant"
  ws
end

def main_menu
  header
  puts "T > Take a survey!"
  puts "A > Create a survey!"
  puts "V > View survey results"
  puts "X > Exit"
  case gets.chomp.upcase
  when 'T'
    start_survey
  when 'A'
    make_survey
  when 'V'
    view_results
  when 'X'
    exit
  end
end

def start_survey
  header
  puts "Surveys:"
  puts "------------"
  Survey.all.each do |result|
    puts result.id.to_s + " - " + result.name
  end
  ws
  puts "Enter the survey #:"
  num = gets.chomp.to_i
  choose_survey(num)
  take_survey
end

def choose_survey survey_id
  @current_survey = Survey.find_by(id: survey_id)
end

def take_survey
  @current_question = nil

  @current_survey.questions.each do |question|
    @current_question = question
    puts question.text
    ws
    question.answers.each do |ans|
      puts ans.id.to_s + " - " + ans.text
    end
  end
  puts "Enter answer id:"
  Response.create(question_id: @current_question.id, answer_id: gets.chomp.to_i)
  sleep 1.0
  main_menu
end

def make_survey
  header
  puts "Create a new survey!"
  ws
  puts "Enter the title of your survey:"
  name = gets.chomp
  new_survey = Survey.create(:name => name)
  puts "#{name} survey created!"
  sleep 0.4
  add_questions(new_survey.id)
end

def add_questions survey_id
  header
  puts "Enter a new question:"
  question_text = gets.chomp
  question = Question.create(:text => question_text, :survey_id => survey_id)
  puts "New question added!"
  puts "Enter an answer:"
  Answer.create(:text => gets.chomp, :question_id => question.id)
  puts "Answer added!"
  puts "Enter another answer:"
  Answer.create(:text => gets.chomp, :question_id => question.id)
  puts "Answer added!"
  puts "Enter 'M' to return to the main menu or any key to add another question."
  case gets.chomp.upcase
  when 'M'
    main_menu
  else
    add_questions(survey_id)
  end
end

main_menu
