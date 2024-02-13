require "rails_helper"


RSpec.describe "Log In" do
  it "has a login page" do
    #       As a registered user
    # When I visit the landing page `/`
    # I see a link for "Log In"
    # When I click on "Log In"
    # I'm taken to a Log In page ('/login') where I can input my unique email and password.
    # When I enter my unique email and correct password 
    # I'm taken to my dashboard page
    user_1 = User.create!(name: "Charles", email: "Buckets@gmail.com", password: "cheeseballs")
    visit root_path

    click_link "Log In"
    expect(current_path).to eq(login_path)

    fill_in :email, with: user_1.email
    fill_in :password, with: user_1.password
    click_button 'Log In'
    expect(current_path).to eq(user_path(user_1))

  end

  it "has a sad path for an incorrect password" do
    user_1 = User.create!(name: "Charles", email: "Buckets@gmail.com", password: "cheeseballs")
    visit root_path

    click_link "Log In"
    expect(current_path).to eq(login_path)

    fill_in :email, with: user_1.email
    fill_in :password, with: "wrong_password"
    click_button 'Log In'
    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sorry, credentials are bad")
  end
end
