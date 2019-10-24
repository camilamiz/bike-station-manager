require 'rails_helper'

RSpec.describe User, :type => :model do
    it "is valid with valid attributes" do
      user = build(:bike)
      expect(user).to be_valid
    end

    it "has a document number" do
        user2 = build(:user, document_number: nil)
        expect(user2).to_not be_valid
    end

    it "has a unique document number" do
      user1 = create(:user)
      user2 = build(:user, document_number: '12345678901')
      expect(user2).to_not be_valid
  end
end