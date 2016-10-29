require 'rails_helper'

describe Category do
  describe "validations" do
    context "valid attributes" do
      it "is valid with a name" do
        category = Fabricate(:category)

        expect(category).to be_valid
      end
    end

    context "invalid attributes" do
      it "is invalid without a name" do
        category = Fabricate.build(:category, name: nil)

        expect(category).to be_invalid
      end
    end
  end

  describe "Relationships" do
    it "has many ideas" do
      category = Fabricate(:category)
      
      expect(category).to respond_to(:ideas)
    end
  end
end
