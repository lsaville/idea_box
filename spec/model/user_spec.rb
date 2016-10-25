require 'rails_helper'

describe User do
  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without name" do
        user = User.new
        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "" do
      end
    end
  end

  describe "Relationships" do
    it "" do
    end
  end
end
