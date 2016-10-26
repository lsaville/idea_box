require 'rails_helper'

describe "User can sign up" do
  scenario "they visit the sign up page and create an account" do
    visit new_user_path

    fill_in "name", with: "Fran"
    fill_in "email", with: "f@gmail.com"
    fill_in "password", with: "boom"
    fill_in "password_confirmation", with: "boom"
    click_on "Create account"

    expect(page).to have_content "Hi, Fran"
  end
end
