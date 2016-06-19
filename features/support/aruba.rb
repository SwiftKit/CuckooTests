require 'aruba/cucumber'

Aruba.configure do |config|
    config.exit_timeout = 1000
    config.working_directory = 'tmp'
end