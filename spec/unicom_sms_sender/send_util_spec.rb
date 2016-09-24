require 'spec_helper'
require_relative '../../lib/unicom_sms_sender/send_util'

describe UnicomSmsSender::SendUtil do

  it 'should do something' do
    UnicomSmsSender::SendUtil['skio_boss','test_send','13634171404', 'message'].send
  end
end