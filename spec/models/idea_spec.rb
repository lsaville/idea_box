require "rails_helper"

describe Idea do
  describe "validations" do
    context "with valid attributes" do
      it "is valid with all attributes" do
        idea = Fabricate.build(:idea)

        expect(idea).to be_valid
      end
    end

    context "with invalid attributes" do
      it "is invalid without a name" do
        idea = Fabricate.build(:idea, name: nil)

        expect(idea).to be_invalid
      end
    end

  end

  describe "Relationships" do
    it "belongs to a user" do
      idea = Fabricate(:idea)

      expect(idea).to respond_to(:user)
    end

    it "belongs to a category" do
      idea = Fabricate(:idea)

      expect(idea).to respond_to(:category)
    end

    it "has many images" do
      idea = Fabricate(:idea)
      
      expect(idea).to respond_to(:images)
    end
  end
end
