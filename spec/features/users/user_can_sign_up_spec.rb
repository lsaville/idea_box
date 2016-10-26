require 'rails_helper'

describe "User can sign up" do
  scenario "they visit the sign up page and create an account" do
    visit new_user_path

    fill_in "Name", with: "Fran"
    fill_in "Email", with: "f@gmail.com"
    fill_in "Password", with: "boom"
    fill_in "Password confirmation", with: "boom"
    click_on "Create account"

    expect(page).to have_content "Hi, Fran"
  end
end
