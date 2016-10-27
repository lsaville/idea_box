require 'rails_helper'

describe "Admin sees all categories" do
  context "As admin" do
    scenario "they visit the categories#index and see all categories" do
      category1 = Category.create(name: "Food")
      category1 = Category.create(name: "App")
      admin = User.create(name: "jon", email: "j@jon.com", password: "1234", password_confirmation: "1234", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      expect(page).to have_content "Admin Categories"
      expect(page).to have_content "Food"
      expect(page).to have_content "App"
    end
  end

  context "As default user" do
    scenario "they are shown a 404" do
      admin = User.create(name: "jon", email: "j@jon.com", password: "1234", password_confirmation: "1234")

      visit admin_categories_path

      expect(page).to_not have_content "Admin Categories"
      expect(page).to have_content "The page you were looking for doesn't exist"
    end
  end
end
