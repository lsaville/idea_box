require 'rails_helper'

describe Image do
  describe "Attributes" do
    context "valid attributes" do
      it "is valid with a url" do
        idea = Fabricate(:idea)
        image = idea.images.new(url: "http.something")

        expect(image).to be_valid
      end
    end

    context "invalid attributes" do
      it "is invalid without url" do
        idea = Fabricate(:idea)
        image = idea.images.new

        expect(image).to be_invalid
      end
    end
  end

  describe "Relationships" do
    it "has many ideas" do
      idea = Fabricate(:idea)
      image = idea.images.new(url: "http://something.com")

      expect(image).to respond_to(:ideas)
    end
  end
end
