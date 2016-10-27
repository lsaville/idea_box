require 'rails_helper'

describe "admin can edit an existing category" do
  scenario "they click edit and enter a name in category#edit" do
    category = Category.create(name: "app")
    admin = User.create(name: "jon", email: "j@jon.com", password: "1234", password_confirmation: "1234", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path

    click_on "Edit"
    fill_in "category_name", with: "food"
    click_on "Update Category"

    expect(current_path).to eq(admin_categories_path)
    expect(page).to have_content "Successfully updated category!"
    expect(page).to have_content "food"
  end
end
