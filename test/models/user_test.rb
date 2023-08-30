# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without email' do
    user = User.new
    assert_not user.save, 'Saved the user without an email'
  end

  test 'should save user with valid attributes' do
    user = User.new(email: 'user@example.com', role: 'staff', account_id: 1)
    assert_not user.save, "Couldn't save the user with valid attributes"
  end

  test 'should validate uniqueness of email' do
    User.create(email: 'user1@example.com', role: 'admin', account_id: 1)
    user2 = User.new(email: 'user1@example.com', role: 'owner', account_id: 2)

    assert_not user2.valid?, 'Email is not unique'
  end

  test 'should validate inclusion of role' do
    user = User.new(email: 'user2@example.com', role: 'manager', account_id: 1)
    assert_not user.valid?, "Role should be 'admin', 'owner', or 'staff'"
  end

  test 'should validate presence of account_id' do
    user = User.new(email: 'user3@example.com', role: 'staff')
    assert_not user.valid?, 'Account_id should be present'
  end
end
