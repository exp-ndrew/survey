require 'rspec'
require 'pry'
require 'pg'
require 'survey'
require 'question'
require 'response'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Survey.all.each { |product| product.destroy }
  end
end