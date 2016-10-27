require 'rails_helper'

describe "Admin can delete a category" do
  scenario "they visit the index page and click delete" do
    category = Category.create(name: "food")

    visit categories_path

    within(".category_food") do
      click_on "Delete"
    end

    expect(current_path).to eq(categories_path)
    expect(page).to have_content "Successfully deleted #{category.name}"
    expect(page).to_not have_css ".category_food"
  end
end
