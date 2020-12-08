require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not create an empty user" do
    user = User.create
    assert_not user
  end

  test "username should not be updatable" do
    user = users(:one)
    user.update(username: 'unautrenom')
    assert_equals user.username "johndoe"
  end
end

# Test Driven Development => TDD
# Behavior Drive Development => BDD
