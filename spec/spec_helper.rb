require 'rspec'
require 'pg'
require 'active_record'
require 'shoulda/matchers'
require 'pry'
require 'survey'
require 'question'
require 'response'


ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Survey.all.each { |x| x.destroy }
    Question.all.each { |x| x.destroy }
    Response.all.each { |x| x.destroy }
    Answer.all.each { |x| x.destroy }
    User.all.each { |x| x.destroy }
  end
end
