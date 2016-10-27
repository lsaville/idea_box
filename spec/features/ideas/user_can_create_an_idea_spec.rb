require 'rails_helper'

describe "User can create and idea" do
  scenario "they fill out a form and submit" do
    user = User.create(name: "Jon", email: "j@jon.com", password: "1234")
    category = Category.create(name: "Food")
    visit new_idea_path

    fill_in "name", with: "frozen pizza"
    fill_in "description", with: "frozen bake at home sustenance"
    fill_in "notes", with: "great quick fix for after turing"
    select "Food", :from => "categorySelect"
    click_on "Create Idea"

    expect(current_path).to eq(user_ideas_path(user))
    expect(page).to have_content "frozen pizza"
  end
