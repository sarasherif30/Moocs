require 'rails_helper'

RSpec.describe Course, :type => :model do
  subject { Course.new }

  it "is valid with valid attributes" do
    subject.title = "Anything"
    subject.user_id = 9
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    expect(subject).to_not be_valid
  end
 end 