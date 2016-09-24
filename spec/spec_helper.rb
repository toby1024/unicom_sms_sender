require 'rspec'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require 'unicom_sms_sender'

Dir[File.join(File.dirname(__FILE__), "../spec/support/**/*.rb")].sort.each { |f| require f }
RSpec.configure do |config|
  config.color = true
  config.mock_with :rspec
end

UnicomSmsSender.configure do |config|

  config.send_service_id = '111'
  config.send_send_key = '111'
  config.send_cpid = '11111'
  config.send_send_url = 'http://183.136.236.86:8899/smsAccept/sendSms.action'
end
