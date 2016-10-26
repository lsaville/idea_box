require 'rails_helper'

describe Image do
  describe "Attributes" do
    context "valid attributes" do
      it "is valid with a url" do
        user = User.new(user_name: "Fran", email: "f@gmail.com", password: "boom")
        idea = user.ideas.new(name: "flying bicycle")
        image = idea.images.new(url: "http.something")

        expect(image).to be_valid
      end
    end

    context "invalid attributes" do
      it "is invalid without url" do
        user = User.new(user_name: "Fran", email: "f@gmail.com", password: "boom")
        idea = user.ideas.new(name: "flying bicycle")
        image = idea.images.new

        expect(image).to be_invalid
      end
    end
  end

  describe "Relationships" do
    it "has many ideas" do
      user = User.new(user_name: "Fran", email: "f@gmail.com", password: "boom")
      idea = user.ideas.new(name: "flying bicycle")
      image = idea.images.new(url: "http.something")

      expect(image).to respond_to(:ideas)
    end
  end
end
