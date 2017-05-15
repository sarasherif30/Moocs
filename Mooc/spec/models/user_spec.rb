require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is not valid without valid attributes" do
    expect(User.new).to_not	 be_valid
  end

  it "is valid with valid attributes" do
    expect(User.new(name: 'saraaaa', email: 'sara@email.com',gender: 'female', password: '1232456')).to	 be_valid
  end
   # it { should have_many(:courses) }
   #  it { should have_many(:lectures) }
end

