require 'rails_helper'

describe "Admin can delete a category" do
  scenario "they visit the index page and click delete" do
    category = Fabricate(:category)
    admin = Fabricate(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path

    within(".category_#{category.name}") do
      click_on "Delete"
    end

    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content "Successfully deleted #{category.name}"
    expect(page).to_not have_css ".category_food"
  end
end
