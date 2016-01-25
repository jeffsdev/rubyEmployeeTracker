ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('rspec')
require('pg')
require('employee')

RSpec.configure do |config|
  config.after(:each) do
    Employee.all.each do |e|
      e.destroy
    end
  end
end
