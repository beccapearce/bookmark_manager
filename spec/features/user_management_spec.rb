require 'spec_helper'
require 'web_helper'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, mali@bum.com')
    expect(User.first.email).to eq ('mali@bum.com')
  end
  scenario 'user signs up with mismatched password' do
    expect{mismatched_password_sign_up}.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Password does not match the confirmation"
  end
  scenario 'user signs up with no email' do
    expect{no_email_sign_up}.not_to change(User, :count)
    expect(page).to have_content "Email has an invalid format"
    expect(current_path).to eq '/users'
  end
  scenario 'user signs up with an invalid email' do
    expect{no_email_sign_up}.not_to change(User, :count)
    expect(page).to have_content "Email has an invalid format"
    expect(current_path).to eq '/users'
  end
  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content "Email is already taken"
  end
end

feature 'User sign in' do

  let!(:user) do
    User.create(email: "email@email.co.uk",
                password: "password123",
                password_confirmation: "password123")
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
