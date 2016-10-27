require 'rails_helper'

describe "Admin can create a category" do
  scenario "they fill the form in the category page and submit" do
    visit new_category_path

    fill_in "category_name", with: "app"
    click_on "Create Category"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content "app"
  end
end
