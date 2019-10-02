require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of(:username)}

  describe "associations" do
    # it {should have_many(:goals)}
    # it {should have_many(:comments)}
  end
  
  describe "class methods" do

  end
end
