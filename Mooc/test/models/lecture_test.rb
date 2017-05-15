require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

test "should not save lecture without title" do
  lecture = Lecture.new
  assert lecture.save, "Saved the lecture without a title"
	end
end
