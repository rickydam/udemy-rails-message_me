require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @message = messages(:valid_message)
  end

  test 'valid message' do
    assert @message.valid?
  end

  test 'message invalid without body' do
    @message.body = nil
    refute @message.valid?, 'saved message without a body'
    assert_not_nil @message.errors[:body], 'no validation error for missing body'
  end

end
