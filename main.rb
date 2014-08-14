require 'pg'
require 'active_record'
require './lib/survey'
require './lib/question'
require './lib/answer'
require './lib/response'
require './lib/user'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["development"])

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
  Question.create(:text => question_text, :survey_id => survey_id)
  puts "New question added!"
  sleep 0.4
  add_questions(survey_id)
end

main_menu
