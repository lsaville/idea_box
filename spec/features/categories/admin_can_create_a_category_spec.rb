require 'rails_helper'

describe "Admin can create a category" do
  scenario "they fill the form in the category page and submit" do
    admin = User.create(name: "jon", email: "j@jon.com", password: "1234", password_confirmation: "1234", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_category_path

    fill_in "category_name", with: "app"
    click_on "Create Category"

    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content "app"
  end
end
