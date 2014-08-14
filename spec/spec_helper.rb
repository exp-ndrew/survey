require 'rspec'
require 'pg'
require 'active_record'
require 'shoulda/matchers'
require 'pry'
require 'survey'
require 'question'
require 'response'


ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])
