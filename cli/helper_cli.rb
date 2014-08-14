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
  puts "Survey Elephant"
  ws
end

def wait
  sleep 0.5
end
