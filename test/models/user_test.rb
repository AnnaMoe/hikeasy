require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "first_name returns first name" do
    user = User.new(first_name: "Anna")
    assert_equal "Anna", user.first_name
  end
end
