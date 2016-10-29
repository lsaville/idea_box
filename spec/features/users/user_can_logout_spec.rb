require 'rails_helper'

describe "User can logout" do
  scenario "they click a logout out button and are logged out" do
    user = Fabricate(:user)

    visit login_path

    within("form") do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Login"
    end

    click_on "Logout"

    expect(current_path).to eq(login_path)
    expect(page).to have_content "Successfully logged out!"
    expect(page).to have_content "Login"
  end
end
