require 'pg'
require 'active_record'
require 'pry'
require './lib/survey'
require './lib/question'
require './lib/answer'
require './lib/response'
require './lib/user'
require './cli/survey_cli'
require './cli/question_cli'
require './cli/answer_cli'
require './cli/response_cli'
require './cli/user_cli'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["development"])

def ws
  puts "\n"
end

def header
  system 'clear'
  puts "####################"
  puts "Survey Elephant"
  show_current_user
  ws
end

def show_current_user
  if @current_user == nil
    puts "Current User: None"
  else
    puts "Current User: " + @current_user.name
  end
end

def wait
  sleep 0.5
end
