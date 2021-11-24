require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user1) { build(:user, name: "User 1") }
  let!(:user2) { build(:user, name: "A") }
  let!(:user3) { build(:user, name: nil) }

  describe "Validation" do
    it "valid with valid name attribute" do
      expect(user1).to be_valid
    end

    it "invalid with name attribute of less than 3 char" do
      expect(user2).to_not be_valid
    end

    it "invalid with name=nil attribute" do
      expect(user3).to_not be_valid
    end
  end

  describe "Association" do
    
  end


end
