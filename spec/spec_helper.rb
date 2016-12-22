$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rspec'
require 'simplecov'
require 'hiera-backend-rspec'

SimpleCov.start

RSpec.shared_context 'local paths' do
  def project_dir
    File.expand_path(File.join(File.dirname(__FILE__), '..'))
  end
end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |c|
  c.mock_with :rspec
  c.color = true
  c.formatter = :documentation
  c.tty = true
end
