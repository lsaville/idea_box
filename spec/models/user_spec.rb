require 'rails_helper'

describe User do
  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without name" do
        user = User.new(email: "f@gmail.com", password: "boom")
        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        user = User.new(name: "Fran", email: "f@gmail.com", password: "boom" )
        expect(user).to be_valid
      end
    end
  end

  describe "Relationships" do
    it "has many ideas" do
      user = User.new(name: "Fran", email: "f@gmail.com", password: "boom")
      expect(user).to respond_to(:ideas)
    end
  end
end
