require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  test 'channel_valid' do
    channel = Channel.new
    channel.title = "TestValid"
    channel.streaming_platform = "Twetch"
    channel.subscribers = 20
    assert channel.valid?, true
  end
  test 'channel_invalid' do
    channel = Channel.new
    channel.title = "TestInvalid"
    channel.streaming_platform = "ITube"
    channel.subscribers = -1
    assert channel.invalid?, true
  end
end
