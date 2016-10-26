require 'rails_helper'

describe Category do
  describe "validations" do
    context "valid attributes" do
      it "is valid with a name" do
        category = Category.new(name: "productivity")
        expect(category).to be_valid
      end
    end

    context "invalid attributes" do
      it "is invalid without a name" do
        category = Category.new
        expect(category).to be_invalid
      end
    end
  end

  describe "Relationships" do
    it "has many ideas" do
      category = Category.new(name: "productivity")
      expect(category).to respond_to(:ideas)
    end
  end
end
