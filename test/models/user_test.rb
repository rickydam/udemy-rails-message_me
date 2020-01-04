require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:valid)
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without username' do
    @user.username = nil
    refute @user.valid?, 'saved user without a name'
    assert_not_nil @user.errors[:username], 'no validation error for name present'
  end

  test 'invalid without password' do
    @user.password = nil
    refute @user.valid?
    assert_not_nil @user.errors[:password]
  end

  test 'username should not be too long' do
    @user.username = 'r' * 20
    assert_not @user.valid?
  end

  test 'username should not be too short' do
    @user.username = 'rr'
    assert_not @user.valid?
  end

end
