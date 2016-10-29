require 'rails_helper'

describe User do
  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without name" do
        user = Fabricate.build(:user, name: nil)
        
        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        user = Fabricate(:user)

        expect(user).to be_valid
      end
    end
  end

  describe "Relationships" do
    it "has many ideas" do
      user = Fabricate.build(:user)

      expect(user).to respond_to(:ideas)
    end
  end

  describe "role" do
    it "can return admin" do
      user = Fabricate.build(:user, role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it "can return default" do
      user = Fabricate.build(:user)

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end
  end
end
