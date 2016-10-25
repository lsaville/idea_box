require "rails_helper"

describe Idea do
  describe "validations" do
    context "with valid attributes" do
      it "is valid with all attributes" do
        user = User.new(user_name: "Fran", email: "f@gmail.com", password: "boom")
        idea = user.ideas.new(name: "great idea")

        expect(idea).to be_valid
      end
    end

    context "with invalid attributes" do
      it "is invalid without a name" do
        user = User.new(user_name: "Fran", email: "f@gmail.com", password: "boom")
        idea = user.ideas.new(name: nil)

        expect(idea).to be_invalid
      end
    end

  end

  describe "Relationships" do
    it "belongs to a user" do
      user = User.new(user_name: "Fran", email: "f@gmail.com", password: "boom")
      idea = user.ideas.new(name: nil)

      expect(idea).to respond_to(:user)
    end
  end
end
