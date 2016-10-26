require 'rails_helper'

describe "User can log in" do
  context "they are registered users" do
    scenario "They visit the login page and enter data, see greeating" do
      user = User.create(name: "Jon", email: "j@jon.com", password: "1234")

      visit login_path

      fill_in "User name", with: user.nam
      fill_in "email", with: user.email
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password
      click_on "Login"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content "Hi, Jon"
      expect(page).to have_content "Logout"
    end
  end
end
