require 'rspec'
require 'simplecov'
require 'hiera-backend-rspec'

SimpleCov.start

RSpec.configure do |c|
  c.mock_with :rspec
  c.color = true
  c.formatter = :documentation
  c.tty = true
end
