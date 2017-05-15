require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not sign up without name and email" do
  user = User.new
  assert_not user.save
	end
  test "the truth" do
     assert User.first.email="sara@yahoo.com"
   end
end
