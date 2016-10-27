require 'rails_helper'

describe "Admin sees all categories" do
  scenario "they visit the categories#index and see all categories" do
    category1 = Category.create(name: "Food")
    category1 = Category.create(name: "App")

    visit categories_path

    expect(page).to have_content "Food"
    expect(page).to have_content "App"
  end
end
