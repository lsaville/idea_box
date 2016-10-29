require 'rails_helper'

describe "Admin sees all categories" do
  context "As admin" do
    scenario "they visit the categories#index and see all categories" do
      categories = Fabricate.times(2, :category)
      admin = Fabricate(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      expect(page).to have_content "Admin Categories"
      expect(page).to have_content categories[0].name
      expect(page).to have_content categories[1].name
    end
  end

  context "As default user" do
    scenario "they are shown a 404" do
      admin = Fabricate(:user)

      visit admin_categories_path

      expect(page).to_not have_content "Admin Categories"
      expect(page).to have_content "The page you were looking for doesn't exist"
    end
  end
end
