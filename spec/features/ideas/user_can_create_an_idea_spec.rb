require 'rails_helper'

describe "User can create and idea" do
  scenario "they fill out a form and submit" do
    user = Fabricate(:user)
    category = Fabricate(:category)
    visit new_user_idea_path(user)

    fill_in "idea_name", with: "frozen pizza"
    fill_in "idea_description", with: "frozen bake at home sustenance"
    fill_in "idea_notes", with: "great quick fix for after turing"
    select category.name, :from => "idea_category_id"
    click_on "Create Idea"

    expect(current_path).to eq(user_idea_path(user, user.ideas[0]))
    expect(page).to have_content "Successfully created an idea!"
    expect(page).to have_content "frozen pizza"
  end
end
